abstract class Button implements Clickable, Drawable {
  
  private String text;
  private float left, top, w, h, cX, cY;
  private boolean isEnabled = true;
  private boolean isDepressed = false;
  private int hash;
  
  
  public Button(float x, float y) {
    init(x, y, 100, 40, null);
  }
  
  public Button(float x, float y, String text) {
    init(x, y, 100, 40, text);
  }
  
  public Button(float x, float y, float w, float h) {
    init(x, y, w, h, null);
  }
  
  public Button(float x, float y, float w, float h, String text) {
    init(x, y, w, h, text);
  }
  
  private void init(float x, float y, float w, float h, String text) {
    this.cX = x;
    this.cY = y;
    this.left = x - (0.5*w);
    this.top = y - (0.5*h);
    this.w = w;
    this.h = h;
    this.text = text;
    this.hash = (int)(System.currentTimeMillis() % Integer.MAX_VALUE);
  }
  
  void draw() {
    fill(isDepressed || !isEnabled ? 150 : 0);
    rect(left, top, w, h);
    textAlign(CENTER, CENTER);
    fill(255);
    if(text != null){
      text(text, cX, cY);
    }
  }
  
  boolean isEnabled() {
    return this.isEnabled;
  }
  
  void setIsEnabled(boolean val) {
    isEnabled = val;
  }
  
  void disable() {
    isEnabled = false;
  }
  
  void activate() {
    isEnabled = true;
  }
  
  void onClick() {
    println("click");
    onClickAppendage();
  }
  
  abstract void onClickAppendage();
  
  void react() {
    isDepressed = true;
  }
  
  void stopReact() {
    isDepressed = false;
  }
  
  boolean withinBounds(float x, float y) {
    boolean satX = x > this.left && x < this.left + this.w;
    boolean satY = y > this.top && y < this.top + this.h;
    return satX && satY;
  }
  
  int getHash() {
    return hash;
  }
  
  int compareTo(Clickable c){
    return c.getHash() - this.getHash(); 
  }
}
