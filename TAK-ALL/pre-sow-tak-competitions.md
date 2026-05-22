# Sprint Review & Demo : 25 Sept '25

### TLDR: S1 , Oct 24
  * The core objective is reducing planner time and cognitive load, measured by time, accuracy, and velocity.
  * The contract roadmap includes initial AI marker generation and a full Human-in-the-Loop workflow.
  * The AI approach uses ONNX runtime, image tiling, and a central "train once, build once" library.
  * Rigorous TDD and DevSecOps enforce quality with security, code coverage, and testing pipeline gates.
  * Validation shows 80-90% AI accuracy with edit ability is highly valuable for tight timeframes.

### Key Performance Indicators
Our primary goal is to empower Planners by reducing the time and cognitive load required to create complete and accurate Gridded Reference Graphics (SOO 3.0).

This efficiency allows Planners more time for critical pre-missix on activities—like briefings, prep, and gear setup—ultimately reducing risk and increasing mission success.

To measure our success, we will track the following:
* Time & Accuracy: The time a GRG user takes to complete an AI-assisted GRG.
* Cognitive Load: The mental effort required to complete the task (measured via a survey scale).
* Velocity: Completed story points.

### Slide #9: AI Model Training

* Establish a comprehensive workflow for model training and testing.
Augment the training data by labeling images in Computer Vision Annotation Tool (CVAT).
* Train models in AWS SageMaker to achieve higher performance.
* Benchmark the model's building detection rate across six specific Areas of Interest (AOIs).

- trainable weights, frozen weights
input image -[1]-> semantic segmentation --> segmentation mask -[3]-> Segmentation-Guided Diffusion --> Synthetic Data --> Training Data
- Label (building Mask)

### Slide #10: AI Model Interface

* AI engine: The ONNX runtime was chosen after successfully outperforming TensorFlow Lite and PyTorch for Windows and Android edge devices.
* Pre-processing: The model performs best on a 256x256 image, so we break down the larger AOI into 256x256 image tiles.
* Post-processing: The model outputs building detections as segmentation masks (blue rectangles). These polygons are then processed to calculate a center point for placing a final Cursor on Target (COT) marker.

### Slide #11: AI Approach - 
**Maximize Operational value and reduce risk**

* Saving time and resources by adopting a "train once, build once" AI library
* Simplify vulnerability management with a centralized library, allowing security patches to be fixed once and deployed everywhere.

Training Data --|
                --> AWS SageMaker --> trained Model --> Building Detection SDK
Base Model    --|

= WINTAK plugin & ATAK PLugin

### Slide #13: Testing

**Reliability and Consistency across Platforms (SOO 4.10)**
* Enforcing rigorous, upfront testing from the start
* Implement Test-Driven Development (TDD) for all new features
* UI testing scenarios are defined using clear, natural language (Gherkin)

Ensures complete feature and test consistency across both the ATAK and WINTAK platforms, meaning users get the same reliable experience regardless of the device they use.

### slide #14: DevSecOps Integration

**CI Pipeline is gated by:**
- Failure to meet Code Quality and Linting standards.
- Test Failures or below-threshold Code Coverage.
- Security risks, including failing Security Scans or exceeding defined CVE thresholds.

- **Track and verify compliance with NIST SP `800-218` and NIST `800-53`**

- **Dedicated ATAK and WINTAK plugin projects created and ready for integration with TAK Forge**
- **Note that specialized pipelines for the AI SDK and AI Model will not yet be fully covered by TAK Forge.**

### Slide 18 - User Insights

* Differing methods of building labeling - drawn sections, target to radial direction series, clock face. Grouped sections identified as common use case.
* Target location + approach direction can affect labeling technique.* 
* OpSec considerations - target identification, dates
* A defined center point is an important part of GRG creation.
* Color has specific meaning, auto-generated icons should be conservative in color.
* Gained mission and operational context about GRG creation task - macro/micro use cases, time taken, and cognitive load creating GRGs.
* Specific risks of tight time frames (less than 2-3h) where AI could mean the difference between having a sheet of music or having none.

