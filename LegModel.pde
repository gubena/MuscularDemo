
// =============================================
// CLASS LEG MODEL (subclass of MuscularModel from the Muscular Model Framework)
// by Guillem Benavent (Updated: 22/7/2023)
// For Research Project at Taradell School
// =============================================
// Extends Muscular Model to create the model of a leg
// It contains the bones pelvis, femur, fibula, tibia, foot and toes
// It contains the muscles gastrocnemius lateral, gastrocnemius medial, soleus and tibialis anterior
// =============================================

class LegModel extends MuscularModel
{ 
  Nail nailTop, nailBottom;
  Bone pelvis, femur, fibula, tibia, foot, toe;
  Glue nailTopPelvis, fibulaTibia, nailBottomToe, femurWeight, weightFemur;
  Hinge hip, knee, ankle, sole;
  Muscle gastrocnemiusLateral, gastrocnemiusMedial, soleus, tibialisAnterior;
  Weight weight;
   
  // CONSTRUCTOR ============================================

  LegModel(PApplet p, float x, float y, float scale, int fps, int simulationLevel)
  {
    super(p, x, y, scale, fps, simulationLevel);
  }
  LegModel(PApplet p, float x, float y, float scale, int fps, int simulationLevel, int variantIndex, int weightIndex)
  {
    super(p, x, y, scale, fps, simulationLevel, variantIndex, weightIndex);
  }
  
  void defineMain()
  {
    // Defining variants of the models
    variantNames.add("All Muscles");                // Index 0
    variantNames.add("All Gastrocnemius");          // Index 1
    variantNames.add("All Gas + Soleus"); // Index 2
    variantNames.add("Tibialis Anterior");          // Index 3
    variantNames.add("Soleus + Tibialis Anterior"); // Index 4

    
    //weightNames.add("0 kg");              // Index 0
    weightNames.add("10 kg");             // Index 3
    weightNames.add("50 kg");             // Index 4
    weightNames.add("100 kg");             // Index 3
    weightNames.add("200 kg");             // Index 4
  }
  
  void defineBones(float x, float y, int variantIndex)
  {   
    // PELVIS BONE
    pelvis = new Bone("Pelvis", x, y, PELVIS_LENGTH, PELVIS_WIDTH);
    allBones.add(pelvis);
    
    // FEMUR BONE
    float offsetFemurX = FEMUR_LENGTH/2;
    float offsetFemurY = -PELVIS_WIDTH/2 + FEMUR_WIDTH/2;
    femur = new Bone("Femur", x+offsetFemurX, y+offsetFemurY, FEMUR_LENGTH, FEMUR_WIDTH);
    allBones.add(femur);

    // FIBULA BONE
    float offsetFibulaX = FEMUR_LENGTH -FIBULA_WIDTH/2 - 0.02;
    float offsetFibulaY = -PELVIS_WIDTH/2 + FEMUR_WIDTH/2 -FIBULA_LENGTH/2;
    fibula = new Bone("Fibula", x+offsetFibulaX, y+offsetFibulaY, FIBULA_WIDTH, FIBULA_LENGTH);
    allBones.add(fibula);

    // TIBIA BONE
    float offsetTibiaX = FEMUR_LENGTH;
    float offsetTibiaY = -PELVIS_WIDTH/2 + FEMUR_WIDTH/2 -TIBIA_LENGTH/2;
    tibia = new Bone("Tibia", x+offsetTibiaX, y+offsetTibiaY, TIBIA_WIDTH, TIBIA_LENGTH);
    allBones.add(tibia);
    
    // FOOT BONE
    float offsetFootX = FEMUR_LENGTH + FOOT_LENGTH/2 - 0.05;
    float offsetFootY = -PELVIS_WIDTH/2 + FEMUR_WIDTH/2 -TIBIA_LENGTH;
    foot = new Bone("Foot", x+offsetFootX, y+offsetFootY, FOOT_LENGTH, FOOT_WIDTH);
    allBones.add(foot);
    
    // TOE BONE
    float offsetToeX = FEMUR_LENGTH + FOOT_LENGTH + TOE_LENGTH/2 - 0.05;
    float offsetToeY = -PELVIS_WIDTH/2 + FEMUR_WIDTH/2 -TIBIA_LENGTH -FOOT_WIDTH/2 + TOE_WIDTH/2;
    toe = new Bone("Toe", x+offsetToeX, y+offsetToeY, TOE_LENGTH, TOE_WIDTH, TOE_WIDTH, true);
    allBones.add(toe);
    
  }

