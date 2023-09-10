// =============================================
// DEMO GRAPHS (for the Muscular Model Framework)
// by Guillem Benavent (Updated: 23/8/2023)
// For Research Project at Taradell School
// =============================================
// Handles the graphs for the interactive demo
// =============================================

// Graph Colors =================================

color COLOR_TEXT=color(255, 219, 115);
color COLOR_GRID=color(129, 110, 59);
color COLOR_ACTIVATION=color(161,44,44);
color COLOR_TENSION=color(161,44,44);
color COLOR_ACTPASTOT=color(0,0,200);
color COLOR_CONTRACTION=color(0,150,0);

// Graphs Functions =============================

void resetGraphsData()
{
    graph1.resetData();
    graph2.resetData();
    graph3.resetData();
    graph4.resetData();
}

void setupGraphsForCurrentModel()
{
  if (currentModel == 0) //Sample Model
  {
    float graphLength = (displayWidth-displayHeight*3/5);
    float graphHeight = ((displayHeight-70)/4);
    graph1 = new LiveGraph(0, 0, graphLength, graphHeight, graphWindow);
    graph1.setAxisProperties(5, 0, 1.2, (1/float(FRAME_RATE)), "/1");
    graph1.setGridProperties(1, 0.2, COLOR_GRID);
    graph1.setGraphProperties(color(50), COLOR_ACTIVATION, 3);
    graph1.setTextProperties(16, 1, "Nivell d'activació dels múscul", 30, new String[]{"Múscul"}, COLOR_TEXT);
    
    graph2 = new LiveGraph(0, graphHeight, graphLength, graphHeight, graphWindow);
    graph2.setAxisProperties(5, 0, 1600, (1/float(FRAME_RATE)), "N");
    graph2.setGridProperties(1, 200, COLOR_GRID);
    graph2.setGraphProperties(color(50), COLOR_TENSION, 2);
    graph2.setTextProperties(16, 0, "Tensió total dels múscul", 30, new String[]{"Múscul"}, COLOR_TEXT);
    
    graph3 = new LiveGraph(0, graphHeight*2, graphLength, graphHeight, graphWindow, 3);
    graph3.setAxisProperties(5, 0, 1600, (1/float(FRAME_RATE)), "N");
    graph3.setGridProperties(1, 200, COLOR_GRID);
    graph3.setGraphProperties(color(50), COLOR_ACTPASTOT, 2);
    graph3.setTextProperties(16, 0, "Tensió activa, passiva i total generada pel múscul", 30, new String[]{"Activa", "Pasiva", "Total"}, COLOR_TEXT);
    
    graph4 = new LiveGraph(0, graphHeight*3, graphLength, graphHeight, graphWindow);
    graph4.setAxisProperties(5, -0.5, 0.5, (1/float(FRAME_RATE)), "/1");
    graph4.setGridProperties(1, 0.1, COLOR_GRID);
    graph4.setGraphProperties(color(50), COLOR_CONTRACTION, 2);
    graph4.setTextProperties(16, 1, "Contracció normalitzada dels biceps", 30, new String[]{"Múscul"}, COLOR_TEXT); 
  }
  else if (currentModel == 1)//Arm model
  {
    float graphLength = (displayWidth-displayHeight*3/5);
    float graphHeight = ((displayHeight-70)/4);
    graph1 = new LiveGraph(0, 0, graphLength, graphHeight, graphWindow, 5);
    graph1.setAxisProperties(5, 0, 1.2, (1/float(FRAME_RATE)), "/1");
    graph1.setGridProperties(1, 0.2, COLOR_GRID);
    graph1.setGraphProperties(color(50), COLOR_ACTIVATION, 3);
    graph1.setTextProperties(16, 1, "Nivell d'activació dels músculs", 30, new String[]{"Bi Llarg", "Bi Curt",  "Tri Larg", "Tri Medial", "Tri Lateral"}, COLOR_TEXT);
    
    graph2 = new LiveGraph(0, graphHeight, graphLength, graphHeight, graphWindow, 5);
    graph2.setAxisProperties(5, 0, 1000, (1/float(FRAME_RATE)), "N");
    graph2.setGridProperties(1, 100, COLOR_GRID);
    graph2.setGraphProperties(color(50), COLOR_TENSION, 2);
    graph2.setTextProperties(16, 0, "Tensió total dels músculs", 30, new String[]{"Bi Llarg", "Bi Curt",  "Tri Larg", "Tri Medial", "Tri Lateral"}, COLOR_TEXT);
    
    graph3 = new LiveGraph(0, graphHeight*2, graphLength, graphHeight, graphWindow, 3);
    graph3.setAxisProperties(5, 0, 1600, (1/float(FRAME_RATE)), "N");
    graph3.setGridProperties(1, 200, COLOR_GRID);
    graph3.setGraphProperties(color(50), COLOR_ACTPASTOT, 2);
    graph3.setTextProperties(16, 0, "Tensió activa, passiva i total generada pel biceps curt", 30, new String[]{"Activa", "Pasiva", "Total"}, COLOR_TEXT);
    
    graph4 = new LiveGraph(0, graphHeight*3, graphLength, graphHeight, graphWindow, 2);
    graph4.setAxisProperties(5, -0.5, 0.5, (1/float(FRAME_RATE)), "/1");
    graph4.setGridProperties(1, 0.1, COLOR_GRID);
    graph4.setGraphProperties(color(50), COLOR_CONTRACTION, 2);
    graph4.setTextProperties(16, 1, "Contracció normalitzada dels biceps", 30, new String[]{"Biceps Llarg", "Biceps Curt"}, COLOR_TEXT); 
  }
  else if (currentModel == 2)//Leg model
  {
    float graphLength = (displayWidth-displayHeight*3/5);
    float graphHeight = ((displayHeight-70)/4);
    graph1 = new LiveGraph(0, 0, graphLength, graphHeight, graphWindow, 4);
    graph1.setAxisProperties(5, 0, 1.2, (1/float(FRAME_RATE)), "/1");
    graph1.setGridProperties(1, 0.2, COLOR_GRID);
    graph1.setGraphProperties(color(50), COLOR_ACTIVATION, 3);
    graph1.setTextProperties(16, 1, "Nivell d'activació dels músculs", 30, new String[]{"Gas Lateral", "Gas Medial",  "Soli", "Tib Anterior"}, COLOR_TEXT);
    
    graph2 = new LiveGraph(0, graphHeight, graphLength, graphHeight, graphWindow, 4);
    graph2.setAxisProperties(5, 0, 3500, (1/float(FRAME_RATE)), "N");
    graph2.setGridProperties(1, 500, COLOR_GRID);
    graph2.setGraphProperties(color(50), COLOR_TENSION, 2);
    graph2.setTextProperties(16, 0, "Tensió total dels músculs", 30, new String[]{"Gas Lateral", "Gas Medial",  "Soli", "Tib Anterior"}, COLOR_TEXT);
    
    graph3 = new LiveGraph(0, graphHeight*2, graphLength, graphHeight, graphWindow, 3);
    graph3.setAxisProperties(5, 0, 3500, (1/float(FRAME_RATE)), "N");
    graph3.setGridProperties(1, 500, COLOR_GRID);
    graph3.setGraphProperties(color(50), COLOR_ACTPASTOT, 2);
    graph3.setTextProperties(16, 0, "Tensió activa, passiva i total generada pel Gastrocnemi Lateral", 30, new String[]{"Activa", "Pasiva", "Total"}, COLOR_TEXT);
    
    graph4 = new LiveGraph(0, graphHeight*3, graphLength, graphHeight, graphWindow, 2);
    graph4.setAxisProperties(5, -0.5, 0.5, (1/float(FRAME_RATE)), "/1");
    graph4.setGridProperties(1, 0.1, COLOR_GRID);
    graph4.setGraphProperties(color(50), COLOR_CONTRACTION, 2);
    graph4.setTextProperties(16, 1, "Contracció normalitzada dels biceps", 30, new String[]{"Gas Lateral", "Gas Medial"}, COLOR_TEXT); 
  }
}