# Sprint Review & Demo : 10 October '25
### TLDR: S3 , Oct 10
  * The AI-assisted tool drastically reduces the time and cognitive load required to create Gridded Reference Graphics.
  * The 4-sprint roadmap will deliver a usable workflow by Sprint 2 and automated, smart labeling by Sprint 3.
  * Integrating the YOLT model resulted in a significant 670% improvement in AI building detection recall.
  * The development process maintains high security standards, including 93% unit test coverage and NIST compliance.
  * User testing confirms the new advanced labeling algorithm is acceptable for mission use right out of the box.

### Slide 5 - KPIs: Saving Planners Minutes Per GRG

Our AI-assisted tool is delivering a dramatic reduction in the time and effort required to produce mission-critical Gridded Reference Graphics. We have validated our success with two key metrics:

* Estimate labeling tasks would be 28 minutes faster* across the six Government Furnished Areas of Interests.
* A 670% improvement in our model's recall, ensuring the right information is captured without sacrificing precision.

### Slide 5 - KPIs: Baselining cognitive load

**Manual GRG Creation: Effort and Stress Analysis**

- Effort Explosion vs. building count
> x-axis: number of buildings (25 to 250)
> y-axis: perceived effort (0 to 10)
* 100 buildings & 3.5 Perceived effort = "manageable"

- Stress vs Time Available
> x-axis: More than 1 Day, Less than 1 Day
> y-axis: Stress Level (0 to 10)
* Direct feedback from our User Representatives pinpoint the critical bottleneck in the current manual process. The effort to create these graphics doesn't scale linearly—it explodes.

### Slide 5 - Retro: Sharpening our agile process

Our focus over the last two sprints was on building a foundation to ensure the long-term health of the product. This was an investment in quality that will pay dividends in every future release.

Based on our retrospective, we're making the following adjustments:

✅ CONTINUE: Prioritizing foundational work. Make strategic investments in scalability to ensure long-term success.

🛑 STOP: Letting foundational work remain 'hidden.' No longer bundle tasks inside larger feature stories, which impacted our forecasting.

▶️ START: Planning for 'enabler' stories. Includes pointing foundational work separately, making our sprint plans far more transparent.

108 delivered points / 123 planned points (88%)
Forecasting and delivering on our commitments.

### Slide 12 - AI Model Pipeline: Performance & Security

Our AI development is built around these principles to deliver a model you can depend on without question.

* Reliable: Benchmarking against validated, labeled imagery, the AI's performance is predictably high every time you use it.
* Secure: Training on a controlled dataset protects the system from data poisoning and guarantees the model learns from the most relevant information, free from manipulation.
* Transparent: Preserving our model’s version, training data, and performance benchmarks creates a fully transparent and auditable record, giving you confidence in its development history.

**AI Model Training Pipeline Oct 10**

> GitLab - Model Repo
- YOLO
- YOLT
- UNET
</>

> AWS SageMaker
* Load Training --CVAT
- (Imagery-Base-Images), 
- (AOI Images) 

* Epoch Training 
[train]-->[evaluate]-->[adjust-weights]->looped back to [train]

* Generate Artifacts --S3
[model]
[weights]
[results]

</>

### Slide 13 - AI SDK Update: accuracy, labeling, flexibility

* **Upgraded our AI model**: Delivering a major boost in performance by integrating a new, state-of-the-art detection model YOLT. This means more structures are correctly identified from the start, providing a more reliable foundation for mission planning and reducing the need for manual corrections.

* **Developed an advanced labeling algorithm:** Numbering buildings in the same way a human would. It naturally adapts to complex, irregular layouts. The outcome is a building labeling order that is instantly intuitive and easy to understand, dramatically reducing cognitive load.

* **Engineered the SDK to allow different AI models:** Allowing operators to select the balance of speed and accuracy to match their exact mission requirements and device.
(see appendix for additional details AI SDK updates)

### Slide 23 - User Feedback:
How we collaborated with user representatives to improve the product:

* Interviewed GySgt Wagner to discover more details around section and building labeling
* Mocked up sample output from our model + draft algorithm to label buildings
* Requested async email feedback from User Representatives to review output from our label algorithm and provide fast feedback
* Interviewed SSgt Hayes to review async activity and new design directions
* Conducted a design studio as a team (PM, Design, Eng, SME)  to workshop the user correction experience
* Refined our plugin UI design and features to reflect user intent and reduce time to correct labeling

### Slide 24 - Labeling Needs: Rapid, Unambiguous Communication:

**Structured Labeling Systems**
* Buildings are organized in logical sequences (rows or straights).
* Numbering typically begins at the top-left or leftmost origin point for consistency.
* Label format must remain flexible to suit different mission and unit needs.

**Rapid Identification & Communication**
* The system must allow for quick visual and verbal identification of buildings.
* Unique, clear letter and number combinations ensure clarity over radio or digital comms.

**Environmental & Spatial Adaptation**
* Roads, rivers, and natural or man-made gaps influence label order.
* Circular or irregular patterns require judgment and “artful” adjustment.

**Sectioning by Terrain and Infrastructure**
* Major roads and clear division lines define labeling sections for easier navigation and coordination.

### Slide 24 - Labeling Algo: 90% Ready "Out of the Box"

With just one smart algorithmic default labeling strategy, we can get to about 90% acceptability. This is perceived by users as medium to high value as-is, but additional features to customize for specific areas will make it extremely valuable.

* **"Acceptable and valuable"** for mission use as-is
- Default algo is acceptable and valuable in time pinch situation (Hayes, Team SME)
- To bring them up to full standard would require some small edits (Hayes, Team SME)

* **A minority of labels require edits**, 9-12%
- 2-3 out of 30 (9%) on Ft. Magsaysay, Philippines
- 3-12 out of 68 (12%) on Razish Village, California

* **Closing the final 10%:** how would you need it to be to be 100% acceptable / usable
Received diagram and reviewed in follow up interviews (rows, roads, building formations)

# Sprint #3 Review & Demo : 24 October '25
### TLDR: S3 , Oct 24
  * Initial AI experiments confirm that AI significantly reduces operator effort and labeling time.
  * The team has nearly halved its sprint cycle time, validating process improvements and delivery acceleration.
  * Daily vulnerability scans are driving down platform risk to reduce the Mean Time To Resolve for new findings.
  * A four-sprint roadmap is sequencing development from core AI to a customizable, user-controlled GRG system.
  * The next sprint will introduce configurable GRG features like undo, edit, and display options based on user validation.

### Slide 4 KPIs: Initial Experiment Results

Our hypothesis is validated. 
Initial experiments confirm that AI significantly reduces operator effort and labeling time. While we have not yet met our aggressive 15-minute target, 
which we believe feasible, the data shows a promising path for continued investment.

Hypothesis: To reduce operator stress and effort during rapid mission turnarounds, 
**we believe** AI can shorten the time to create a mission-ready GRG from over 60 minutes to under 15 minutes.

**55% accuracy rate / time reduction:** Operators needed to add/remove 14 building labels for every 15 labels the AI correctly identified, demonstrating a significant reduction in manual effort.

The AI's contribution cuts the operator's labeling task time by more than half on complex imagery.

**Next steps:** 
> Accuracy is currently dependent on certain variables (e.g., drawing larger sections, zoom levels, 
> image quality) on ATAK.
Exploring methods to exploit these findings and improve performance, regardless of variables.

### Slide 5 - KPIs: initial experiment results

|   Metric  |   Wagner  |   Justic  | Hayes |
|   Effort  | 7         | n/a       | n/a   |
| easy o/use| 4.5       | 6         | n/a   |
| like switch| 7.5      | 8         | n/a   |

### Slide 7 - Retro: Driving Down Platform Risk

We believe that by running vulnerability scans daily and making the results highly visible in a central repository, 
we can empower teams to act faster and reduce the Mean Time To Resolve (MTTR) for new findings.

