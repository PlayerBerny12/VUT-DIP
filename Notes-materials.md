# Notes materials

## Deepfakes workshop
- https://link.springer.com/book/10.1007/978-3-030-87664-7
- https://eab.org/events/program/291

### Ruben Tolosana: An Introduction to Digital Face Manipulation
- traditional -> time consuming, high skill level (special tools needed -> Photoshop)
- automatic face syntetisis -> easy and fast, deep learning (big databases)
- "deepfakes" -> 2017, reddit user anmed deepfake developed swaped algorithm
- creating new faces - GAN
- face manipulation - GAN
    - face morphing -> merging two faces to one
    - identity swap
- expression swap
    - image animation
    - audio to video 

### Mathias Ibsen: Digital Face Manipulation in Biometric Systems
- face swap, morphing and retouching techniques used to break biometrics systems
- showing results of experiment on two biometrics systems with outputs (FMR, FNMR, ...)
- adding new module to biometrics systems called `manipulation detection`
    - one image (looking for fragemtns, etc) - non deifrential detection, two images - diferencial detection

### Luisa Verdoliva: Multimedia Forensics Before the Deep Learning Era
- creating fakes (aka cheapfakes) using programs such as Photoshop, GYMP
- image manipulation techniques 
    - splicing (inserting object)
    - inpaiting (removing object)
    - copy-move (replication of object inside of image)
- detection of fakes
    - digital integrity (blurred edges, replicated pixels, mangled compression, ...)
    - physical integrity (inconsistent shadows/lightning, ...)
    - semantic integrity (contradicting evidence in associated images or resources)
- in-camera/out-camera processing 
- detection analysis:
    - PRNU (Photo Respons Non-Uniformity noise) 
        - tiny imperfection in sensor (in every image)
        - fingerprint of device        
    - noise patterns
        - looking for deviation from expected model (anomaly detection)
    - compression
        - double compression, JPEG grid missaligment
    - editing artifacts
        - copy-move forgery detection (keypoint, dense field)
        - images, video, 3D
- use multiple detection techniques to optain best results

### Pavel Korshunov: The Threat of Deepfakes to Computer and Human Visions
- deepfake databases
- comparison of humans and algorithms on spotting deepfakes (human and computer visions are different)
- proves that humans are not very good at spoting deepfakes (based on quality of fakes)
- lack of generalization
- binary classifiers
    - depends on quality and size of dataset (can struggle on images that are easy for humans)
    - methods for improving results (extream data augmentation, few-shot tuning, ...)
- comparison of binary and atribution classifiers (atribution clssifiers performs better)
    - same dataset and cross dataset scenarios
    - binary are not reliable on cross dataset scenarios but attribution classifiers can provide usefull informations

### Annalisa Franco: Morphing Attack Potential
- morphing is seamless transition between two objects in computer graphics and animation
- morhing attacks are used for forgery of documents
    - morphed images contains featrues of two people
- landmarks (nose, eyes, contour, ...)
    - faces are aligned and image warping and blendig is used for actuall morphing
- deep learning (potential use of GAN)
- morphing is creating artefacts in images mostly in background
    - background substitotion
- parameter alpha (how much is original person morphed to second person)
    - best results (0.3-0.4)
- specific metrics for morphing attacks againts face regonition system
    - MMPMR, FMMPMR
    - MAP (Morphing attack potential)

### Kiran Raja: Adversarial Attacks on Face Recognition Systems
- adding noise (noise, difrent view angle, ...) to the image (almost invisible for person) to attack recognition system
    - trying to push input image from one class to another
- FGSM (Fast Gradient Sign Method)
- PGD (Projected Gradient Descent)
- putting adjusted images into learning dataset for FRS
- detection:
    - quality of images (rejecting above threshold)
    - bias factor, investigation of boundry shifting, ...

### Vitomir Štruc: Photorealistic Face Editing via Latent Code Optimization
- video is not accessible

