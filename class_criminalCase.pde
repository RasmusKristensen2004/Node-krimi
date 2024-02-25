public class CriminalCase {
    private List<PersonNode> persons;
    private List<VehicleNode> vehicles;
    private List<WeaponNode> weapons;
    private List<LocationNode> locations;

    public CriminalCase() {
        this.persons = new ArrayList<>();
        this.vehicles = new ArrayList<>();
        this.weapons = new ArrayList<>();
        this.locations = new ArrayList<>();
    }

    public void addPerson(PersonNode person) {
        persons.add(person);
    }

    public void removePerson(PersonNode person) {
        persons.remove(person);
    }

    public void addVehicle(VehicleNode vehicle) {
        vehicles.add(vehicle);
    }

    public void removeVehicle(VehicleNode vehicle) {
        vehicles.remove(vehicle);
    }

    public void addWeapon(WeaponNode weapon) {
        weapons.add(weapon);
    }

    public void removeWeapon(WeaponNode weapon) {
        weapons.remove(weapon);
    }

    public void addLocation(LocationNode location) {
        locations.add(location);
    }

    public void removeLocation(LocationNode location) {
        locations.remove(location);
    }

    public List<PersonNode> getPersons() {
        return persons;
    }

    public List<VehicleNode> getVehicles() {
        return vehicles;
    }

    public List<WeaponNode> getWeapons() {
        return weapons;
    }

    public List<LocationNode> getLocations() {
        return locations;
    }
}
