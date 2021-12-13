public class ClickManager {
  ArrayList<Clickable> listeners;
  
  public ClickManager() {
    listeners = new ArrayList<Clickable>();
  }
  
  void attachListener(Clickable obj){
    listeners.add(obj);
  }
  
  void mouseClicked() {
    listeners.forEach(l -> tryClick(l));
  }
  
  void mousePressed() {
    listeners.forEach(l -> tryReact(l));
  }
  
  void mouseReleased() {
    listeners.forEach(l -> l.stopReact());
  }
  
  private void tryClick(Clickable c) {
    c.stopReact();
    if (c.getIsEnabled() && c.withinBounds(mouseX, mouseY)) {
      c.onClick();
    }
  }
  
  private void tryReact(Clickable c) {
    if (c.getIsEnabled() && c.withinBounds(mouseX, mouseY)) {
      c.react();
    }
  }
}
