abstract class Button implements Clickable, Drawable {
  
  float x, y, w, h;
  boolean isEnabled;
  
  public Button(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    isEnabled = true;
  }
  
  void draw() {
    pushMatrix();
    translate(x - (w * 0.5), y - (h * 0.5));
    rect(0,0,w,h);
    popMatrix();
  }
  
  boolean getIsEnabled() {
    return isEnabled;
  }
  
  void disable() {
    isEnabled = false;
  }
  
  void activate() {
    isEnabled = true;
  }
  
  
  abstract void onClick();
  
  boolean withinBounds(float x, float y) {
    boolean satX = x > this.x && x < this.x + this.w;
    boolean satY = y > this.y && x < this.y + this.h;
    return satX && satY;
  }
}
