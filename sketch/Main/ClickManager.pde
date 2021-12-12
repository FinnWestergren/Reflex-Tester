public class ClickManager {
  ArrayList<Clickable> listeners;
  
  public ClickManager() {
    listeners = new ArrayList<Clickable>();
  }
  
  void AttachListener(Clickable obj){
    listeners.add(obj);
  }
  
  void mouseClicked() {
    println("click");
    listeners.forEach(l -> tryClick(l));
  }
  
  private void tryClick(Clickable c) {
    if (c.getIsEnabled() && c.withinBounds(mouseX, mouseY)) {
      c.onClick();
    }
  }
}
