# atak-cv-model-servers

## ATAK CV Model Server - Repo

This project contains a computer vision model server for building segmentation using a trained YOLOv8 model, designed for integration with ATAK/WinTAK GRG plugins.

**Features**

- YOLOv8 Model Inference: Loads a trained YOLOv8 segmentation model

- Batch Processing: Processes multiple test images automatically

- CSV Output: Saves results in a structured CSV format

- Error Handling: Robust error handling for missing files and processing errors

- Zip Output: Creates a zip file containing the results

- ATAK Integration Ready: Designed to work with the ATAK GRG CV SDK


**Output**

The script generates:
* `output.csv:` Contains ImageID and Coordinates for each detected building
* `output.zip:` Zipped version of the CSV file

**Configuration**

You can modify the following parameters in the script:

* `conf=0.2:` Confidence threshold for detections
* `imgsz=640:` Input image size
* `iou=0.95:` IoU threshold for NMS
* `decoding_of_predictions:` Class name mapping

**File Structure**

ATAK-Python/
├── yolo_inference.py          # Main inference script
├── requirements.txt           # Python dependencies
├── README.md                 # This file
├── runs/segment/train/weights/last.pt  # Trained model
└── image/                              # Test images (1000+ TIFF files)

**Error Handling**

The script includes comprehensive error handling for:

- Missing model files
- Missing test image directories
- Individual image processing errors
- Mismatched detection counts

**Notes**

- The script processes images in sorted order by filename
- Only images with 4+ coordinate points are included in results
- Supported image formats: PNG, JPG, JPEG, TIFF, BMP
- Results are saved with UTF-8 encoding

---

# GRG AI MODEL - Repo

**Building Detection AI Models**

This project trains and evaluates three different AI model implementations for building detection in images: YOLO, YOLT, and UNET. Each implementation is designed to run on AWS SageMaker with automated data pulling from CVAT and model artifact storage in S3.

**Project Structure**

.
├── yolo/
│   ├── yolo-setup.ipynb          # Initial AWS SageMaker setup
│   └── yolo-training.ipynb       # Training execution notebook
├── yolt/
└── unet/
    ├── unet-setup.ipynb          # Initial AWS SageMaker setup
    └── unet-training.ipynb       # Training execution notebook

### Model Implementations

**YOLO (You Only Look Once)**
Real-time object detection system optimized for speed and accuracy in building detection tasks.

**YOLT (You Only Look Twice)**
Satellite and aerial imagery-focused variant designed for detecting small objects in large-scale imagery.

**UNET**
Semantic segmentation architecture providing pixel-level building boundary detection.

**Workflow**

1. Initial Setup
Each implementation includes a <MODEL_NAME>-setup.ipynb notebook for:

- AWS SageMaker environment configuration
- Dependency installation
- CVAT connection setup
- S3 bucket configuration

2. Training Process

The <MODEL_NAME>-straining.ipynb notebooks handle:

- Data Acquisition: Automatically pulls labeled training data from self-hosted CVAT
- Model Training: Executes training for specified number of epochs
- Artifact Storage: Pushes trained model runtimes to S3
- Benchmarking: Generates and uploads performance metrics to S3

### Getting Started

**Prerequisites**

- AWS account with SageMaker access
- Self-hosted CVAT instance with labeled building detection datasets
- S3 bucket for model artifacts and benchmarks
- AWS credentials configured

**Running a Training Session**
- Open the desired implementation directory (yolo, yolt, or unet)
- Run setup.ipynb once to configure the environment
- Execute training.ipynb to start a training session
- Monitor training progress in SageMaker
- Access trained models and benchmarks in your S3 bucket

**Output Artifacts**
Each training session produces:

- Trained model weights/runtime
- Performance benchmark results
- Training metrics and logs

All artifacts are stored in S3 for versioning and deployment.

## Security Policy Project for Rise8-grg-ai-model

Security Policy Project for rise8-grg-ai-model

This project is automatically generated to manage security policies for the project.

The Security Policies Project is a repository used to store policies. All security policies are stored as a YAML file named .gitlab/security-policies/policy.yml, with this format:

---
scan_execution_policy:
- name: Enforce DAST in every pipeline
  description: This policy enforces pipeline configuration to have a job with DAST scan
  enabled: true
  rules:
  - type: pipeline
    branches:
    - master
  actions:
  - scan: dast
    scanner_profile: Scanner Profile A
    site_profile: Site Profile B
- name: Enforce DAST in every pipeline in the main branch
  description: This policy enforces pipeline configuration to have a job with DAST scan for the main branch
  enabled: true
  rules:
  - type: pipeline
    branches:
    - main
  actions:
  - scan: dast
    scanner_profile: Scanner Profile C
    site_profile: Site Profile D

You can read more about the format and policies schema in the documentation (link)

Default branch protection settings

This project is preconfigured with the default branch set as a protected branch, and only maintainers/owners of
rise8-grg-ai-model have permission to merge into that branch. This overrides any default branch protection both for the group and for the instance.

----

**Source**

How do they manage branches?
Is there a required code reviewer/approver?

**Build**

Does Rise8 CI/CD do anything before pushing to TAK Forge, or is it a straight push?
What exactly does "scans" mean — security, lint, tests?

**Test**

Confirm "local" — is there ever a shared environment?
Who else validates besides the PM?

**Release**

How does the APK physically get to the Program Office?
Is there a TAK Forge step here or does it go direct?

**Across all stages**

- Where does appgate appear?
- Where does TPC have any involvement?
- Where does DefenseWERX touch the process?
- Any step that requires gov access or approval before Rise8 can move?