
// =============================================
// CLASS ARM MODEL (subclass of MuscularModel from the Muscular Model Framework)
// by Guillem Benavent (Updated: 22/7/2023)
// For Research Project at Taradell School
// =============================================
// Extends Muscular Model to create the model of an arm
// It contains the bones humerus, ulna, radius and a hand
// It contains the muscles biceps short, biceps long and triceps(?)
// =============================================

class ArmModel extends MuscularModel
{ 
  Nail nail;
  Bone scapula, humerus, ulna, radius;
  Bone hand, fingerIndex, fingerMiddle, fingerRing, fingerPinkie, fingerThumb;
  Glue nailScapula, ulnaRadius, handRadius, handIndex, handMiddle, handRing, handPinkie, handThumb, radiusWeight;
  Hinge shoulder, elbow;
  Muscle bicepsShort, bicepsLong;
  Muscle tricepsLong, tricepsLateral, tricepsMedial;
  Weight weight;
   
  // CONSTRUCTOR ============================================

  ArmModel(PApplet p, float x, float y, float scale, int fps, int simulationLevel)
  {
    super(p, x, y, scale, fps, simulationLevel);
  }
  ArmModel(PApplet p, float x, float y, float scale, int fps, int simulationLevel, int variantIndex, int weightIndex)
  {
    super(p, x, y, scale, fps, simulationLevel, variantIndex, weightIndex);
  }
  
  void defineMain()
  {
    // Defining variants of the models
    variantNames.add("All Muscles");           // Index 0
    variantNames.add("Biceps Short");          // Index 1
    variantNames.add("All Biceps");            // Index 2
    variantNames.add("All Triceps");           // Index 3
    variantNames.add("All Biceps + Triceps");  // Index 4
    
    weightNames.add("0 kg");              // Index 0
    weightNames.add("1 kg");              // Index 1
    weightNames.add("5 kg");              // Index 2
    weightNames.add("10 kg");             // Index 3
    weightNames.add("50 kg");             // Index 4
    weightNames.add("100 kg");            // Index 5
  }
  
  void defineBones(float x, float y, int variantIndex)
  {   
    // SCAPULA BONE
    scapula = new Bone("Scapula", x, y+SCAPULA_WIDTH/6, SCAPULA_LENGTH, SCAPULA_WIDTH);
    allBones.add(scapula);
    
    // HUMERUS BONE
    float offsetHumerusX = HUMERUS_LENGTH/2;
    float offsetHumerusY = 0;
    humerus = new Bone("Humerus", x+offsetHumerusX, y+offsetHumerusY, HUMERUS_LENGTH, HUMERUS_WIDTH);
    allBones.add(humerus);

    // ULNA BONE
    float offsetUlnaX = HUMERUS_LENGTH + ULNA_LENGTH/2;
    float offsetUlnaY = -HUMERUS_WIDTH/2 + ULNA_WIDTH/2;
    ulna = new Bone("Ulna", x+offsetUlnaX, y+offsetUlnaY, ULNA_LENGTH, ULNA_WIDTH);
    allBones.add(ulna);

    // RADIUS BONE
    float offsetRadiusX = HUMERUS_LENGTH + ULNA_LENGTH - RADIUS_LENGTH/2;
    float offsetRadiusY = HUMERUS_WIDTH/2 - RADIUS_WIDTH/2;
    radius = new Bone("Radius", x+offsetRadiusX, y+offsetRadiusY, RADIUS_LENGTH, RADIUS_WIDTH);
    allBones.add(radius);
    
    // HAND BONES
    float offsetHandX = HUMERUS_LENGTH + ULNA_LENGTH + HAND_LENGTH/2;
    float offsetHandY = 0;
    hand = new Bone("Hand", x+offsetHandX, y+offsetHandY, HAND_LENGTH, HAND_WIDTH, HAND_DEPTH);
    allBones.add(hand);
    
    float offsetThumbX = HUMERUS_LENGTH + ULNA_LENGTH + (FINGER_LENGTH*0.8)/2;
    float offsetThumbY = HAND_WIDTH/2 + (FINGER_WIDTH*1.5)/2;//+0.002;
    fingerThumb = new Bone("Thumb Finger", x+offsetThumbX, y+offsetThumbY, FINGER_LENGTH*0.8, FINGER_WIDTH*1.5);
    allBones.add(fingerThumb);
    
    float offsetIndexX = HUMERUS_LENGTH + ULNA_LENGTH + HAND_LENGTH + (FINGER_LENGTH*0.9)/2;
    float offsetIndexY = HAND_WIDTH/2 - FINGER_WIDTH/2;
    fingerIndex = new Bone("Index Finger", x+offsetIndexX, y+offsetIndexY, (FINGER_LENGTH*0.9), FINGER_WIDTH);
    allBones.add(fingerIndex);
    
    float offsetMiddleX = HUMERUS_LENGTH + ULNA_LENGTH + HAND_LENGTH + FINGER_LENGTH/2;
    float offsetMiddleY = FINGER_WIDTH/2+0.002;
    fingerMiddle = new Bone("Middle Finger", x+offsetMiddleX, y+offsetMiddleY, FINGER_LENGTH, FINGER_WIDTH);
    allBones.add(fingerMiddle);
    
    float offsetRingX = HUMERUS_LENGTH + ULNA_LENGTH + HAND_LENGTH + (FINGER_LENGTH*0.9)/2;
    float offsetRingY = - FINGER_WIDTH/2-0.006;
    fingerRing = new Bone("Ring Finger", x+offsetRingX, y+offsetRingY, (FINGER_LENGTH*0.9), FINGER_WIDTH);
    allBones.add(fingerRing);
    
    float offsetPinkieX = HUMERUS_LENGTH + ULNA_LENGTH + HAND_LENGTH + (FINGER_LENGTH*0.7)/2;
    float offsetPinkieY = -HAND_WIDTH/2 + FINGER_WIDTH/2*0.7;
    fingerPinkie = new Bone("Pinkie Finger", x+offsetPinkieX, y+offsetPinkieY, FINGER_LENGTH*0.7, FINGER_WIDTH*0.7);
    allBones.add(fingerPinkie);
  }

