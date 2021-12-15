import java.util.List;

public abstract class ResultsScene implements Scene {

  private Button tryAgainButton;
  private Button quitButton;
  private ArrayList<Integer> results;
  private double resultsAvg;
  private float top;
  private float bottom;

  public ResultsScene(ArrayList<Integer> results) {
    this.top =  height * 0.1;
    this.bottom =  height * 0.9;
    this.results = results;
    this.resultsAvg = calculateAverage(results);
    
    tryAgainButton = new Button(width/3, bottom, "Try Again") {
      void onClickAppendage() {
        endScene();
        clickManager.detachListener(this);
      }
    };
    quitButton = new Button(2 * width/3, bottom, "Quit") {
      void onClickAppendage() {
        exit();
      }
    };
    
    clickManager.attachListener(tryAgainButton);
    clickManager.attachListener(quitButton);
  }

  public void draw() {
    textAlign(CENTER);
    fill(0);
    text("Results", width/2, top);
    drawResults();
    tryAgainButton.draw();
    quitButton.draw();
  }
  
  void drawResults(){
    for (int i = 0; i < results.size(); i++) {
      drawRow(results.get(i), i, "test " + (i + 1));
    }
    drawRow(resultsAvg, results.size(), "avg");
  }


  void drawRow(double val, int index, String prefix) {
    String rowText = prefix + ": " + val + "ms";
    int offset = (index + 1) * height/20;
    text(rowText, width/2, top + offset);
  }

  private double calculateAverage(List <Integer> marks) {
    return marks.stream()
      .mapToDouble(d -> d)
      .average()
      .orElse(0.0);
  }



  abstract void endScene();
}
