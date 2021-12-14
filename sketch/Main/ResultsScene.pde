import java.util.List;

public abstract class ResultsScene implements Scene {

  private Button tryAgainButton;
  private ArrayList<Integer> results;
  private double resultsAvg;
  private float top;
  private float bottom;

  public ResultsScene(ArrayList<Integer> results) {
    this.top =  height * 0.1;
    this.bottom =  height * 0.9;
    this.results = results;
    this.resultsAvg = calculateAverage(results);
    tryAgainButton = new Button(width/2, bottom, "Try Again") {
      void onClickAppendage() {
        endScene();
        clickManager.detachListener(this);
      }
    };
    clickManager.attachListener(tryAgainButton);
  }

  public void draw() {
    textAlign(CENTER);
    fill(0);
    text("Results", width/2, top);
    results.forEach(r -> drawResult(r));
    drawRow(resultsAvg, results.size() + 1, "avg");
    tryAgainButton.draw();
  }

  void drawResult(int r) {
    int index = results.indexOf(r) + 1;
    drawRow(r, index, "test " + index);
  }

  void drawRow(double val, int index, String prefix) {
    String rowText = prefix + ": " + val + "ms";
    int offset = index * height/20;
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