### Yuxin Wang: Talking Faces: Audio-to-Video Face Generation
- creating 2D/3D facial model for specific person, creating audio representation from input a putting everything togeather
- two pipelines
    - audio encoder and video encoder with with one decoder decoding audio into animated mouth movement
    - regression model using audio input to create generation or rendering output
- post-processing
    - image refinement (teeth enhancment, ...)
    - background compositing
- metrics - image quality, audio-lip sync, identity-preservation, blinking
- chalanges - eyes/teeth control, head movement, emotions, generalization (identity, corpus), forgery detection

### Luisa Verdoliva: Detection of AI-Generated Synthetic Faces
- visual artifacts or semantic inconsistencies (lack of symmetry - diferent eye color, etc.) in generated fake images
    - progressing with better generators
- low level features (GAN method -> specific artifacts) distingisable from real image taken by camera
    - extraction process (PRNU)
    - independet of visual quality of image
- most sucessful detectors rely on supervised deep learning
    - poor generalization
    - lack of robustness -> image degradation (compression, resizing, ...)
        - solution is to train on big datasets generated only by one type of generator that does not contain only faces
- proposed improvements and their results of detection method
    - no down sampling and no resizing
- improve method to recognize different generation metods (not only GAN)

### Julian Fierrez: DeepFakes Detection Based on Heart Rate Estimation: Single- and Multi-frame
- detection based on physiological processes of human being -> hearth reate, blood oxygen, breath rate, ...
- remote photoplethysmography
- preprocessing -> face detection + normalization
- CNN -> detection of hearth rate (frame by frame score)
- videos osciliting score during the video
    - mean, meadian, QCD score

### Christoph Busch: Face Morphing Attack Detection Methods
- multiple individuals can use one document for example passport
- morphing attack paradox -> better recognition system, more vulnerabiliry
- single image morphing attack detection (S-MAD)   
    - local binary patern (LBP)
    - transform to different color spaces for better generalization
    - high frequencies are lost in morphig images fingerprints
-  differential morphing attack detection (D-MAD)
    - trusted image and suspection image
    - landmark analysis (angle, distance)
    - deep face representation extraction + meachine learning-based decision
    - demorphing method

### Luuk Spreeuwers: Practical Evaluation of Face Morphing Attack Detection Methods
- mostly LBP or deep network followed by classifer (SVN)
- trained on one database -> bad generalization
- application gaussian noise or down scaling and up scaling are invisible to human eye
    - it manipulates with frequencies of content of the morphed image and disturbed the traces of morphing process
- selction of subjects (people that are more simular to each other will end up in better results)
- performance metrics
    - BPCER - Bona field classification error rate
    - APCER - Attack presentatoin classification error rate

### Christian Rathgeb: Crowd-powered Face Manipulation Detection: Fusing Human Examiner Decisions
- fusing decisions of human examiner from group of people
    - observed properties -> decision, confidences, experience, time
- three different types of manipulations divided by difficulty
- two experiments
    - A-B-X -> A = bona fide, B = manipulated, X = for classification
    - Spatial 2-alternatives force choice task -> two images and select wich is manipulated
- individual results -> grouped artificaly  
- groups will ended up with better accuracy then individuals
    - confidence-weight socre has best results

### Abhijit Das: 3D CNN Architectures and Attention Mechanisms for Deepfake Detection


### Huy Nguyen: Capsule-Forensics Networks for Deepfake Detection

### Liming Jiang: DeepFakes Detection: the DeeperForensics Dataset and Challenge

### Edward J. Delp: Deepfake Detection Using Multiple Data Modalities

### Akshay Agrawal: On the Robustness of Facial Retouching and Alteration Detection Algorithms

### Kathrin Laas-Mikko: Promises, Social, and Ethical Challenges with Biometrics in Remote Identity Onboarding

### Catherine Jasserand: Deep fakes: Emerging Legal, Ethical, And Societal Challenges

### Ruben Vera: Future Trends in Digital Face Manipulation and Detection