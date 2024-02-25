import java.util.ArrayList;
import java.util.List;

CriminalCase criminalCase;

public void setup() {
  // Initialiser Processing vinduet
  size(800, 800);

  // Opret en ny instans af CriminalCase
  criminalCase = new CriminalCase();

  // Opret noder og tilføj dem til sagen
  createNodes();
  adjustNodePositions();
}

public void draw() {
  // Tegn din visualisering her
  background(255);
  // Eksempel på at tegne noderne
  drawNodes();
  drawConnections();
}

// Metode til at oprette noder og tilføje dem til sagen
private void createNodes() {
  // Opret personer
  PersonNode victim1 = new PersonNode("Charles Anderson/John Doe", "Offer", random(350, 450), random(350, 450));

  PersonNode suspect1 = new PersonNode("Alice Smith", "Mistænkt", random(100, 100), random(50, 750));
  
  //Opret vidner
  PersonNode witness1 = new PersonNode("Emily Brown", "Vidne", random(700, 750), random(50, 750));
  

  // Tilføj personer til sagen
  criminalCase.addPerson(victim1);
  
  criminalCase.addPerson(suspect1);
  
  criminalCase.addPerson(witness1);
  

  // Opret køretøjer
  VehicleNode vehicle1 = new VehicleNode("ABC123", "Alice Smith", random(500,height-100), random(300, 500));
  

  // Tilføj køretøjer til sagen
  criminalCase.addVehicle(vehicle1);
  

  // Opret våben
  WeaponNode weapon1 = new WeaponNode("Knife", "Alice Smith");
  
    

  // Tilføj våben til sagen
  criminalCase.addWeapon(weapon1);
  
  // Opret gerningssteder
  LocationNode crimeScene1 = new LocationNode("123 Main St", "2024-02-19 10:00", "Homicide", width/2+100, 500);
  
  // Tilføj gerningssteder til sagen
  criminalCase.addLocation(crimeScene1);
  
  // Opret relationer mellem personer, køretøjer, våben og gerningssteder
  victim1.addConnectedPerson(suspect1);
   
  victim1.addConnectedPerson(witness1);
  
  
  
  witness1.addConnectedPerson(suspect1);
  
  

  vehicle1.addConnectedPerson(suspect1);
  

  weapon1.addConnectedPerson(suspect1);
  
  crimeScene1.addConnectedPerson(victim1);
  
}

