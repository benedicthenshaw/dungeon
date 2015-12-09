// Tile.pde : superclass; all game tiles

// Tile --- superclass of all tiles
class Tile {
  // item sitting on this tile
  Item item;
  // enemy, player, etc. on this tile
  Dynamic dyn;

  //visible checks if a tile is in sight range, unknown checks if a tile has been seen before and feelable checks if a tile is in hearing range
  boolean visible;
  boolean unknown;
  boolean feelable;
  //maxFeels determines for how long a blip will stay in place.
  float feels;
  float maxFeels=3;

  Tile() {
    this.item = null;
    this.dyn = null;
    this.visible = false;
    this.feels = 0;
    this.feelable = false;
    this.unknown = true;
  }

  Tile(Item item, Dynamic dyn) {
    this.item = item;
    this.dyn = dyn;
    this.visible = false;
    this.feels = 0;
    this.feelable = false;
    this.unknown = true;
  }

  // copy contents to new tile
  Tile(Tile t) {
    this.item = t.item;
    this.dyn = t.dyn;
    this.visible = false;
    this.feels = 0;
    this.feelable = false;
    this.unknown = true;
  }

  // called when entity attempts to walk onto tile
  // return false when nothing occured
  boolean onEnter(Dynamic d) {
    return false;
  }

  boolean onExit(Dynamic d) {
    this.dyn = null;
    //creates a sound blip on movement
    if (this.feelable){
    this.feels=this.maxFeels;
    }
    return true;
  }

  // called when entity presses interact on a tile
  // return false when nothing occured
  boolean onInteract(Dynamic d) {
    if (this.item != null) {
      if (!(this.item instanceof HealthPotion))
      {
        this.item = d.equip((Weapon) this.item);
      } else
      {
        this.item.onUse(dyn);
      }
      return true;
    } else {
      return false;
    }
  }

  void draw(int x, int y, int size) {
    if (this.visible) {
      this.drawTile(x, y, size);
    } else
    {
      if (!this.unknown) {
        //draws a faded tile if it is known but not visible
        tint(255, 122);
        this.drawTile(x, y, size);
        tint(255, 255);
      }
      if (this.feels>0) {
        //draws a sound blip where needed in a non-visible tile
        tint(255, 255*(this.feels/this.maxFeels));
        imgRender(imgBlip, x, y);
        tint(255, 255);
      }
    }
  }

  // tile specific drawing
  void drawTile(int x, int y, int size) {
  }

  // draws entities on this tile
  void drawContents(int x, int y, int size) {
    // NOTE: contents need to be a pixel smaller to fit
    if (this.item != null) {
      this.item.draw(x+1, y+1, size-2);
    }
    if (this.dyn != null&&this.visible) {
      this.dyn.draw(x+1, y+1, size-2);
    }
  }
}

///// FLOORS /////

class Floor extends Tile {
  // move to tile if empty
  boolean onEnter(Dynamic d) {
    if (this.dyn == null) {
      this.dyn = d;
      return true;
    } else {
      // TODO: proper fighting!
      this.dyn.health -= d.attack();
      return false;
    }
  }
}

class StoneFloor extends Floor {
  void drawTile(int x, int y, int size) {
    //fill(255, 81, 81);
    //rect(x, y, size, size);
    imgRender(tileWood, x, y);
    this.drawContents(x, y, size);
  }
}

class TrapDoor extends Floor {
  boolean onEnter(Dynamic d) {
    if (d instanceof Player) {
      game.level.generateLevel();
    }
    return false;
  }

  void drawTile(int x, int y, int size) {
    fill(45, 45, 45);
    rect(x, y, size, size/3);
    fill(57, 57, 57);
    rect(x, y + size/3, size, size/3);
    fill(81, 81, 81);
    rect(x, y + 2*size/3, size, size/3);

    noFill();
    stroke(242, 240, 236);
    rect(x, y, size-1, size-1);
    noStroke();
    this.drawContents(x, y, size);
  }
}


///// WALLS /////

class Wall extends Tile {
}

class StoneWall extends Wall {
  void drawTile(int x, int y, int size) {
    fill(211, 208, 200);
    rect(x, y, size, size);
    this.drawContents(x, y, size);
  }
}