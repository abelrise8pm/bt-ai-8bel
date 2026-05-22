buildscript {
    extra["PLUGIN_VERSION"] = "1.0"
    extra["ATAK_VERSION"] = "5.5.0"

    val takdevPlugin = "$rootDir/atak/atak-gradle-takdev.jar"

    fun getValueFromPropertiesFile(
        propFile: java.io.File,
        key: String,
    ): String? {
        if (!propFile.isFile || !propFile.canRead()) {
            return null
        }
        @Suppress("UNRESOLVED_REFERENCE")
        val prop = java.util.Properties()
        val reader = propFile.reader()
        try {
            prop.load(reader)
        } finally {
            reader.close()
        }
        return prop.getProperty(key)
    }

    fun getProperty(
        name: String,
        defValue: String,
    ): String {
        val prop =
            project.properties[name] as String?
                ?: getValueFromPropertiesFile(project.rootProject.file("local.properties"), name)
        return prop ?: defValue
    }

    val urlKey = "takrepo.url"

    extra.set(
        "isDevKitEnabled",
        object : groovy.lang.Closure<Boolean>(this) {
            fun doCall(): Boolean = getProperty(urlKey, "") != ""
        },
    )
    extra["takrepoUrl"] = getProperty(urlKey, "https://localhost/")
    extra["takrepoUser"] = getProperty("takrepo.user", "invalid")
    extra["takrepoPassword"] = getProperty("takrepo.password", "invalid")
    extra["takdevPlugin"] = takdevPlugin

    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        classpath("com.android.tools.build:gradle:8.13.0")
        classpath(files(takdevPlugin))
        classpath("com.google.dagger:hilt-android-gradle-plugin:2.57.2")
    }
}

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("com.google.devtools.ksp")
    id("com.google.dagger.hilt.android")
    id("jacoco")
}

// Apply the custom plugin after plugins block
apply(plugin = "atak-takdev-plugin", from = "../gradle/typst.gradle")
apply(plugin = "dagger.hilt.android.plugin")

// Helper functions for version generation using providers API
val gitVersionCode =
    providers
        .exec {
            commandLine("git", "show", "-s", "--format=%ct")
        }.standardOutput.asText
        .map { output ->
            val describe = output.trim()
            val preIndex = describe.indexOf('-')
            val code =
                if (preIndex != -1) {
                    Integer.parseInt(describe.substring(0, preIndex))
                } else {
                    Integer.parseInt(describe)
                }
            println("version[git]: $code")
            code
        }.orElse(1)

val gitVersionName =
    providers
        .exec {
            commandLine("git", "show", "-s", "--format=%h")
        }.standardOutput.asText
        .map { output ->
            val describe = output.trim()
            println("versionName[git]: $describe")
            describe
        }.orElse("na")

val pluginVersion = extra["PLUGIN_VERSION"] as String
val atakVersion = extra["ATAK_VERSION"] as String

