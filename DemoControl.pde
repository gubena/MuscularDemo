// =============================================
// DEMO CONTROLS (for the Muscular Model Framework)
// by Guillem Benavent (Updated: 23/8/2023)
// For Research Project at Taradell School
// =============================================
// Handles the GUI functions for the interactive demo
// =============================================

void setupControlWindow()
{
  int controlWindowHeight = displayHeight*2/5-100;
  int controlWindowWidth = displayHeight*3/5;
  
  int margin = 10;  
  
  playPauseButton = new GButtonPlus(controlWindow, margin, margin, controlWindowWidth/2-2*margin, 50, "PLAY");
  playPauseButton.setFont(new Font("Arial", Font.PLAIN, 24));
  playPauseButton.setLocalColorScheme(7);
  
  reloadButton = new GButtonPlus(controlWindow, margin+controlWindowWidth/2, margin, controlWindowWidth/2-2*margin, 50, "RELOAD");
  reloadButton.setFont(new Font("Arial", Font.PLAIN, 24));
  reloadButton.setLocalColorScheme(7);
  
  // GDropList => GDropListPlus
  modelDropList = new GDropListPlus(controlWindow, margin, 2*margin+80, ((controlWindowWidth/4-2*margin)), 110, 0, 20);
  modelDropList.setFont(new Font("Arial", Font.PLAIN, 20));
  modelDropList.addItem("Exemple Mínim");
  modelDropList.addItem("Braç Superior");
  modelDropList.addItem("Cama Inferior");
  modelDropList.setLocalColorScheme(4); 
  modelDropList.setSelected(selectedModel);
  
  variantDropList = new GDropListPlus(controlWindow, ((controlWindowWidth/4*1))+margin, 2*margin+80, ((controlWindowWidth/4-2*margin)), 310, 10, 20);
  variantDropList.setFont(new Font("Arial", Font.PLAIN, 20));
  variantDropList.addItem("No hi ha variants creades");
  variantDropList.setLocalColorScheme(4); 
  updateVariantDropList();
  
  weightDropList = new GDropListPlus(controlWindow, ((controlWindowWidth/4*2))+margin, 2*margin+80, ((controlWindowWidth/4-2*margin)), 310, 10, 20);
  weightDropList.setFont(new Font("Arial", Font.PLAIN, 20));
  weightDropList.addItem("No hi ha pesos creats");
  updateWeightDropList();
  weightDropList.setLocalColorScheme(4); 
  
  levelDropList = new GDropListPlus(controlWindow, ((controlWindowWidth/4*3))+margin, 2*margin+80, ((controlWindowWidth/4-2*margin)), 310, 10, 20);
  levelDropList.setFont(new Font("Arial", Font.PLAIN, 20));
  levelDropList.addItem("Res");
  levelDropList.addItem("Ossos");
  levelDropList.addItem("+Articulacions");
  levelDropList.addItem("+Músculs");
  levelDropList.addItem("+Pesos");
  levelDropList.setLocalColorScheme(4); 
  levelDropList.setSelected(simulationLevel);
  
  muscleGroupDropList = new GDropListPlus(controlWindow, margin, controlWindowHeight/2+margin, controlWindowWidth-2*margin, 140, 4, 20);
  muscleGroupDropList.setFont(new Font("Arial", Font.PLAIN, 20));
  muscleGroupDropList.addItem("No hi ha músculs creats");
  muscleGroupDropList.setLocalColorScheme(0); 
  updateGroupDropListFromCurrentModel();
   
  activationSlider = new GSliderPlus(controlWindow, margin, controlWindowHeight/2+25, controlWindowWidth-2*margin, 100, 30);
  activationSlider.setLimits(0, 1);
  activationSlider.setNumberFormat(G4P.DECIMAL, 2);
  activationSlider.setLocalColorScheme(0); 
  activationSlider.setValue(0); 
  activationSlider.setShowValue(true); 
  activationSlider.setEasing(2);  
  
  saveGraph1 = new GButtonPlus(controlWindow, margin, controlWindowHeight-60, controlWindowWidth/4-2*margin, 50, "Exporta gràfic 1");
  saveGraph1.setFont(new Font("Arial", Font.PLAIN, 16));
  saveGraph1.setLocalColorScheme(7);
  
  saveGraph2 = new GButtonPlus(controlWindow, margin+controlWindowWidth/4, controlWindowHeight-60, controlWindowWidth/4-2*margin, 50, "Exporta gràfic 2");
  saveGraph2.setFont(new Font("Arial", Font.PLAIN, 16));
  saveGraph2.setLocalColorScheme(7);
  
  saveGraph3 = new GButtonPlus(controlWindow, margin+2*controlWindowWidth/4, controlWindowHeight-60, controlWindowWidth/4-2*margin, 50, "Exporta gràfic 3");
  saveGraph3.setFont(new Font("Arial", Font.PLAIN, 16));
  saveGraph3.setLocalColorScheme(7);
  
  saveGraph4 = new GButtonPlus(controlWindow, margin+3*controlWindowWidth/4, controlWindowHeight-60, controlWindowWidth/4-2*margin, 50, "Exporta gràfic 4");
  saveGraph4.setFont(new Font("Arial", Font.PLAIN, 16));
  saveGraph4.setLocalColorScheme(7);
  
  
  // Customized Color Schemes
  
  GCScheme.changePaletteColor(0, 11, color(230,0,0));//highlighted ball
  GCScheme.changePaletteColor(0, 14, color(230,0,0));//ball clicked
  GCScheme.changePaletteColor(0, 15, color(230,0,0));//ball moving
  GCScheme.changePaletteColor(7, 14, color(232, 198, 105));//ball clicked
  GCScheme.changePaletteColor(4, 14, color(206, 148, 94));//ball clicked

  setGreyColorScheme(8);
  setGreyDropListColorScheme(9);
}




