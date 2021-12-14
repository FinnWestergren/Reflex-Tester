enum RunMode {
  SETUP,
  RUN,
  RESULTS
}

RunMode currentMode = RunMode.SETUP;
public static ClickManager clickManager;
private Scene currentScene;

void setup() {
  //fullScreen();
  size(600,600);
  clickManager = new ClickManager();
  currentScene = new SetupScene("Click the squares as soon as they appear"){
    void endScene(){
      goToRunMode();
    }
  };
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

void goToRunMode(){
  currentScene = new RunScene(){
    void endScene(){
      goToResultsMode();
    }
  };
}

void goToResultsMode(){
}