android {
    compileSdk = 36
    namespace = "us.rise8.atak.grg.plugin"

    buildFeatures {
        buildConfig = true
    }

    bundle {
        storeArchive {
            enable = false
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlin {
        compilerOptions {
            jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
            freeCompilerArgs.add("-Xannotation-default-target=param-property")
        }
    }
    packaging {
        jniLibs {
            useLegacyPackaging = true
            // Exclude ONNX Runtime libraries from stripping as they are prebuilt
            // and don't contain debug symbols            keepDebugSymbols += "**/libonnxruntime.so"
            keepDebugSymbols += "**/libonnxruntime4j_jni.so"
        }
        resources {
            excludes += "/META-INF/{AL2.0,LGPL2.1}"
        }
    }
    signingConfigs {
        getByName("debug") {
            storeFile = file("$rootDir/atak/android_keystore")
            storePassword = "tnttnt"
            keyAlias = "wintec_mapping"
            keyPassword = "tnttnt"
        }
        create("release") {
            storeFile = file("$rootDir/atak/android_keystore")
            storePassword = "tnttnt"
            keyAlias = "wintec_mapping"
            keyPassword = "tnttnt"
        }
    }
    buildTypes {
        getByName("debug") {
            isDebuggable = true
            matchingFallbacks += "sdk"
            enableAndroidTestCoverage = true
        }
        getByName("release") {
            isMinifyEnabled = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro",
            )
            signingConfig = signingConfigs.getByName("release")
            matchingFallbacks += "odk"
        }
    }
    flavorDimensions += "application"

    productFlavors {
        create("civ") {
            isDefault = true
            dimension = "application"
            manifestPlaceholders["atakApiVersion"] = "com.atakmap.app@$atakVersion.CIV"
        }
        create("mil") {
            isDefault = true
            dimension = "application"
            manifestPlaceholders["atakApiVersion"] = "com.atakmap.app@$atakVersion.MIL"
        }
    }
    sourceSets {
        getByName("main") {
            setProperty(
                "archivesBaseName",
                "Rise8-ATAK-GRG-Plugin-$pluginVersion-${gitVersionName.get()}-$atakVersion",
            )
        }
        getByName("debug").setRoot("build-types/debug")
        getByName("release").setRoot("build-types/release")
    }

    defaultConfig {
        minSdk = 24
        targetSdk = 34
        versionCode = gitVersionCode.get()
        versionName = "$pluginVersion (${gitVersionName.get()}) - [$atakVersion]"

        ndk {
            abiFilters += setOf("armeabi-v7a", "arm64-v8a", "x86", "x86_64")
        }

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    testOptions {
        animationsDisabled = true
        unitTests {
            isReturnDefaultValues = true
        }
    }
    lint {
        abortOnError = false
        checkReleaseBuilds = true
    }

    buildToolsVersion = "35.0.0"
}

// KSP configuration for Dagger/Hilt
ksp {
    // Pass arguments to KSP processor
    arg("dagger.hilt.android.internal.disableAndroidSuperclassValidation", "true")
    arg("dagger.fastInit", "enabled")
    arg("dagger.formatGeneratedSource", "disabled")
}

// JaCoCo configuration
configure<JacocoPluginExtension> {
    toolVersion = "0.8.11"
}

tasks.register<JacocoReport>("jacocoTestReport") {
    dependsOn("testCivDebugUnitTest")
    mustRunAfter("compileCivDebugKotlin", "compileCivDebugJavaWithJavac")

    reports {
        xml.required.set(true)
        html.required.set(true)
    }

    val fileFilter =
        listOf(
            // Generated code
            "**/R.class",
            "**/R$*.class",
            "**/BuildConfig.*",
            "**/Manifest*.*",
            "**/*Test*.*",
            "android/**/*.*",
            // Dagger/Hilt generated code
            "**/*_MembersInjector.class",
            "**/*_Factory.class",
            "**/*_HiltModules*",
            "**/*Module_*",
            "**/*Dagger*",
            "**/*Hilt*",
            "**/*_Impl*",
            "**/databinding/**",
            // All DI modules (Dagger/Hilt - not unit testable)
            "**/di/**",
            // Android UI components (require instrumentation tests)
            "**/*Fragment.class",
            "**/*Fragment$*.class",
            "**/*ViewModel.class",
            "**/*ViewModel$*.class",
            "**/*Activity.class",
            "**/*Activity$*.class",
            // Android services and managers (require Android runtime)
            "**/*Service.class",
            "**/*Service$*.class",
            "**/*Manager.class",
            "**/*Manager$*.class",
            // BroadcastReceivers (require Android runtime)
            "**/*Receiver.class",
            "**/*Receiver$*.class",
            // Dialogs and Adapters (require Android runtime)
            "**/*Dialog.class",
            "**/*Dialog$*.class",
            "**/*Adapter.class",
            "**/*Adapter$*.class",
            // Plugin infrastructure (requires ATAK runtime)
            "**/plugin/GrgPlugin.class",
            "**/plugin/GrgPlugin$*.class",
            // Deeplink handling (requires Android runtime)
            "**/deeplink/**",
            // Core coordinators (use android.util.Log and require runtime)
            "**/core/DetectionCoordinator.class",
            "**/core/DetectionCoordinator$*.class",
            "**/core/IDetectionCoordinator.class",
            // Map subsystem (requires ATAK MapView, Marker, GeoPoint)
            "**/core/map/**",
            // Overlay subsystem (requires ATAK runtime)
            "**/core/overlay/**",
            // Navigation (requires Android Fragment management)
            "**/features/common/navigation/**",
            // GRG subsystems requiring Android/ATAK runtime
            "**/core/grg/data/capture/**",
            "**/core/grg/data/export/**",
            "**/core/grg/data/grid/**",
            "**/core/grg/data/persistence/**",
            "**/core/grg/data/GRGBuildManager.class",
            "**/core/grg/data/GRGBuildManager$*.class",
            "**/core/grg/data/GRGService.class",
            "**/core/grg/data/GRGService$*.class",
            "**/core/grg/domain/IGRGBuildManager.class",
            "**/core/grg/domain/IGRGService.class",
            // GRG rendering components (require ATAK/Android runtime)
            "**/core/grg/rendering/**",
            // CV subsystem requiring Android/ONNX runtime
            "**/core/cv/data/BuildingDetectionHandler.class",
            "**/core/cv/data/BuildingDetectionHandler$*.class",
            "**/core/cv/domain/IBuildingDetectionHandler.class",
            // Widgets and Custom Views (require Android runtime)
            "**/widgets/**",
            "**/*Widget.class",
            "**/*Widget$*.class",
            "**/GRGView.class",
            "**/SwipePathOverlay.class",
            // Toolbars (require Android runtime)
            "**/*Toolbar.class",
            "**/*Toolbar$*.class",
            // Renderers (require Android runtime)
            "**/*Renderer.class",
            "**/*Renderer$*.class",
            // Dispatcher infrastructure (DI/Coroutines)
            "**/core/dispatchers/**",
            // Coordinate system (may require Android context)
            "**/core/coordinate/**",
            // Menu and State Management (require Android runtime)
            "**/*MenuFactory.class",
            "**/*MenuHandler.class",
            "**/*StateManager.class",
            "**/*RadialMenuManager.class",
            "**/*RelabelManager.class",
            // UI components (require Android runtime)
            "**/ui/**",
            "**/ColorButton.class",
            // Utilities requiring Android Context
            "**/common/utils/**",
            "**/common/config/ColorConfig.class",
            "**/common/config/PreferenceKeys.class",
            // Interfaces and abstractions (no implementation to test)
            "**/domain/export/**",
            "**/domain/capture/**",
            "**/common/dispatchers/**",
            "**/common/config/**",
            "**/plugin/GRGDropDownReceiver.class",
            "**/plugin/GRGMapComponent.class",
            "**/core/PluginContext.class",
            // UI State Management (requires Android runtime)
            "**/features/**/state/**",
            // UseCases requiring Android/ATAK SDK (Bitmap, Canvas, etc.)
            "**/detections/domain/usecases/**",
            "**/grg/utils/**",
            // Overlay parameters (require Android/ATAK SDK for JSON/Color parsing)
            "**/OverlayParams*.class",
            "**/CrosshairParams.class",
            "**/CompassParams.class",
            "**/ScaleBarParams.class",
            "**/InfoBoxParams.class",
            "**/GridParams.class",
            "**/GridLabelParams.class",
            "**/PointListParams*.class",
            // Model classes with Android dependencies (Bitmap, Color, GeoPoint)
            "**/GRGCaptureState.class",
            "**/CapturedMapItem.class",
            "**/GRGWorkflowState.class",
            "**/GRGGridParams.class",
            "**/InfoBoxConfig.class",
            "**/CompassConfig.class",
            "**/ScaleBarConfig.class",
            "**/PointListConfig.class",
            "**/PointListItem.class",
            "**/GRGDisplaySettings.class",
            "**/GRGCaptureResult.class",
        )

    val debugTree =
        fileTree("${layout.buildDirectory.get()}/tmp/kotlin-classes/civDebug") {
            exclude(fileFilter)
        }

    val mainSrc = "${project.projectDir}/src/main/java"

    sourceDirectories.setFrom(files(mainSrc))
    classDirectories.setFrom(files(debugTree))
    executionData.setFrom(
        fileTree("${layout.buildDirectory.get()}/jacoco") {
            include("**/*.exec", "**/*.ec")
        },
        fileTree("${layout.buildDirectory.get()}/outputs/unit_test_code_coverage") {
            include("**/*.exec", "**/*.ec")
        },
    )
}

// Automatically generate coverage reports after running tests
tasks.withType<Test> {
    finalizedBy(tasks.named("jacocoTestReport"))
}

// Optional: Add coverage verification task
tasks.register<JacocoCoverageVerification>("jacocoTestCoverageVerification") {
    dependsOn("jacocoTestReport")

    violationRules {
        // Report violations as warnings without failing the build
        isFailOnViolation = false

        rule {
            limit {
                minimum = "0.80".toBigDecimal()
            }
        }    }
    // Use the same fileFilter as jacocoTestReport
    val fileFilter =
        listOf(
            // Generated code
            "**/R.class",
            "**/R$*.class",
            "**/BuildConfig.*",
            "**/Manifest*.*",
            "**/*Test*.*",
            "android/**/*.*",
            // Dagger/Hilt generated code
            "**/*_MembersInjector.class",
            "**/*_Factory.class",
            "**/*_HiltModules*",
            "**/*Module_*",
            "**/*Dagger*",
            "**/*Hilt*",
            "**/*_Impl*",
            "**/databinding/**",
            // All DI modules (Dagger/Hilt - not unit testable)
            "**/di/**",
            // Android UI components (require instrumentation tests)
            "**/*Fragment.class",
            "**/*Fragment$*.class",
            "**/*ViewModel.class",
            "**/*ViewModel$*.class",
            "**/*Activity.class",
            "**/*Activity$*.class",
            // Android services and managers (require Android runtime)
            "**/*Service.class",
            "**/*Service$*.class",
            "**/*Manager.class",
            "**/*Manager$*.class",
            // BroadcastReceivers (require Android runtime)
            "**/*Receiver.class",
            "**/*Receiver$*.class",
            // Dialogs and Adapters (require Android runtime)
            "**/*Dialog.class",
            "**/*Dialog$*.class",
            "**/*Adapter.class",
            "**/*Adapter$*.class",
            // Plugin infrastructure (requires ATAK runtime)
            "**/plugin/GrgPlugin.class",
            "**/plugin/GrgPlugin$*.class",
            // Deeplink handling (requires Android runtime)
            "**/deeplink/**",
            // Core coordinators (use android.util.Log and require runtime)
            "**/core/DetectionCoordinator.class",
            "**/core/DetectionCoordinator$*.class",
            "**/core/IDetectionCoordinator.class",
            // Map subsystem (requires ATAK MapView, Marker, GeoPoint)
            "**/core/map/**",
            // Overlay subsystem (requires ATAK runtime)
            "**/core/overlay/**",
            // Navigation (requires Android Fragment management)
            "**/features/common/navigation/**",
            // GRG subsystems requiring Android/ATAK runtime
            "**/core/grg/data/capture/**",
            "**/core/grg/data/export/**",
            "**/core/grg/data/grid/**",
            "**/core/grg/data/persistence/**",
            "**/core/grg/data/GRGBuildManager.class",
            "**/core/grg/data/GRGBuildManager$*.class",
            "**/core/grg/data/GRGService.class",
            "**/core/grg/data/GRGService$*.class",
            "**/core/grg/domain/IGRGBuildManager.class",
            "**/core/grg/domain/IGRGService.class",
            // GRG rendering components (require ATAK/Android runtime)
            "**/core/grg/rendering/**",
            // CV subsystem requiring Android/ONNX runtime
            "**/core/cv/data/BuildingDetectionHandler.class",
            "**/core/cv/data/BuildingDetectionHandler$*.class",
            "**/core/cv/domain/IBuildingDetectionHandler.class",
            // Widgets and Custom Views (require Android runtime)
            "**/widgets/**",
            "**/*Widget.class",
            "**/*Widget$*.class",
            "**/GRGView.class",
            "**/SwipePathOverlay.class",
            // Toolbars (require Android runtime)
            "**/*Toolbar.class",
            "**/*Toolbar$*.class",
            // Renderers (require Android runtime)
            "**/*Renderer.class",
            "**/*Renderer$*.class",
            // Dispatcher infrastructure (DI/Coroutines)
            "**/core/dispatchers/**",
            // Coordinate system (may require Android context)
            "**/core/coordinate/**",
            // Menu and State Management (require Android runtime)
            "**/*MenuFactory.class",
            "**/*MenuHandler.class",
            "**/*StateManager.class",
            "**/*RadialMenuManager.class",
            "**/*RelabelManager.class",
            // UI components (require Android runtime)
            "**/ui/**",
            "**/ColorButton.class",
            // Utilities requiring Android Context
            "**/common/utils/**",
            "**/common/config/ColorConfig.class",
            "**/common/config/PreferenceKeys.class",
            // Interfaces and abstractions (no implementation to test)
            "**/domain/export/**",
            "**/domain/capture/**",
            "**/common/dispatchers/**",
            "**/common/config/**",
            "**/plugin/GRGDropDownReceiver.class",
            "**/plugin/GRGMapComponent.class",
            "**/core/PluginContext.class",
            // UI State Management (requires Android runtime)
            "**/features/**/state/**",
            // UseCases requiring Android/ATAK SDK (Bitmap, Canvas, etc.)
            "**/detections/domain/usecases/**",
            "**/grg/utils/**",
            // Overlay parameters (require Android/ATAK SDK for JSON/Color parsing)
            "**/OverlayParams*.class",
            "**/CrosshairParams.class",
            "**/CompassParams.class",
            "**/ScaleBarParams.class",
            "**/InfoBoxParams.class",
            "**/GridParams.class",
            "**/GridLabelParams.class",
            "**/PointListParams*.class",
            // Model classes with Android dependencies (Bitmap, Color, GeoPoint)
            "**/GRGCaptureState.class",
            "**/CapturedMapItem.class",
            "**/GRGWorkflowState.class",
            "**/GRGGridParams.class",
            "**/InfoBoxConfig.class",
            "**/CompassConfig.class",
            "**/ScaleBarConfig.class",
            "**/PointListConfig.class",
            "**/PointListItem.class",
            "**/GRGDisplaySettings.class",
            "**/GRGCaptureResult.class",
        )

    val debugTree =
        fileTree("${layout.buildDirectory.get()}/tmp/kotlin-classes/civDebug") {
            exclude(fileFilter)
        }

    classDirectories.setFrom(files(debugTree))
    executionData.setFrom(
        fileTree(layout.buildDirectory) {
            include("**/*.exec", "**/*.ec")
        },
    )
}

dependencies {
    implementation(files("$rootDir/libs/grg-tak-sdk-android-debug.aar"))
    implementation("androidx.core:core-ktx:1.17.0")
    compileOnly(files("$rootDir/atak/main.jar"))
    implementation("com.fasterxml.jackson.core:jackson-core:2.20.0")
    implementation("com.fasterxml.jackson.core:jackson-databind:2.20.0")
    implementation("com.google.dagger:hilt-android:2.57.2")
    ksp("com.google.dagger:hilt-android-compiler:2.57.2")

    // ONNX Runtime for Android
    implementation("com.microsoft.onnxruntime:onnxruntime-android:1.23.1")

    // Coroutines support
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.10.2")

    // Unit testing
    testImplementation("junit:junit:4.13.2")
    testImplementation(files("$rootDir/atak/main.jar"))
    testImplementation("io.mockk:mockk:1.14.6")
    testImplementation("com.google.truth:truth:1.4.5")
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-test:1.10.2")

    // Android instrumentation testing
    androidTestImplementation("androidx.test.ext:junit:1.3.0")
}