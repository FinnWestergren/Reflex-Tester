import java.util.Timer;
import java.util.TimerTask;

public abstract class RunScene implements Scene {
  
  private final int _minTime = 1000;
  private final int _maxTime = 6000;
  private final int _maxRuns = 10;
  private PImage logo;
  
  
  private Timer timer;
  private Button nextButton = null; 
  
  private long[] clickTimes = new long[_maxRuns];
  private long[] renderTimes = new long[_maxRuns];
  private int runCounter = 0;
  
  public RunScene() {
    runCounter = 0;
    logo = loadImage("logo.jpg");
    timer = new Timer();
    scheduleNextSquare();
  }
  
  
  public void draw(){
    if (nextButton != null){
      nextButton.draw();
    }
  }
  
  private int random(int min, int range) {
    double rand = Math.random() * range;
    return min + (int) rand;
  }
  
  private void clearButton() {
    if (nextButton != null) {
      clickManager.detachListener(nextButton);
    }
    nextButton = null;
  }
  
  private void scheduleNextSquare() {
    timer.schedule(new TimerTask(){ 
      void run(){
        createNextButton();
        recordRenderTime();
      }
    }, random(_minTime, _maxTime - _minTime));
  }
  
  void createNextButton() {
    int x = random(logo.width, width - logo.width * 2);
    int y = random(logo.height, height - logo.height * 2);
    nextButton = new ImageButton(x,y,logo){
      void onClickAppendage () {
        cycle(); //<>//
      }
    };
    clickManager.attachQuickListener(nextButton);
  }
  
  private void cycle(){
    recordClickTime();
    clearButton();
    if (++runCounter >= _maxRuns) endScene();
    else scheduleNextSquare();
  }
  
  private void recordClickTime(){
    clickTimes[runCounter] = System.currentTimeMillis();
  }
  private void recordRenderTime(){
    renderTimes[runCounter] = System.currentTimeMillis();
  }
  
  public ArrayList<Integer> getResults(){
    ArrayList<Integer> list = new ArrayList<Integer>();
    for(int i = 0; i < runCounter; i++) {
      int value = (int)(clickTimes[i] - renderTimes[i]);
      list.add(value);
    } 
    return list;
  };
  
  abstract void endScene();
  
}