  void defineJoints(float x, float y, int variantIndex)
  {  
    // FIXED 
    nailTop = new Nail("Nail Top", x, y);
    allNails.add(nailTop);
    
    nailBottom = new Nail("Nail Bottom", x + FEMUR_LENGTH + FOOT_LENGTH + TOE_LENGTH/2 - 0.05, y -PELVIS_WIDTH/2 + FEMUR_WIDTH/2 -TIBIA_LENGTH - FOOT_WIDTH/2 + TOE_WIDTH/2);
    allNails.add(nailBottom);
    
    // NAIL TOP-PELVIS GLUE
    nailTopPelvis = new Glue(nailTop.body, pelvis.body);
    allGlues.add(nailTopPelvis);
    
    // HIP HINGE
    Vec2 hipPelvisAnchor = new Vec2(0, -PELVIS_WIDTH/2 + FEMUR_WIDTH/2);
    Vec2 hipFemurAnchor = new Vec2(-FEMUR_LENGTH/2, 0); 
    hip = new Hinge("Hip", pelvis.body, femur.body, hipPelvisAnchor, hipFemurAnchor, HIP_RADIUS, HIP_ANGLE_MIN, HIP_ANGLE_MAX);
    allHinges.add(hip);
    
    // KNEE HINGE
    Vec2 kneeFemurAnchor = new Vec2(FEMUR_LENGTH/2, 0);
    Vec2 kneeTibiaAnchor = new Vec2(0, TIBIA_LENGTH/2);
    knee = new Hinge("Knee", femur.body, tibia.body, kneeFemurAnchor, kneeTibiaAnchor, ELBOW_RADIUS, ELBOW_ANGLE_MIN, ELBOW_ANGLE_MAX);
    allHinges.add(knee);

    // FIBULA - TIBIA GLUE
    fibulaTibia = new Glue(fibula.body, tibia.body);
    allGlues.add(fibulaTibia);
    
    // ANKLE HINGE
    Vec2 ankleTibiaAnchor = new Vec2(0, -TIBIA_LENGTH/2);
    Vec2 ankleFootAnchor = new Vec2(-FOOT_LENGTH/2 + 0.05, 0);
    ankle = new Hinge("Ankle", tibia.body, foot.body, ankleTibiaAnchor, ankleFootAnchor, ANKLE_RADIUS, ANKLE_ANGLE_MIN, ANKLE_ANGLE_MAX);
    allHinges.add(ankle);
    
    // SOLE HINGE
    Vec2 soleFootAnchor = new Vec2(FOOT_LENGTH/2, -FOOT_WIDTH/2 + TOE_WIDTH/2);
    Vec2 soleToeAnchor = new Vec2(-TOE_LENGTH/2, 0);
    sole = new Hinge("Sole", foot.body, toe.body, soleFootAnchor, soleToeAnchor, ELBOW_RADIUS, ELBOW_ANGLE_MIN, ELBOW_ANGLE_MAX);
    allHinges.add(sole);
    
    // TOE - NAIL BOTTOM
    nailBottomToe = new Glue(nailBottom.body, toe.body);
    allGlues.add(nailBottomToe);
  }
  
