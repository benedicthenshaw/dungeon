// Tile.pde : superclass; all game tiles

// Tile --- superclass of all tiles
class Tile extends Entity {
    // item sitting on this tile
    Item item;
    // enemy, player, etc. on this tile
    Dynamic dyn;

    Tile() {
        this.item = null;
        this.dyn = null;
    }

    Tile(Item item, Dynamic dyn) {
        this.item = item;
        this.dyn = dyn;
    }

    // copy contents to new tile
    Tile(Tile t) {
        this.item = t.item;
        this.dyn = t.dyn;
    }
    
    // called when player attempts to walk onto tile (overloaded in subclass)
    void onEnter(Dynamic p) {}
    
    // called when player presses interact next to tile (overloaded in subclass)
    void onInteract(Dynamic p) {}
    
    // display tile (overloaded in subclass)
    void draw(int x, int y, int size) {}

    // draws entities on this tile
    void drawContents(int x, int y, int size) {
        if (this.item != null) {
            // this.item.draw(x, y, size);
        }
        if (this.dyn != null) {
            // this.dyn.draw(x, y, size);
        }
    }
}

///// FLOORS /////

class Floor extends Tile {
    // move to tile if empty
    void onEnter(Dynamic p) {
        if (this.dyn == null){
            this.dyn = p;
        }
    }
}

class StoneFloor extends Floor {
    void draw(int x, int y, int size) {
        fill(80,80,80);
        rect(x, y, size, size, 5);
        this.drawContents(x, y, size);
    }
}

///// WALLS /////

class Wall extends Tile {}

class StoneWall extends Tile {
    void draw(int x, int y, int size) {
        fill(180, 180, 180);
        rect(x, y, size, size, 5);
        this.drawContents(x, y, size);
    }
}

///// SCENERY /////

class Scenery extends Tile {}
