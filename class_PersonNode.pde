
public class PersonNode {
  //Attributter:
  String name;
  String role;
  ArrayList<PersonNode> connectedPersons;
  float x;
  float y;

  //Constructor:
  PersonNode(String name, String role, float x, float y) {
    this.name = name;
    this.role = role;
    this.x = x;
    this.y = y;
    this.connectedPersons = new ArrayList<>();
  }

  // Metoder:
  String getName() {
    return name;
  }
  String getRole() {
    return role;
  }
  ArrayList<PersonNode> getConnectedPersons() {
    return connectedPersons;
  }
  void addConnectedPerson(PersonNode person) {
    connectedPersons.add(person);
  }
  void removeConnectedPerson(PersonNode person) {
    connectedPersons.remove(person);
  }
  void printConnectedPersons() {
    System.out.println("Connected persons of vehicle with plate number " + name + ":");
    for (PersonNode person : connectedPersons) {
      System.out.println("- " + person.getName());
    }
  }

  // Metoder til at få og sætte x- og y-koordinaterne
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  void setX(float x) {
    this.x = x;
  }
  void setY(float y) {
    this.y = y;
  }
}