// Metode til at tegne noderne
private void drawNodes() {
  textSize(18);

  for (PersonNode person : criminalCase.getPersons()) {


    // Eksempel på at tegne personer
    if (person.role.equals("Offer")) {

      // Tegn personen som en cirkel
      float nodeSize = 30; // Størrelsen af noden (cirklen)
      float nodeX = person.getX();
      float nodeY = person.getY();

      fill(255, 0, 0); // Rød farve for ofre
      ellipse(nodeX, nodeY, nodeSize, nodeSize); // Eksempel på en person-node
      //fill(0);
      //text("Offer", 85, 110);
      // Skriv personens navn ved siden af noden
      textAlign(CENTER, CENTER);
      fill(0); // Sort farve
      text(person.getName(), nodeX, nodeY - nodeSize / 2 - 5); // Placer teksten over noden
    }

    if (person.role.equals("Mistænkt")) {
      float nodeSize = 30; // Størrelsen af noden (cirklen)
      float nodeX = person.getX();
      float nodeY = person.getY();
      fill(0, 0, 255); // Blå farve for mistænkte
      ellipse(nodeX, nodeY, nodeSize, nodeSize); // Eksempel på en person-node
      // Skriv personens navn ved siden af noden
      textAlign(CENTER, CENTER);
      fill(0); // Sort farve
      text(person.getName(), nodeX, nodeY - nodeSize / 2 - 5); // Placer teksten over noden
    }
    if (person.role.equals("Vidne")) {
      float nodeSize = 10; // Størrelsen af noden (cirklen)
      float nodeX = person.getX();
      float nodeY = person.getY();
      fill(0, 255, 255); // farve for vidne
      ellipse(nodeX, nodeY, nodeSize, nodeSize); // Eksempel på en person-node
      // Skriv personens navn ved siden af noden
      textAlign(CENTER, CENTER);
      fill(0); // Sort farve
      text(person.getName(), nodeX, nodeY - nodeSize / 2 - 5); // Placer teksten over noden
    }
  }

  for (VehicleNode vehicle : criminalCase.getVehicles()) {

    float nodeSize = 30; // Størrelsen af noden (cirklen)
    float nodeX = vehicle.getX();
    float nodeY = vehicle.getY();

    fill(255, 255, 0); // Gul farve for køretøjer
    rect(nodeX, nodeY, 50, nodeSize); // Eksempel på en køretøjs-node
    fill(0);
    text(vehicle.getPlateNumber(), nodeX, nodeY - nodeSize / 2 - 5); // Placer teksten over noden
  }

  for (LocationNode location : criminalCase.getLocations()) {
    float nodeSize = 10; // Størrelsen af noden (cirklen)
    float nodeX = location.getX();
    float nodeY = location.getY();
    fill(0, 0, 255); // Blå farve
    ellipse(nodeX, nodeY, nodeSize, nodeSize);

    // Skriv gerningsstedets adresse under noden
    textAlign(CENTER, CENTER);
    fill(0); // Sort farve
    text(location.getAddress(), nodeX, nodeY + nodeSize / 2 + 10); // Placer teksten under noden
  }
  
  for (WeaponNode weapon : criminalCase.getWeapons()) {
    float nodeSize = 10; // Størrelsen af noden (cirklen)
    float nodeX = weapon.getX();
    float nodeY = weapon.getY();
    fill(0 ); // farve
    rect(nodeX, nodeY, nodeSize, nodeSize-20);

    // Skriv gerningsstedets adresse under noden
    textAlign(CENTER, CENTER);
    fill(0); // Sort farve
    text(weapon.getType(), nodeX, nodeY + nodeSize / 2 + 10); // Placer teksten under noden
  }
  
}



// Metode til at tegne forbindelserne mellem noderne
private void drawConnections() {
  // Gennemgå alle personer
  for (PersonNode person : criminalCase.getPersons()) {
    // Gennemgå alle forbundne personer til den aktuelle person
    for (PersonNode connectedPerson : person.getConnectedPersons()) {
      // Tegn en linje mellem de to personer
      stroke(0); // Sort farve
      line(person.getX(), person.getY(), connectedPerson.getX(), connectedPerson.getY());
    }
  }

  // Gennemgå alle køretøjer
  for (VehicleNode vehicle : criminalCase.getVehicles()) {
    // Gennemgå alle forbundne personer til det aktuelle køretøj
    for (PersonNode connectedPerson : vehicle.getConnectedPersons()) {
      // Tegn en linje mellem køretøjet og den forbundne person
      stroke(0); // Sort farve
      line(vehicle.getX(), vehicle.getY(), connectedPerson.getX(), connectedPerson.getY());
    }
  }
  // Gennemgå alle Locationer
  for (LocationNode location : criminalCase.getLocations()) {
    // Gennemgå alle forbundne personer til det aktuelle køretøj
    for (PersonNode connectedPerson : location.getConnectedPersons()) {
      // Tegn en linje mellem køretøjet og den forbundne person
      stroke(0); // Sort farve
      line(location.getX(), location.getY(), connectedPerson.getX(), connectedPerson.getY());
    }
  }
// Gennemgå alle Våben
  for (WeaponNode weapon : criminalCase.getWeapons()) {
    // Gennemgå alle forbundne personer til det aktuelle køretøj
    for (PersonNode connectedPerson : weapon.getConnectedPersons()) {
      // Tegn en linje mellem køretøjet og den forbundne person
      stroke(0); // Sort farve
      line(weapon.getX(), weapon.getY(), connectedPerson.getX(), connectedPerson.getY());
    }
  }


  // Tegn flere typer forbindelser efter behov (f.eks. våben, gerningssteder osv.)
}