**Key Actions**
Run Scans Daily: Increase scan frequency from weekly to daily to provide a near real-time view of the security posture.

Centralize Visibility: Publish all scan artifacts to a single, accessible repository, creating a "single source of truth" for all stakeholders.

**Measuring Our Success**
We will validate our hypothesis by tracking the Mean Time To Resolve (MTTR) for all new findings. 
- ATAK MTTR = 157.31 minutes / finding
- WinTAK MTTR = 25.14 minutes / finding

## Slide 10 - ATAK demo: Raw Imagery to an actionable GRG
Automatically creates resizable GRG, detects buildings, and generates labeled COT markers within user-defined sections.

## Slide 11 - WINTAK Demo: Consistent, Shared UX
Automatically detects building locations and drops COT markers, allows users to define sections.

## Slide 12 - AI Model Selection: Accuracy, Speed & Reliability
* **Resource Limitations:** S20 needs small, fast models at the cost of detection performance

* **High-Resolution Image Processing:** Single-pass processing of high-resolution images is unfeasible, requiring tiling or multi-pass methods.

* **Model Specialization:** General-purpose models compromise too much, specialized models are needed for diverse requirements.

* **Model Plug-and-Play Architecture:** A flexible system is needed for continuous integration and replacement of fungible models, ensuring ongoing improvement.

**AI Model Training Pipeline Oct 24**

> GitLab - Model Repo
- YOLO
- YOLT
- UNET
- MRCNN
</>

> AWS SageMaker
* Load Training Imagery --CVAT
- (Base Images), 
- (AOI Images) 

* Epoch Training 
[train]-->[evaluate]-->[adjust-weights]->looped back to [train]

* Generate Artifacts --S3
[model]
[weights]
[results]

</>

## Slide 15 - AI Model Priorities

|   MODEL FEATURE           |   PRIORITY    |   REASONING  |
|Find Objects               |Critical       |Missing a building is missing a marker.
|Roads                      |Medium to High |Provides helpful labeling context, but is not as important as finding the buildings.

|Speed                      |Medium         |Per user feedback, inference speed is not a large concern. Accuracy > Speed (to a point).
 
|Handle Large Image Inputs  |Medium         |Tiling images is a viable workaround, so native support is not critical, but it simplifies engineering and reduces failure points.

|Segmentation/HQ Outputs    |Low            |A bounding box is "ok." Precise segmentation is a "nice to have," not a requirement.
 
## Slide 16 - AI Model Comparison

| AI         |   Small Objects   | Medium Objects    | Large Object  | Roads     | Speed             | Large Input Areas |
| YOLO       | No                | Yes               | Yes           | No        | Great (s20 ~2s)   | No                |
| YOLT       | Yes               | Yes               | Yes           | No        | Slow (s20 40s+)   | Yes               |
| Mask R-CNN | Yes               | Yes               | Yes           | No        | Slow              | Yes               |
| U-Net      | No                | Yes               | Yes           | Yes       | Slow              | Yes               |

## Slide 17 - AI Inference Strategy: Optimizing YOLO for User Workflow

**Challenge:** Can we overcome YOLOs limitations by integrating it into the user's workflow to get better performance?
**Solution:** Implement a multi-inference strategy based on user-defined sections.

## Slide 18 - AI SDK Update: Accuracy, Labeling, Flexibility
* **Added additional labeling features:** Provide easy strategies for common scenarios, like row and grid based schemes. Allows the operator to quickly select the best scheme for quicker and more intuitive labeling, reducing number of corrective actions and time to label.

* **Multi-Model Runtimes:** Ideal user workflow needs multi-model support, added support to quickly add new model runtimes and deploy new trained models; SDK configurable to match mission requirements and device.

* **Fungible AI model upgrades:** Swapped in latest trained model ONNX files, demonstrating CT/CD (Continuous Train/Continuous Deploy) value.

* **Image Format Improvements:** Create a RGB bitmap input for model, resulting in better detections.

## AI Model Training NIST Compliance*

