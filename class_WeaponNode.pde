
public class WeaponNode {
    private String type;
    private String owner;
    float x=random(50,400);
    float y=random(50,100);
    private List<PersonNode> connectedPersons;

    public WeaponNode(String type, String owner) {
        this.type = type;
        this.owner = owner;
        
        this.connectedPersons = new ArrayList<>();
    }

    public String getType() {
        return type;
    }

    public String getOwner() {
        return owner;
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

    public void printConnectedPersons() {
        System.out.println("Connected persons of weapon type " + type + ":");
        for (PersonNode person : connectedPersons) {
            System.out.println("- " + person.getName());
        }
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
}