public void adjustNodePositions() {
  int distanceBetween = 150;

  // Juster x- og y-positioner for personer
  for (int i = 0; i < criminalCase.getPersons().size(); i++) {
    for (int j = i + 1; j < criminalCase.getPersons().size(); j++) {
      PersonNode node1 = criminalCase.getPersons().get(i);
      PersonNode node2 = criminalCase.getPersons().get(j);
      float dx = node2.getX() - node1.getX();
      float dy = node2.getY() - node1.getY();
      float distance = dist(node1.getX(), node1.getY(), node2.getX(), node2.getY());
      if (distance < distanceBetween) {
        float offsetX = (distanceBetween - distance) / 2 * dx / distance;
        float offsetY = (distanceBetween - distance) / 2 * dy / distance;
        node1.setX(node1.getX() - offsetX);
        node1.setY(node1.getY() - offsetY);
        node2.setX(node2.getX() + offsetX);
        node2.setY(node2.getY() + offsetY);
      }
    }
  }

  // Juster x- og y-positioner for køretøjer
  for (int i = 0; i < criminalCase.getVehicles().size(); i++) {
    for (int j = 0; j < criminalCase.getPersons().size(); j++) {
      VehicleNode vehicle = criminalCase.getVehicles().get(i);
      PersonNode person = criminalCase.getPersons().get(j);
      float dx = person.getX() - vehicle.getX();
      float dy = person.getY() - vehicle.getY();
      float distance = dist(vehicle.getX(), vehicle.getY(), person.getX(), person.getY());
      if (distance < distanceBetween) {
        float offsetX = (distanceBetween - distance) / 2 * dx / distance;
        float offsetY = (distanceBetween - distance) / 2 * dy / distance;
        vehicle.setX(vehicle.getX() - offsetX);
        vehicle.setY(vehicle.getY() - offsetY);
        person.setX(person.getX() + offsetX);
        person.setY(person.getY() + offsetY);
      }
    }
  }

  // Juster x- og y-positioner for våben
  for (int i = 0; i < criminalCase.getWeapons().size(); i++) {
    for (int j = 0; j < criminalCase.getPersons().size(); j++) {
      WeaponNode weapon = criminalCase.getWeapons().get(i);
      PersonNode person = criminalCase.getPersons().get(j);
      float dx = person.getX() - weapon.getX();
      float dy = person.getY() - weapon.getY();
      float distance = dist(weapon.getX(), weapon.getY(), person.getX(), person.getY());
      if (distance < distanceBetween) {
        float offsetX = (distanceBetween - distance) / 2 * dx / distance;
        float offsetY = (distanceBetween - distance) / 2 * dy / distance;
        weapon.setX(weapon.getX() - offsetX);
        weapon.setY(weapon.getY() - offsetY);
        person.setX(person.getX() + offsetX);
        person.setY(person.getY() + offsetY);
      }
    }
  }

  // Juster x- og y-positioner for gerningssteder
  for (int i = 0; i < criminalCase.getLocations().size(); i++) {
    for (int j = 0; j < criminalCase.getPersons().size(); j++) {
      LocationNode location = criminalCase.getLocations().get(i);
      PersonNode person = criminalCase.getPersons().get(j);
      float dx = person.getX() - location.getX();
      float dy = person.getY() - location.getY();
      float distance = dist(location.getX(), location.getY(), person.getX(), person.getY());
      if (distance < distanceBetween) {
        float offsetX = (distanceBetween - distance) / 2 * dx / distance;
        float offsetY = (distanceBetween - distance) / 2 * dy / distance;
        location.setX(location.getX() - offsetX);
        location.setY(location.getY() - offsetY);
        person.setX(person.getX() + offsetX);
        person.setY(person.getY() + offsetY);
      }
    }
  }
}