  void defineMuscles(float x, float y, int variantIndex)
  {
    if (variantIndex==0 || variantIndex==2 || variantIndex==4)
    {
      // SOLEUS MUSCLE
      Vec2 soleusFibulaAnchor = new Vec2(0, FIBULA_LENGTH/2);
      Vec2 soleusFootAnchor = new Vec2(-FOOT_LENGTH/2, -FOOT_WIDTH/2);
      soleus = new Muscle("Soleus", SOLEUS_LENGTH, SOLEUS_WIDTH, Muscle.MUSCLE_REST_LENGTH, fibula.body, foot.body, soleusFibulaAnchor, soleusFootAnchor);
      allMuscles.add(soleus);
    }
    
    if (variantIndex==0 || variantIndex==1 || variantIndex==2) 
    {
      // GASTROCNEMIUS LATERAL MUSCLE
      Vec2 gasLateralFemurAnchor = new Vec2(FEMUR_LENGTH/2 - FIBULA_WIDTH - TIBIA_WIDTH, -FEMUR_WIDTH/2);
      Vec2 gasLateralFootAnchor = new Vec2(-FOOT_LENGTH/2, -FOOT_WIDTH/2);
      gastrocnemiusLateral = new Muscle("Gastrocnemius Lateral", GAS_LATERAL_LENGTH, GAS_LATERAL_WIDTH, Muscle.MUSCLE_REST_LENGTH, femur.body, foot.body, gasLateralFemurAnchor, gasLateralFootAnchor);
      gastrocnemiusLateral.setMuscleSymmetry(0.25);
      allMuscles.add(gastrocnemiusLateral);
      
      // GASTROCNEMIUS MEDIAL MUSCLE
      Vec2 gasMedialFemurAnchor = new Vec2(FEMUR_LENGTH/2 - TIBIALIS_WIDTH, -FEMUR_WIDTH/2);
      Vec2 gasMedialFootAnchor = new Vec2(-FOOT_LENGTH/2, -FOOT_WIDTH/2);
      gastrocnemiusMedial = new Muscle("Gastrocnemius Medial", GAS_MEDIAL_LENGTH, GAS_MEDIAL_WIDTH, Muscle.MUSCLE_REST_LENGTH, femur.body, foot.body, gasMedialFemurAnchor, gasMedialFootAnchor);
      gastrocnemiusMedial.setMuscleSymmetry(0.25);
      allMuscles.add(gastrocnemiusMedial);
    }
     
    if (variantIndex==0 || variantIndex==3 || variantIndex==4)
    {
      // TIBIALIS ANTERIOR MUSCLE
      Vec2 tibAnteriorFibulaAnchor = new Vec2(0, FIBULA_LENGTH/2);
      Vec2 tibAnteriorFootAnchor = new Vec2(0, FOOT_WIDTH/2);
      tibialisAnterior = new Muscle("Tibialis Anterior", TIBIALIS_LENGTH, TIBIALIS_WIDTH, Muscle.MUSCLE_SHORT_LENGTH, fibula.body, foot.body, tibAnteriorFibulaAnchor, tibAnteriorFootAnchor);
      allMuscles.add(tibialisAnterior);
    }
    
    // MUSCLE SETS
    if (variantIndex==0 || variantIndex==1 || variantIndex==2)
      { createMuscleGroup(new String[] {"Gastrocnemius Lateral", "Gastrocnemius Medial"}); }
      
    if (variantIndex==0 || variantIndex==2)
      { createMuscleGroup(new String[] {"Gastrocnemius Lateral", "Gastrocnemius Medial", "Soleus"}); }
  }
  
  void defineWeights(float x, float y, int variantIndex, int weightIndex)
  {
    float[] variantWeights = {10, 50, 100, 200};
    float weightValue = variantWeights[weightIndex];
    
    if (weightValue>0)
    {
      // WEIGHT
      float offsetWeightX = FEMUR_LENGTH;
      float offsetWeightY = -PELVIS_WIDTH/2 + FEMUR_WIDTH/2;
      
      weight = new Weight("Weight", x+offsetWeightX, y+offsetWeightY, weightValue);
      allWeights.add(weight);
  
      //WEIGHT-FEMUR
      weightFemur = new Glue(femur.body, weight.body);
      allGlues.add(weightFemur);
    }
  } 

} // End of Class