void setGreyColorScheme(int schemeIndex) 
{
  GCScheme.changePaletteColor(schemeIndex, 2, color(255,255,255));//text color
  GCScheme.changePaletteColor(schemeIndex, 3, 50);//outline and ball
  GCScheme.changePaletteColor(schemeIndex, 4, 150);//button background
  GCScheme.changePaletteColor(schemeIndex, 5, 150);//slider background
  GCScheme.changePaletteColor(schemeIndex, 6, 100);//button hover
  GCScheme.changePaletteColor(schemeIndex, 11, 100);//highlighted ball
  GCScheme.changePaletteColor(schemeIndex, 14, 100);//ball clicked
  GCScheme.changePaletteColor(schemeIndex, 15, 100);//ball moving
}

void setGreyDropListColorScheme(int schemeIndex) 
{
  GCScheme.changePaletteColor(schemeIndex, 2, color(255,255,255));//text color
  GCScheme.changePaletteColor(schemeIndex, 3, color(255,255,255));//outline and ball
  GCScheme.changePaletteColor(schemeIndex, 4, 150);//button background
  GCScheme.changePaletteColor(schemeIndex, 5, 150);//slider background
  GCScheme.changePaletteColor(schemeIndex, 6, 100);//button hover
  GCScheme.changePaletteColor(schemeIndex, 11, 100);//highlighted ball
  GCScheme.changePaletteColor(schemeIndex, 14, 100);//ball clicked
  GCScheme.changePaletteColor(schemeIndex, 15, color(255,255,255));//ball moving
  GCScheme.changePaletteColor(schemeIndex, 13, color(255,255,255));//text color
}

void updateControlForCurrentModel()
{
    playPauseButton.setText("PLAY");
    
    updateGroupDropListFromCurrentModel();

    activationSlider.setValue(0);
    currentModel = selectedModel;
    activation = 0;
}


// Update Droplist Functions ==================================

void updateGroupDropListFromCurrentModel()
{
  // set no-items message
  while (muscleGroupDropList.removeItem(0)){};
  muscleGroupDropList.addItem("No hi ha músculs creats");
  muscleGroupDropList.removeItem(0);
  
  for(int i = 0; i < model.allMuscleGroups.size(); i++)
  {
    muscleGroupDropList.addItem(model.getMuscleGroupName(i));
  }
  muscleGroupDropList.removeItem(0);
  muscleGroupDropList.setSelected(0);
  muscleGroupIndex = 0;
}

void updateVariantDropList()
{
  println("updating variant");
  MuscularModel modelDummy;
  if (selectedModel == 0)
  {
    modelDummy = new SampleModel(this, -0.2, 0.15, 100, FRAME_RATE, simulationLevel, 0, 1);
    println("sample model");
  }
  else if (selectedModel == 1)
  {
    modelDummy = new ArmModel(this, -0.2, 0.15, 100, FRAME_RATE, simulationLevel, 0, 1);
    println("arm model");
  }
  else if (selectedModel == 2)
  {
    modelDummy = new LegModel(this, -0.30, 0.30, 100, FRAME_RATE, simulationLevel, 0, modelWeightIndex);
    println("leg model");
  }
  else
  {
    modelDummy = null;
  }
  
  if (modelDummy != null)
  {
    while (variantDropList.removeItem(0)){};
    for(int i = 0; i < modelDummy.variantNames.size(); i++)
    {
      variantDropList.addItem(modelDummy.variantNames.get(i));
    }
    
    variantDropList.removeItem(0);
    if (modelVariantIndex > modelDummy.variantNames.size()-1)
    {
      modelVariantIndex = modelDummy.variantNames.size()-1;
    }
    variantDropList.setSelected(modelVariantIndex);
  }
  else
  {
    println("Error on selectedModel when updating variant drop list");
  }
  

}