  void defineJoints(float x, float y, int variantIndex)
  {  
    // FIXED 
    nail = new Nail("Nail", x, y);
    allNails.add(nail);
    
    // NAIL-SCAPULA GLUE
    nailScapula = new Glue(nail.body, scapula.body);
    allGlues.add(nailScapula);
    
    // SHOULDER HINGE
    Vec2 shoulderScapulaAnchor = new Vec2(0, -SCAPULA_LENGTH/6);
    Vec2 shoulderHumerusAnchor = new Vec2(-HUMERUS_LENGTH/2, 0);
    //SHOULDER_ANGLE_MIN=0; SHOULDER_ANGLE_MAX=0;  
    shoulder = new Hinge("Shoulder", scapula.body, humerus.body, shoulderScapulaAnchor, shoulderHumerusAnchor, SHOULDER_RADIUS, SHOULDER_ANGLE_MIN, SHOULDER_ANGLE_MAX);
    allHinges.add(shoulder);
    
    // ELBOW HINGE
    Vec2 elbowHumerusAnchor = new Vec2(+HUMERUS_LENGTH/2, -HUMERUS_WIDTH/2 + ULNA_WIDTH/2);
    Vec2 elbowUlnaAnchor = new Vec2(-ULNA_LENGTH/2, 0);
    elbow = new Hinge("Elbow", humerus.body, ulna.body, elbowHumerusAnchor, elbowUlnaAnchor, ELBOW_RADIUS, ELBOW_ANGLE_MIN, ELBOW_ANGLE_MAX);
    allHinges.add(elbow);

    // ULNA-RADIUS GLUE
    //Vec2 relativePosition = new Vec2((RADIUS_LENGTH-ULNA_LENGTH)/2, (RADIUS_WIDTH+ULNA_WIDTH)/2);
    ulnaRadius = new Glue(ulna.body, radius.body);
    //ulnaRadius = new Glue(ulna.body, radius.body, relativePosition);
    allGlues.add(ulnaRadius);
    
    //// HAND-RADIUS GLUE
    handRadius = new Glue(hand.body, radius.body);
    allGlues.add(handRadius);
    
    // HAND-FINGERS GLUE
    handThumb = new Glue(hand.body, fingerThumb.body);
    handIndex = new Glue(hand.body, fingerIndex.body);
    handMiddle = new Glue(hand.body, fingerMiddle.body);
    handRing = new Glue(hand.body, fingerRing.body);
    handPinkie = new Glue(hand.body, fingerPinkie.body);
    allGlues.add(handThumb);
    allGlues.add(handIndex);
    allGlues.add(handMiddle);
    allGlues.add(handRing);
    allGlues.add(handPinkie);
  }
  
