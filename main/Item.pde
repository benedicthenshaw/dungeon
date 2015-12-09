// Item.pde : superclass; all game items

// superclass for items
class Item {
  Tile tile;
  // called when item is used inside inventory
  void onUse(Dynamic d) {
  }

  void draw(int x, int y, int size) {
  }
}

class LootBag extends Item {
  ArrayList<Item> items;

  LootBag(Item... i) {
    this.items = new ArrayList<Item>();
    for (Item item : i) {
      this.items.add(item);
    }
  }
}

///// CONSUMABLES /////

class Consumable extends Item {
}

class HealthPotion extends Item {
  int heal;  
  HealthPotion(int heal) {
    this.heal = heal;
  }
  void onUse(Dynamic d) {
    if (d.health<=d.maxHealth-heal)
    {
      d.health += this.heal;
    } else
    {
      d.health=d.maxHealth;
    }
    tile.item=null;
    createParticles(prt1, game.level.player.x*game.level.grid.tileSize, game.level.player.y*game.level.grid.tileSize);
  }

  void draw(int x, int y, int size) {
    //fill(102, 153, 204);
    imgRender(imgPotion, x, y);
    //ellipse(x + size/4, y + size/4, size/2, size/2);
  }
}

///// WEAPONS /////

class Weapon extends Item {
  int damage;

  Weapon(int damage) {
    this.damage = damage;
  }

  void onUse(Player p) {
    p.weapon = this;
  }

  int attack() {
    // TODO: miss chance?
    return this.damage;
  }
}

class Sword extends Weapon {
  Sword(int damage) {
    super(damage);
  }

  void draw(int x, int y, int size) {
    //fill(204, 153, 204);
    imgRender(imgSword, x, y);
    //ellipse(x + size/4, y + size/4, 2*size/3, 2*size/3);
  }
}

class Axe extends Weapon {
  Axe(int damage) {
    super(damage);
  }

  void draw(int x, int y, int size) {
    imgRender(imgAxe, x, y);
    /*fill(204, 153, 204);
     quad(x + size/2, y,
     x + size, y + size/2,
     x + size/2, y + size,
     x, y + size/2);*/
  }
}