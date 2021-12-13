interface Clickable {
  public boolean getIsEnabled();
  public void disable();
  public void activate();
  public boolean withinBounds(float x, float y);
  public void onClick();
  public void react();
  public void stopReact();
}
