import java.util.Map;
import java.util.PriorityQueue;
import java.util.Collection;

public class ClickManager {
  
  ListenerMap slowMap;
  ListenerMap quickMap;
  
  public ClickManager() {
    slowMap = new ListenerMap();
    quickMap = new ListenerMap();
  }
  
  void attachListener(Clickable obj){
    slowMap.add(obj);
  }
  
  void attachQuickListener(Clickable obj){
    quickMap.add(obj);
  }
  
  void detachListener(Clickable obj){
    if (slowMap.contains(obj)) {
      slowMap.remove(obj);
    }
    if (quickMap.contains(obj)) {
      quickMap.remove(obj);
    }
  }
  
  void mouseClicked() {
    slowMap.values().forEach(l -> tryClick(l));
    slowMap.flushDetachQueue();
  }
  
  void mousePressed() {
    slowMap.flushAttachQueue();
    quickMap.flushAttachQueue();
    slowMap.values().forEach(l -> tryReact(l));
    quickMap.values().forEach(l -> tryClick(l));
    quickMap.flushDetachQueue();
  }
  
  void mouseReleased() {
    slowMap.values().forEach(l -> l.stopReact());
  }
  
  private void tryClick(Clickable c) {
    c.stopReact();
    if (c.isEnabled() && c.withinBounds(mouseX, mouseY)) {
      c.onClick();
    }
  }
  
  private void tryReact(Clickable c) {
    if (c.isEnabled() && c.withinBounds(mouseX, mouseY)) {
      c.react();
    }
  }
}

class ListenerMap {
  Map<Integer, Clickable> listeners;
  PriorityQueue<Integer> detachQueue;
  PriorityQueue<Clickable> attachQueue;
  
  public ListenerMap() {
    listeners = new HashMap<Integer, Clickable>();
    detachQueue = new PriorityQueue<Integer>();
    attachQueue = new PriorityQueue<Clickable>();
  }
  
  public void add(Clickable obj){
    attachQueue.add(obj);
  }
  
  public void remove(Clickable obj){
    detachQueue.add(obj.getHash());
  }
  
  public void flushAttachQueue(){
    while(attachQueue.size() > 0) {
      Clickable obj = attachQueue.poll();
      listeners.put(obj.getHash(), obj);
    }
  }
  
  public void flushDetachQueue(){
    while(detachQueue.size() > 0) {
      int hash = detachQueue.poll();
      listeners.remove(hash);
    }
  }
  
  public boolean contains(Clickable obj) {
    return listeners.containsKey(obj.getHash());
  }
  
  public Collection<Clickable> values() {
    return listeners.values();
  }
}
