interface Clickable extends Comparable<Clickable> {
  public boolean isEnabled();
  public void disable();
  public void activate();
  public boolean withinBounds(float x, float y);
  public void onClick();
  public void react();
  public void stopReact();
  public int getHash();
}
