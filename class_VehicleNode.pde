public class VehicleNode {
    private String plateNumber;
    private String owner;
    private List<PersonNode> connectedPersons;
    float x;
    float y;

    public VehicleNode(String plateNumber, String owner, float x, float y) {
        this.plateNumber = plateNumber;
        this.owner = owner;
        this.x = x;
        this.y = y;
        this.connectedPersons = new ArrayList<>();
    }

    public String getPlateNumber() {
        return plateNumber;
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
        System.out.println("Connected persons of vehicle with plate number " + plateNumber + ":");
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
