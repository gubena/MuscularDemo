// =============================================
// DEMO MAIN (for the Muscular Model Framework)
// by Guillem Benavent (Updated: 23/8/2023)
// For Research Project at Taradell School
// =============================================
// Handles the interactive demo for multiple muscular models
// =============================================


//General libraries
import g4p_controls.*;
import java.awt.Font;

int FRAME_RATE = 60;

int currentModel;
int selectedModel;
int simulationLevel;
int modelVariantIndex;
int modelWeightIndex;
int muscleGroupIndex;

float activation;
int pulseLastZeroTime = 0;
boolean activationPulse = false;
boolean activationPulseEnabled = false;

// Window objects (apart from default)
GWindow graphWindow, controlWindow;

// Model object
MuscularModel model;

//Graph objects
LiveGraph graph1, graph2, graph3, graph4;

// Control objects
GButton playPauseButton, reloadButton;
GDropList modelDropList, variantDropList, levelDropList, weightDropList, muscleGroupDropList;
GSlider activationSlider;
GButton saveGraph1, saveGraph2, saveGraph3, saveGraph4;

void settings()
{
  //set size of Main Window
  size(displayHeight*3/5, displayHeight*3/5);
  
  smooth();
 
}


void setup()
{
  // SetUp Box2D
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
 
  // Set default currents
  currentModel = 1;
  selectedModel = 1;
  simulationLevel = MuscularModel.SIMULATION_LEVEL_WEIGHTS;  
  modelVariantIndex = 0;
  modelWeightIndex = 1;

  // Load current MuscularModel
  reloadSelectedModel();
 
  // Setup Windows 
  setupAllWindows();
  setupGraphsForCurrentModel(); 
  setupControlWindow();
}


void draw()
{
  background(50);
  
  if (model.isSimulationRunning==true) 
  {
    model.step();
    
    if (activationPulse)
    {
      pulseLastZeroTime = millis();
      model.setMuscleGroupActivation(muscleGroupIndex, 1);
      activationPulse = false;
    }
    else
    {
      model.setMuscleGroupActivation(muscleGroupIndex, activationSlider.getValueF());
      //model.setMuscleGroupTension(muscleGroupIndex, activationSlider.getValueF()*500);
    }
  }
  
  model.display();
  
  addDataPointsToGraphs();

}

// Model Functions ============================

void reloadSelectedModel()
{
  if (selectedModel == 0)
  {
    model = new SampleModel(this, 0.0, 0.3, 75, FRAME_RATE, simulationLevel, modelVariantIndex, modelWeightIndex);
    model.setGridProperties(0.05, 10);
    model.setGravity(new Vec2(0, -9.8));
  }
  else if (selectedModel == 1)
  {
    model = new ArmModel(this, -0.20, 0.30, 50, FRAME_RATE, simulationLevel, modelVariantIndex, modelWeightIndex);
    model.setGridProperties(0.05, 10);
    model.setGravity(new Vec2(0, -9.8));
  }
  else if (selectedModel == 2)
  {
    model = new LegModel(this, -0.30, 0.30, 50, FRAME_RATE, simulationLevel, modelVariantIndex, modelWeightIndex);
    model.setGridProperties(0.05, 10);
    model.setGravity(new Vec2(0, -9.8));
  }
  
}

// Windows Functions ===========================

void setupAllWindows()
{
    //General setup
  frameRate(FRAME_RATE);

  // Set Default Window
  surface.setLocation(-7, 0);
  surface.setTitle("Simulation Panel");
  textSize(100); //stop blurry text
  
  // Create and Set Graph Window
  graphWindow =  GWindow.getWindow(this, "Graph Panel", displayHeight*3/5-5, 0, displayWidth-displayHeight*3/5, displayHeight-70, JAVA2D);
  graphWindow.addDrawHandler(this, "drawGraphPanel");
  graphWindow.textSize(100); //stop blurry text

  // Create and Set Control Window
  int controlWindowHeight = displayHeight*2/5-100;
  int controlWindowWidth = displayHeight*3/5;
  controlWindow =  GWindow.getWindow(this, "Control Panel", -7, displayHeight*3/5+30, controlWindowWidth, controlWindowHeight, JAVA2D);
  controlWindow.addDrawHandler(this, "drawControlPanel");
  controlWindow.textSize(100); //stop blurry text

}

public void drawGraphPanel(PApplet window, GWinData data)
{
  window.background(50);
  if (this.graph1 == null)
  {
    delay(200);
  }
  graph1.display();
  graph2.display();
  graph3.display();
  graph4.display();
}

public void drawControlPanel(PApplet window, GWinData data)
{
  window.background(70);
 
  // Draw Text Control Panel
  
  window.textSize(20);
  window.text("Model", 55, 90);
  window.text("Variant", 210, 90);
  window.text("Pes", 390, 90);
  window.text("Simulació", 525, 90);
  window.text("Múscul Controlat", 10, 165);

}



// Simulation Events =======================================

void keyPressed() 
{
  // Triggers an activation pulse
  if (key == ' ' && activationPulseEnabled) {activationPulse = true; activationPulseEnabled = false;}
}

void keyReleased()
{
  // Re-enable activation pulse triggering
  if (key == ' ') {activationPulseEnabled = true;}
}

void mouseWheel(MouseEvent event)
{
  // Zooms Simulation content
  float wheelChange = event.getCount();
  model.incrementDisplayScale(-2*wheelChange);
}

void mousePressed() {
  // Reset Simulation Zoom 
  if(mouseButton == RIGHT){
    model.resetDisplayScale();
  }
}
