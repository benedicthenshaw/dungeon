// Peaceful dummies which at the moment serve no purpose but wander around aimlessly and create feel blips.

class Peaceful extends Dynamic {

  Peaceful(int x, int y, int health, int damage) {
    super(x, y, health, damage);
  }

  Peaceful(int health, int damage) {
    super(health, damage);
  }

  void takeTurn(Level l) {
    if (this.health>0) {

      switch(floor(random(0, 4))) {
      case 0: 
        {
          this.step(0, -1, l.grid);
        } 
        break;
      case 1: 
        {
          this.step(0, 1, l.grid);
        } 
        break;
      case 2: 
        {
          this.step(-1, 0, l.grid);
        } 
        break;
      case 3: 
        {
          this.step(1, 0, l.grid);
        } 
        break;
      }
    }
  }

  void draw(int x, int y, int size) {
    fill(119, 242, 122);
    arc(x, y, size, size, 0, TWO_PI * ((float)health/maxHealth), PIE);
    stroke(255);
    noFill();
    ellipse(x, y, size, size);
    noStroke();
  }
}