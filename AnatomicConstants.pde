
// =============================================
// ANATOMICAL DATA (from the Muscular Model Framework)
// by Guillem Benavent (Updated: 16/8/2023)
// For Research Project at Taradell School
// =============================================

// Bones Measurements


float SCAPULA_LENGTH = 0.10;   // Males mm  | Females mm
float SCAPULA_WIDTH  = 0.10;   // Males mm   | Females  mm

float HUMERUS_LENGTH = 0.304;   // Males 304 mm  | Females 276 mm    https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7003718/#:~:text=In%20our%20study%2C%20the%20average,in%20southern%20India%20%5B22%5D.
float HUMERUS_WIDTH  = 0.048;   // Males 45 mm   | Females 41 mm     https://onlinelibrary.wiley.com/doi/10.1111/j.1556-4029.2011.01953.x

float RADIUS_LENGTH = 0.229;    // Males 229 mm  | Females 210 mm     https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8494372/
float RADIUS_WIDTH  = 0.024;    // Males 24 mm   | Females 21 mm  ?

float ULNA_LENGTH   = 0.245;    // Males 245 mm  | Females 227 mm        https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8494372/
float ULNA_WIDTH    = 0.019;    // Males 19 mm   | Females 16 mm  ?

float HAND_LENGTH   = 0.080;    // Estimation
float HAND_WIDTH    = 0.060;    // Estimation
float HAND_DEPTH    = 0.020;    // Estimation

float FINGER_LENGTH = 0.070;    // Estimation
float FINGER_WIDTH  = 0.010;    // Estimation

// Muscle Measurements

// https://www.researchgate.net/figure/Length-of-third-head-of-biceps-and-third-head-length-arm-length-ratio_tbl1_259630634
// https://pubmed.ncbi.nlm.nih.gov/30797975/
float BICEPS_SHORT_LENGTH = (0.313)/1.5;   // Males --- mm  | Females --- mm
float BICEPS_SHORT_WIDTH  = (0.0164)*2;   // Males -- mm   | Females -- mm
//float BICEPS_SHORT_CROSSAREA = 0.000211;   // 211 mm2

float BICEPS_LONG_LENGTH = (0.313)/1.5;   // Males --- mm  | Females --- mm
float BICEPS_LONG_WIDTH  = (0.0164)*1.5;   // Males -- mm   | Females -- mm
//float BICEPS_LENGTH = (0.117)/Muscle.MUSCLE_MIN_LENGTH;   // Males --- mm  | Females --- mm
//float BICEPS_WIDTH  = (0.024)*Muscle.MUSCLE_MIN_LENGTH;   // Males -- mm   | Females -- mm


float TRICEPS_LONG_LENGTH = (0.313)/Muscle.MUSCLE_MAX_LENGTH;   // Males --- mm  | Females --- mm
float TRICEPS_LONG_WIDTH  = (0.0164)*Muscle.MUSCLE_MAX_LENGTH;   // Males -- mm   | Females -- mm

float TRICEPS_LATERAL_LENGTH = (0.313)/Muscle.MUSCLE_MAX_LENGTH;   // Males --- mm  | Females --- mm
float TRICEPS_LATERAL_WIDTH  = (0.0164)*Muscle.MUSCLE_MAX_LENGTH;   // Males -- mm   | Females -- mm

float TRICEPS_MEDIAL_LENGTH = (0.313)/Muscle.MUSCLE_MAX_LENGTH;   // Males --- mm  | Females --- mm
float TRICEPS_MEDIAL_WIDTH  = (0.0164)*Muscle.MUSCLE_MAX_LENGTH;   // Males -- mm   | Females -- mm



// Hinges Measurements

float SHOULDER_RADIUS = HUMERUS_WIDTH;
float SHOULDER_ANGLE_MAX = +90;
float SHOULDER_ANGLE_MIN = -160;

float ELBOW_RADIUS = ULNA_WIDTH;
float ELBOW_ANGLE_MAX = +150;
float ELBOW_ANGLE_MIN = -10;

//LEG MODEL==============================================================================================================
//BONES 
float PELVIS_LENGTH = 0.17; //
float PELVIS_WIDTH = 0.22; //https://www.researchgate.net/publication/5573347_Stature_Estimation_Based_on_Dimensions_of_the_Bony_Pelvis_and_Proximal_Femur

float FEMUR_LENGTH = 0.48; //https://openoregon.pressbooks.pub/bodyphysics/chapter/stress-and-strain-on-the-body/#:~:text=The%20average%20adult%20male%20femur,196%20lbs%20(872%20N).
float FEMUR_WIDTH = 0.0537; //  ^ && https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3437276/#:~:text=The%20bicondylar%20width%20of%20the,parameter%20of%20the%20distal%20femur.

float FIBULA_LENGTH = 0.35; //https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4349317/#:~:text=Length%20of%20the%20fibula,-Table%201%20shows&text=The%20mean%20fibula%20length%2C%20which,than%20in%20the%20female%20patients.
float FIBULA_WIDTH = 0.0175; //https://www.sciencedirect.com/topics/immunology-and-microbiology/fibula#:~:text=Common%20Free%20Vascularized%20Flaps&text=The%20fibula%20bone%20is%20a,between%201.5%20to%202%20cm.

float TIBIA_LENGTH = 0.36; // https://www.jstor.org/stable/658462
float TIBIA_WIDTH = 0.0258; // https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6686072/#:~:text=The%20mean%20scores%20of%20AP,48.70±5.35%20mm%2C%20respectively.

float FOOT_LENGTH = 0.17; // 
float FOOT_WIDTH = 0.04; // 

float TOE_LENGTH = 0.04; // 
float TOE_WIDTH = 0.02; // 

//JOINT
float HIP_RADIUS = FEMUR_WIDTH;
float HIP_ANGLE_MAX = 999;
float HIP_ANGLE_MIN = -999;

float KNEE_RADIUS = TIBIA_WIDTH;
float KNEE_ANGLE_MAX = 999;
float KNEE_ANGLE_MIN = -999;

float ANKLE_RADIUS = TIBIA_WIDTH;
float ANKLE_ANGLE_MAX = 500;
float ANKLE_ANGLE_MIN = -70;

float SOLE_RADIUS = TOE_WIDTH;
float SOLE_ANGLE_MAX = 999;
float SOLE_ANGLE_MIN = -999;

//MUSCLE
float GAS_LATERAL_LENGTH = 0.2;
float GAS_LATERAL_WIDTH  = 0.05;

float GAS_MEDIAL_LENGTH = 0.2;
float GAS_MEDIAL_WIDTH  = 0.047;

float SOLEUS_LENGTH = 0.25;
float SOLEUS_WIDTH  = 0.03;

float TIBIALIS_LENGTH = 0.24;
float TIBIALIS_WIDTH  = 0.02;
