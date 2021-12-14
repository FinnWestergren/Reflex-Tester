import java.util.Map;
import java.util.PriorityQueue;

public class ClickManager {
  Map<Integer, Clickable> listeners;
  PriorityQueue<Integer> detachQueue;
  
  public ClickManager() {
    listeners = new HashMap<Integer, Clickable>();
    detachQueue = new PriorityQueue<Integer>();
  }
  
  void attachListener(Clickable obj){
    listeners.put(obj.getHash() ,obj);
  }
  
  
  
  void detachListener(Clickable obj){
    detachQueue.add(obj.getHash());
  }  
  
  void mouseClicked() {
    listeners.values().forEach(l -> tryClick(l));
    while(detachQueue.size() > 0) {
      listeners.remove(detachQueue.poll());
    }
  }
  
  void mousePressed() {
    listeners.values().forEach(l -> tryReact(l));
  }
  
  void mouseReleased() {
    listeners.values().forEach(l -> l.stopReact());
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
