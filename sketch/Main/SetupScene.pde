public abstract class SetupScene implements Scene{
  
  private String setupMessage;
  private Button readyButton;
  
  public SetupScene(String setupMessage) {
    this.setupMessage = setupMessage;
    readyButton = new Button(width/2, height * 0.66f, "Ready"){
      void onClickAppendage() {
        endScene();
        clickManager.detachListener(this);
      }
    };
    clickManager.attachListener(readyButton);
  }
  
  public void draw(){
    textAlign(CENTER);
    fill(0);
    text(setupMessage, width/2, height/3);
    readyButton.draw();
  }
  
  abstract void endScene();
}