* Current NIST guidance: Reviewed current and proposed documents on AI Model training
- NIST AI 800-1 2pd, NIST SP 800-218A, NIST AI 100-1, NIST SP 800-53 Concept Paper

* AI Model Training RMF Framework: Identified appropriate controls, ensured compliance, documented artifacts
- AI Policy Guide (organizational structure, risk)
- NIST Control Mapping (how we are fulfilling controls)
- Secure AI DevSecOps Playbook (TTPs)
- AI Security Checklist

## Slide 24 - User Validation: Simpler Workflow, More Options

User Validation: Simpler Workflow, More Options

We confirmed that we have the right building blocks in place in order to draw sections and automatically label buildings. We were successfully able to draw and label sections with working software on an Android device.

**validated** We validated the current build with working software, looking at functionality 
and usability. Validated Sprint 4 design direction with users for a better user experience.

**planned approach** We can deliver a further improved user experience and mission outcome by implementing UI flow which does not lead to ambiguous states when adding or editing sections or labels, easily applicable label schemes, and user-desired display options.

## Slide 34 - Insights

**Usability of working build**
- Tap-to-draw line on touch screen can be difficult, resulting in mistakes
- User expect to tap on labels, shapes to edit them without leaving workflow
- Users expect to add labels and apply schemes manually
- A couple of ambiguous states/rough spots discovered

**User need**
- Display toggle options for grid, legend, sections, prefixes
- Ability to undo and correct drawing mistakes
- More intuitive tap-to-edit functionality for labels and section options, shapes that keep user in flow
- Consistent, intuitive way to add labels and apply schemes

# RAW Final ATAK demo with Kevan (video)

### Gemini Generated Summary
The following summary outlines the ATAK demonstration, highlighting its capabilities in disconnected environments and its workflow for mission planning.

  * **System Capabilities and Initial Setup**
    
      * The demonstration takes place in a fully disconnected environment, with the system operating in airplane mode on a Samsung S20.
      * The operator receives, processes, and manages critical targeting data to satisfy manual mission requirements.

  * **Grid Definition and Sectioning**
    
      * Using the GR8 plugin, the operator defines a center point over a target building and sets the boundaries for the mission area.
      * An AI/ML plugin automatically labels the grid, creating a shared language for the team.
      * The operator uses native TAK shape-drawing tools, such as the polyline tool, to divide the area into smaller, logically grouped sections.
      * Clipping the map into these smaller sections focuses the AI and improves model performance during inference.
      * The application includes a default setting to skip ambiguous letters—such as 'B', 'H', 'I', and '1'—which can be toggled to align with specific mission standard operating procedures.

  * **AI Detection and Manual Authority**
    
      * A single tap initiates the on-device AI detection, which automates building identification and significantly reduces cognitive workload compared to manual plotting.
      * The operator acts as the final authority, retaining the ability to review, correct, and manually add or remove building markers.
      * The system automatically renumbers and updates marker sequences when changes are made.
      * Renumbering can be adjusted through a quick swiping gesture, allowing the user to optimize the marker sequence for mission flow.

  * **Customization, Finalization, and Export**
    
      * Users maintain full control over section parameters, including name, color, and numbering, to ensure the product matches team conventions.
      * The plugin generates a legend for the product, providing critical details such as the operation title, location (MGRS), and version.
      * Finalized products are exportable as KMZ files, which supports data sharing and interoperability with other mission planning software.

### What the team accomplished during the competition/Challenge

1. Fully functional ATAK plugin that uses AI to identify and label buildings on an S20 (5 year old phone) with no dependencies!
2. Fully functional WinTAK plugin in a completely different .NET WPF framework and all the technical limitations along the way
3. Built a single AI SDK that performed inference and complicated labeling algorithms with an ONNX YOLO computer vision model
4. Trained and evaluated 4 AI Models!
5. Pushed through TAK Forge and all the other creative problem solving needed along the way


------
> [1] Abel's Takes:
> [2] Abel's Takes: 
> [3] Abel's Takes: 
> [4] Abel's Takes: 
> [5] Abel's Takes: 