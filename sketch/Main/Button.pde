import java.awt.Point;
abstract class Button implements Clickable, Drawable {
  
  private String text;
  private float left, top, w, h, cX, cY;
  private boolean isEnabled = true;
  private boolean isDepressed = false;
  
  public Button(float x, float y, String text) {
    init(x, y, 100, 40, text);
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
  }
  
  void draw() {
    fill(isDepressed || !isEnabled ? 150 : 0);
    rect(left, top, w, h);
    textAlign(CENTER, CENTER);
    fill(255);
    text(text, cX, cY);
  }
  
  boolean getIsEnabled() {
    return isEnabled;
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
  
  abstract void onClick();
  
  void react() {
    isDepressed = true;
  }
  
  void stopReact() {
    isDepressed = false;
  }
  
  boolean withinBounds(float x, float y) {
    println(x, y, this.left, this.top);
    boolean satX = x > this.left && x < this.left + this.w;
    boolean satY = y > this.top && y < this.top + this.h;
    return satX && satY;
  }
}
