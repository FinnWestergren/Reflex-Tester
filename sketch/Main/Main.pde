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
  //fullScreen();
  size(600,600);
  clickManager = new ClickManager();
  readyButton = new Button(width/2, height * 0.66f, "Ready"){
    void onClick() {
      println("button clicked!");
    }
  };
  clickManager.attachListener(readyButton);
  readyButton.setIsEnabled(validSelection());
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

void mousePressed() {
  clickManager.mousePressed();
}

void mouseReleased() {
  clickManager.mouseReleased();
}

void drawSetupScreen(){
  textAlign(CENTER);
  fill(0);
  text(setupMessage(), width/2, height/3);
  readyButton.draw();
}


void keyPressed() {
  switch (currentMode){
    case SETUP:
      setSelectedKey(key);
      return;
    default:
      break;
  }
}

void setSelectedKey(char value) {
    selectedKey = value;
    readyButton.setIsEnabled(validSelection());
}

String setupMessage() {
  String out = "Press the key you would like to use to perform this test";
  if (!validSelection() && selectedKey != 0) {
    out += "\n Selected key not supported";
    return out;
  }
  if (selectedKey != 0){
    out += "\n Selected key: " + (int) selectedKey;
  }
  return out;
}

boolean validSelection() {
  return selectedKey != CODED && selectedKey != 0;
}

void refreshBackground() {
  fill(255);
  rect(-1,-1, width + 2, height + 2);
}
