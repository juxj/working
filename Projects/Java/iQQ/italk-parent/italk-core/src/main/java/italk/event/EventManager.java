package italk.event;

public interface EventManager {
  
  public void addAppListener(AppListener l);

  public void removeAppListener(AppListener l);
  
  public void addBuddyListener(BuddyListener l);

  public void removeBuddyListener(BuddyListener l);

  public void addLoginListener(LoginListener l);

  public void removeLoginListener(LoginListener l);

}