  void defineMuscles(float x, float y, int variantIndex)
  {   
    if (variantIndex==0 || variantIndex==1 || variantIndex==2 || variantIndex==4)
    {
      // BICEPS SHORT MUSCLE
      //float offsetBicepsX = HUMERUS_LENGTH*2/3; // + ULNA_LENGTH/10;
      //float offsetBicepsY = HUMERUS_WIDTH/2;
      Vec2 bicepsShortScapulaAnchor = new Vec2(SCAPULA_WIDTH/2, 0);
      Vec2 bicepsShortRadiusAnchor = new Vec2(-RADIUS_LENGTH*3/8, RADIUS_WIDTH/2);
      bicepsShort = new Muscle("Biceps Short", BICEPS_SHORT_LENGTH, BICEPS_SHORT_WIDTH, Muscle.MUSCLE_REST_LENGTH+0.1, scapula.body, radius.body, bicepsShortScapulaAnchor, bicepsShortRadiusAnchor);
      bicepsShort.setMuscleSymmetry(0.6);
      allMuscles.add(bicepsShort);
    }
    
    if (variantIndex==0 || variantIndex==2 || variantIndex==4)
    {
      // BICEPS LONG MUSCLE
      Vec2 bicepsLongHumerusAnchor = new Vec2(-HUMERUS_LENGTH/2-0.01, HUMERUS_WIDTH/2);
      Vec2 bicepsLongRadiusAnchor = new Vec2(-RADIUS_LENGTH*3/8, RADIUS_WIDTH/2);
      bicepsLong = new Muscle("Biceps Long", BICEPS_LONG_LENGTH, BICEPS_LONG_WIDTH, Muscle.MUSCLE_LONG_LENGTH, humerus.body, radius.body, bicepsLongHumerusAnchor, bicepsLongRadiusAnchor);
      Vec2 bicepsScapulaAnchor = new Vec2(0, 0);
      bicepsLong.setPulleys(scapula.body, null, bicepsScapulaAnchor, null );
      bicepsLong.setMuscleSymmetry(0.6);
      allMuscles.add(bicepsLong);
    }
    
    if (variantIndex==0 || variantIndex==3 || variantIndex==4)
    {
      // TRICEPS MEDIAL MUSCLE
      Vec2 tricepsMedialHumerusAnchorA = new Vec2(0, -HUMERUS_WIDTH/2);
      Vec2 tricepsMedialHumerusAnchorB = new Vec2(+HUMERUS_LENGTH/2+0.01, -HUMERUS_WIDTH/2-0.01);
      tricepsMedial = new Muscle("Triceps Medial", TRICEPS_MEDIAL_LENGTH, TRICEPS_MEDIAL_WIDTH, Muscle.MUSCLE_REST_LENGTH, humerus.body, humerus.body, tricepsMedialHumerusAnchorA, tricepsMedialHumerusAnchorB);
      Vec2 tricepsMedialUlnaAnchor = new Vec2(-ULNA_LENGTH*3/8, -ULNA_WIDTH/2);
      tricepsMedial.setPulleys(null, ulna.body, null, tricepsMedialUlnaAnchor);
      allMuscles.add(tricepsMedial);
      
      // TRICEPS LONG MUSCLE
      Vec2 tricepsLongScapulaAnchor = new Vec2(-SCAPULA_LENGTH/2, SCAPULA_WIDTH/6);
      Vec2 tricepsLongHumerusAnchor = new Vec2(+HUMERUS_LENGTH/2+0.01, -HUMERUS_WIDTH/2-0.01);
      tricepsLong = new Muscle("Triceps Long", TRICEPS_LONG_LENGTH, TRICEPS_LONG_WIDTH, Muscle.MUSCLE_REST_LENGTH, scapula.body, humerus.body, tricepsLongScapulaAnchor, tricepsLongHumerusAnchor);
      Vec2 tricepsLongUlnaAnchor = new Vec2(-ULNA_LENGTH*3/8, -ULNA_WIDTH/2);
      tricepsLong.setPulleys(null, ulna.body, null, tricepsLongUlnaAnchor);
      allMuscles.add(tricepsLong);
  
      // TRICEPS LATERAL MUSCLE
      Vec2 tricepsLateralHumerusAnchorA = new Vec2(-HUMERUS_LENGTH/5, -HUMERUS_WIDTH/2);
      Vec2 tricepsLateralHumerusAnchorB = new Vec2(+HUMERUS_LENGTH/2+0.01, -HUMERUS_WIDTH/2-0.01);
      tricepsLateral = new Muscle("Triceps Lateral", TRICEPS_LATERAL_LENGTH, TRICEPS_LATERAL_WIDTH, Muscle.MUSCLE_REST_LENGTH, humerus.body, humerus.body, tricepsLateralHumerusAnchorA, tricepsLateralHumerusAnchorB);
      Vec2 tricepsLateralUlnaAnchor = new Vec2(-ULNA_LENGTH*3/8, -ULNA_WIDTH/2);
      tricepsLateral.setPulleys(null, ulna.body, null, tricepsLateralUlnaAnchor);
      allMuscles.add(tricepsLateral);
    }
    
    // MUSCLE SETS
    if (variantIndex==0 || variantIndex==3 || variantIndex==4) 
      { createMuscleGroup(new String[] {"Triceps Long", "Triceps Medial", "Triceps Lateral"}); }
      
    if (variantIndex==0 || variantIndex==2 || variantIndex==4)
      { createMuscleGroup(new String[] {"Biceps Short", "Biceps Long"}); }
  }
  
  void defineWeights(float x, float y, int variantIndex, int weightIndex)
  {
    float[] variantWeights = {0.0, 1.0, 5.0, 10.0, 50.0, 100.0};
    float weightValue = variantWeights[weightIndex];
    
    if (weightValue>0)
    {
      // WEIGHT
      float offsetWeightX = HUMERUS_LENGTH + ULNA_LENGTH + RADIUS_LENGTH/4;
      float offsetWeightY = HUMERUS_WIDTH/2 - RADIUS_WIDTH/2;
      
      weight = new Weight("Weight", x+offsetWeightX, y+offsetWeightY, weightValue);
      allWeights.add(weight);
  
      //WEIGHT-RADIUS
      radiusWeight = new Glue(radius.body, weight.body);
      allGlues.add(radiusWeight);
    }
  } 

} // End of Class
