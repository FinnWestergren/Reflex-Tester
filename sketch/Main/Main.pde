enum RunMode {
  SETUP,
  RUN,
  RESULTS
}

RunMode currentMode = RunMode.SETUP;
public static ClickManager clickManager;
private Scene currentScene;

void setup() {
  fullScreen();
  clickManager = new ClickManager();
  goToSetupMode();
}

void draw(){
  refreshBackground();
  currentScene.draw();
}

void mouseClicked() {
  clickManager.mouseClicked();
}

void mousePressed() {
  clickManager.mousePressed();
}

void mouseReleased() {
  clickManager.mouseReleased();
}



void refreshBackground() {
  fill(255);
  rect(-1,-1, width + 2, height + 2);
}

void goToSetupMode(){
  currentScene = new SetupScene("Click the squares as soon as they appear"){
    void endScene(){
      goToRunMode();
    }
  };
}

void goToRunMode(){
  currentScene = new RunScene(){
    void endScene() {
      goToResultsMode(this.getResults());
    }
  };
}

void goToResultsMode(ArrayList<Integer> list){
  currentScene = new ResultsScene(list){
    void endScene(){
      goToSetupMode();
    }
  };
}
