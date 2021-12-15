public abstract class ImageButton extends Button {
  
  private PImage image;
  
  public ImageButton(float x, float y, PImage image) {
    super(x, y, image.width, image.height);
    this.image = image;
  }
  
  @Override
  public void draw() {
    rect(left, top, w, h);
    image(image, this.left, this.top);
  }
}
