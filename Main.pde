VirtualPet myPet;

Button feedButton;
Button playButton;

// How many milliseconds between each status update
// (increase to slow down, decrease to speed up)
final int UPDATE_INTERVAL = 10000;
int lastUpdateTime = 0;

// ---- Action message ----
String actionMessage = "";
int messageTime = 0;
final int MESSAGE_DURATION = 2000; // milliseconds to show the message

void setup() {
  size(600, 500);
  textFont(createFont("Arial", 16, true));

  myPet = new VirtualPet("Pingle");

  // Buttons sit along the bottom of the screen
  // Button(label, x, y, width, height)
  feedButton = new Button("Feed", 150, 430, 120, 45);
  playButton = new Button("Play", 330, 430, 120, 45);
}

void draw() {
  background(245, 240, 255);

  // ---- Timed status update ----
  if (millis() - lastUpdateTime >= UPDATE_INTERVAL) {
    myPet.updateStatus();
    lastUpdateTime = millis();
  }

  // ---- Draw sections ----
  drawPetArea();
  drawStats(myPet);
  feedButton.display();
  playButton.display();
  drawMessage();
  
  if (myPet.getWeight() >= 50) {
    myPet.getFat();
    background(0);
    textSize(50);
    textAlign(CENTER);
    fill(150,0,0);
    text("KILLED", width/2+3, height/2+3);
    fill(255,0,0);
    text("KILLED", width/2, height/2);
  }
}

void mousePressed() {
  if (feedButton.isClicked(mouseX, mouseY)) {
    Food f = new Food("Watermelon", 3, 2, 2);
    if (myPet.getEnergy() < 10) {  
      myPet.feed(f);
      showMessage(f.getName() + " eaten!");
    } else {
      showMessage("Your pet is full!");
    }
    myPet.bound();
  }

  if (playButton.isClicked(mouseX, mouseY)) {
    Game g = new Game("Coin Toss", 2, 1, 1);
    if (myPet.getEnergy() > g.getEnergy()) {
      myPet.play(g);
      showMessage(g.getName() + " played!");
    } else {
      showMessage("Your pet is too tired!");
    }
  }
}

// Call this to set a new message
void showMessage(String msg) {
  actionMessage = msg;
  messageTime = millis();
}
