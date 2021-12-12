enum RunMode {
  SETUP,
  RUN,
  RESULTS
}

RunMode currentMode = RunMode.SETUP;
char selectedKey = 0;
ClickManager clickManager;
Button readyButton;

void setup() {
  size(600,600);
  clickManager = new ClickManager();
  readyButton = new Button(width/2, height * 0.66f, 50, 20){
    void onClick() {
      println("button clicked!");
    }
  };
  //fullScreen();
}

void draw(){
  refreshBackground();
  switch(currentMode){
    case SETUP:
      drawSetupScreen();
      return;
    default:
      return;
  }
}

void mouseClicked() {
  clickManager.mouseClicked();
}

void drawSetupScreen(){
  textAlign(CENTER);
  fill(0);
  text(setupMessage(), width/2, height/3);
  if (keyPressed) {
    setSelectedKey();
  }
}

void setSelectedKey () {
    selectedKey = key;
}

String setupMessage() {
  String out = "Press the key you would like to use to perform this test";
  if (!validSelection()) {
    out += "\n Selected key not yet supported";
    return out;
  }
  if (selectedKey != 0){
    out += "\n Selected key: " + (int) selectedKey;
  }
  return out;
}

boolean validSelection() {
  return selectedKey != CODED;
}

void refreshBackground() {
  fill(255);
  rect(-1,-1, width + 2, height + 2);
}
