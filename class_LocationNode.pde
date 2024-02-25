

public class LocationNode {
  private String address;
  private String timestamp;
  private String type;
  private float x;
  private float y;
  private List<PersonNode> connectedPersons;

  public LocationNode(String address, String timestamp, String type, float x, float y) {
    this.address = address;
    this.timestamp = timestamp;
    this.type = type;
    this.x = x;
    this.y = y;
    this.connectedPersons = new ArrayList<>();
  }

  public String getAddress() {
    return address;
  }

  public String getTimestamp() {
    return timestamp;
  }

  public String getType() {
    return type;
  }

  // Metoder til at få og sætte x- og y-koordinaterne
  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

 public void setX(float x) {
   this.x = x;
  }

  public void setY(float y) {
    this.y = y;
  }





  public List<PersonNode> getConnectedPersons() {
    return connectedPersons;
  }

  public void addConnectedPerson(PersonNode person) {
    connectedPersons.add(person);
  }

  public void removeConnectedPerson(PersonNode person) {
    connectedPersons.remove(person);
  }
}