void addDataPointsToGraphs()
{
  if (model.isSimulationRunning && model.currentSimulationLevel > MuscularModel.SIMULATION_LEVEL_JOINTS)
  {
    if (currentModel == 0) //Sample Model
    {
      if (model.getMuscleByName("Muscle", false) != null)
      {
        float data1 = model.getMuscleByName("Muscle").activation;
        graph1.addPoint(data1);
        
        float data2 = model.getMuscleByName("Muscle").forceNow;
        graph2.addPoint(data2);
        
        float[] data3 = new float[]{model.getMuscleByName("Muscle").forceActive, model.getMuscleByName("Muscle").forcePasive, model.getMuscleByName("Muscle").forceTotal};
        graph3.addPoint(data3);
        
        float data4 = model.getMuscleByName("Muscle").normalizedContraction;
        graph4.addPoint(data4);
      }
    }
    else if (currentModel == 1) //Arm Model
    {
      if (model.getMuscleByName("Biceps Long", false) != null && model.getMuscleByName("Triceps Long", false) != null)
      {
        float[] data1 = new float[] {  model.getMuscleByName("Biceps Long").activation, 
                                       model.getMuscleByName("Biceps Short").activation,
                                       model.getMuscleByName("Triceps Long").activation,
                                       model.getMuscleByName("Triceps Medial").activation,
                                       model.getMuscleByName("Triceps Lateral").activation
                                     };
        graph1.addPoint(data1);
      }
      
      if (model.getMuscleByName("Biceps Long", false) != null && model.getMuscleByName("Triceps Long", false) != null)
      {
        float[] data2 = new float[] {  model.getMuscleByName("Biceps Long").forceTotal, 
                                       model.getMuscleByName("Biceps Short").forceTotal,
                                       model.getMuscleByName("Triceps Long").forceTotal,
                                       model.getMuscleByName("Triceps Medial").forceTotal,
                                       model.getMuscleByName("Triceps Lateral").forceTotal
                                     };
        graph2.addPoint(data2);
      } 
      
      if (model.getMuscleByName("Biceps Short", false) != null && model.currentSimulationLevel > 2)
      {
        float[] data3 = new float[] {  model.getMuscleByName("Biceps Short").forceActive, 
                                       model.getMuscleByName("Biceps Short").forcePasive, 
                                       model.getMuscleByName("Biceps Short").forceTotal
                                     };
        graph3.addPoint(data3);
        
        float[] data4 = new float[]{model.getMuscleByName("Biceps Long", false).normalizedContraction, model.getMuscleByName("Biceps Short", false).normalizedContraction};
        graph4.addPoint(data4);
      }
    }
    else if (currentModel == 2) //Leg Model
    {
      if (model.getMuscleByName("Gastrocnemius Lateral", false) != null && model.getMuscleByName("Tibialis Anterior", false) != null)
      {
        float[] data1 = new float[] {  model.getMuscleByName("Gastrocnemius Lateral").activation, 
                                       model.getMuscleByName("Gastrocnemius Medial").activation,
                                       model.getMuscleByName("Soleus").activation,
                                       model.getMuscleByName("Tibialis Anterior").activation,
                                     };
        graph1.addPoint(data1);
      }
      
      if (model.getMuscleByName("Gastrocnemius Lateral", false) != null && model.getMuscleByName("Tibialis Anterior", false) != null)
      {
        float[] data2 = new float[] {  model.getMuscleByName("Gastrocnemius Lateral").forceTotal, 
                                       model.getMuscleByName("Gastrocnemius Medial").forceTotal,
                                       model.getMuscleByName("Soleus").forceTotal,
                                       model.getMuscleByName("Tibialis Anterior").forceTotal,
                                     };
        graph2.addPoint(data2);
      } 
      
      if (model.getMuscleByName("Gastrocnemius Lateral", false) != null && model.currentSimulationLevel > 2)
      {
        float[] data3 = new float[] {  model.getMuscleByName("Gastrocnemius Lateral").forceActive, 
                                       model.getMuscleByName("Gastrocnemius Lateral").forcePasive, 
                                       model.getMuscleByName("Gastrocnemius Lateral").forceTotal
                                     };
        graph3.addPoint(data3);
        
        float[] data4 = new float[]{model.getMuscleByName("Gastrocnemius Lateral").normalizedContraction, model.getMuscleByName("Gastrocnemius Lateral").normalizedContraction};
        graph4.addPoint(data4);
      }
    }
  }
}
