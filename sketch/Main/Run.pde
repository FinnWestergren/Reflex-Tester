import java.util.Timer;
import java.util.TimerTask;

public abstract class RunScene implements Scene {
  
  private final int _minTime = 10;
  private final int _maxTime = 30;
  private final int _maxRuns = 3;
  
  private boolean renderSquare = false;
  private Timer timer;
  private Button nextButton; 
  
  private long[] clickTimes = new long[_maxRuns];
  private long[] renderTimes = new long[_maxRuns];
  private int runCounter = 0;
  
  public RunScene() {
    timer = new Timer();
    scheduleNextSquare();
  }
  
  
  public void draw(){
    if (renderSquare){
      nextButton.draw();
    }
  }
  
  private int random(int min, int range) {
    return  min + (int)(Math.random() * range) ;
  }
  
  private void scheduleNextSquare() {
    renderSquare = false;
    if (runCounter >= _maxRuns) {
      this.endScene();
      return;
    }
    nextButton = new Button(100,100,100,100){
      void onClick () {
        recordClickTime();
        clickManager.detachListener(this);
        runCounter++;
        scheduleNextSquare();
      };
    };
    
    timer.schedule(new TimerTask(){ 
      void run(){
        clickManager.attachListener(nextButton);
        renderSquare = true;
        recordRenderTime();
      } 
    }, random(_minTime, _maxTime - _minTime));
  }
  
  private void recordClickTime(){
    clickTimes[runCounter] = System.currentTimeMillis();
  }
  private void recordRenderTime(){
    renderTimes[runCounter] = System.currentTimeMillis();
  }
  
  
  abstract void endScene();
  
}