void updateWeightDropList()
{
  MuscularModel modelDummy;
  if (selectedModel == 0)
  {
    modelDummy = new SampleModel(this, -0.2, 0.15, 100, FRAME_RATE, simulationLevel, 0, 1);
    println("sample model");
  }
  else if (selectedModel == 1)
  {
    modelDummy = new ArmModel(this, -0.2, 0.15, 100, FRAME_RATE, simulationLevel, 0, 1);
    println("arm model");
  }
  else if (selectedModel == 2)
  {
    modelDummy = new LegModel(this, -0.2, 0.15, 100, FRAME_RATE, simulationLevel, 0, 1);
    println("leg model");
  }
  else
  {
    modelDummy = null;
  }
  
  
  if (modelDummy != null)
  {
    while (weightDropList.removeItem(0)){};
    for(int i = 0; i < modelDummy.weightNames.size(); i++)
    {
      weightDropList.addItem(modelDummy.weightNames.get(i));
    }
    
    weightDropList.removeItem(0);
    weightDropList.setSelected(1);
    modelWeightIndex = 1;
    
  }
  else
  {
    println("Error on selectedModel when updating weight drop list");
  }
}

// Slider Event ===================================================

void handleSliderEvents(GValueControl slider, GEvent event) 
{ 
  if (slider == activationSlider)// && event == GEvent.VALUE_CHANGING)
  {
    activationSlider.setEasing(2);  
  }
}


// Droplist Events ===========================================

void handleDropListEvents(GDropList list, GEvent event)
  {
    if(list == muscleGroupDropList)
    {
      muscleGroupIndex = list.getSelectedIndex();
      activationSlider.setEasing(1);  
      println("Activation group "+muscleGroupIndex+" is "+model.getMuscleGroupActivation(muscleGroupIndex));
      activationSlider.setValue(model.getMuscleGroupActivation(muscleGroupIndex));
    }
    else if(list ==modelDropList)
    {
      selectedModel = list.getSelectedIndex();
      updateVariantDropList();
      updateWeightDropList();
    }
    else if(list == levelDropList)
    {
      simulationLevel = list.getSelectedIndex();
    }
    else if(list == variantDropList)
    {
      modelVariantIndex = list.getSelectedIndex();
    }
    else if(list == weightDropList)
    {
      modelWeightIndex = list.getSelectedIndex();
    }
  }

// Button Events ===================================

void handleButtonEvents(GButton button, GEvent event)
{
  //play pause toggle button
  if (button == playPauseButton)
  {
    model.togglePauseSimulation();
    
    if(model.isSimulationRunning)
    {
      playPauseButton.setText("PAUSE");
    }
    else
    {
      playPauseButton.setText("PLAY");
    }
  }
  else if (button == reloadButton)
  {
    reloadSelectedModel();
    resetGraphsData();
    updateControlForCurrentModel();
    setupGraphsForCurrentModel();

  }
  else if (button == saveGraph1)
  {
    graph1.export("graph1");
  }
  else if (button == saveGraph2)
  {
    graph2.export("graph2");
  }
  else if (button == saveGraph3)
  {
    graph3.export("graph3");
  }
  else if (button == saveGraph4)
  {
    graph4.export("graph4");
  }
}

// ====================== DropList FontSize Fix
// https://forum.processing.org/one/topic/g4p-droplist-how-to-change-font-and-or-size-of-text.html

public class GDropListPlus extends GDropList {

  public GDropListPlus(PApplet theApplet, float p0, float p1, float p2, float p3) {
    super(theApplet, p0, p1, p2, p3);
  }

  public GDropListPlus(PApplet theApplet, int p0, int p1, int p2, int p3, int dropListMaxSize, int other) {
    super(theApplet, p0, p1, p2, p3, dropListMaxSize, other);
  }

  public void setFont(Font font) {
    if (font != null && font != localFont && buffer != null) {
      localFont = font;
      buffer.g2.setFont(localFont);
      bufferInvalid = true;
    }
  }
}

public class GButtonPlus extends GButton {

  public GButtonPlus(PApplet theApplet, int p0, int p1, int p2, int p3, String text) {
    super(theApplet, p0, p1, p2, p3, text);
  }

  public void setFont(Font font) {
    if (font != null && font != localFont && buffer != null) {
      localFont = font;
      buffer.g2.setFont(localFont);
      bufferInvalid = true;
    }
  }
}

public class GSliderPlus extends GSlider {

  public GSliderPlus(PApplet theApplet, int p0, int p1, int p2, int p3, int p4) {
    super(theApplet, p0, p1, p2, p3, p4);
  } 

  public void setFont(Font font) {
    if (font != null && font != localFont && buffer != null) {
      localFont = font;
      buffer.g2.setFont(localFont);
      bufferInvalid = true;
    }
  }
}
  
