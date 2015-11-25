// Tile.pde : superclass; all game tiles

// Tile --- superclass of all tiles
class Tile {
    // item sitting on this tile
    Item item;
    // enemy, player, etc. on this tile
    Dynamic dyn;

    // TODO: fog of war style visibility?
    // boolean seen;
    boolean visible;

    Tile() {
        this.item = null;
        this.dyn = null;
        this.visible = true;
    }

    Tile(Item item, Dynamic dyn) {
        this.item = item;
        this.dyn = dyn;
        this.visible = true;
    }

    // copy contents to new tile
    Tile(Tile t) {
        this.item = t.item;
        this.dyn = t.dyn;
        this.visible = true;
    }

    // called when entity attempts to walk onto tile (overloaded in subclass)
    // return false when nothing occured
    boolean onEnter(Dynamic d) {
        return false;
    }

    boolean onExit(Dynamic d) {
        this.dyn = null;
        return true;
    }

    // called when entity presses interact on a tile (overloaded in subclass)
    // return false when nothing occured
    boolean onInteract(Dynamic d) {
        return false;
    }

    void draw(int x, int y, int size) {
        if (this.visible) {
            this.drawTile(x, y, size);
        }
    }

    // tile specific drawing(overloaded in subclass)
    void drawTile(int x, int y, int size) {}

    // draws entities on this tile
    void drawContents(int x, int y, int size) {
        // NOTE: contents need to be a pixel smaller to fit
        if (this.item != null) {
            this.item.draw(x+1, y+1, size-2);
        }
        if (this.dyn != null) {
            this.dyn.draw(x+1, y+1, size-2);
        }
    }
}

///// FLOORS /////

class Floor extends Tile {
    // move to tile if empty
    boolean onEnter(Dynamic d) {
        if (this.dyn == null){
            this.dyn = d;
            return true;
        } else {
            // TODO: proper fighting!
            this.dyn.health -= d.damage;
            return false;
        }
    }
}

class StoneFloor extends Floor {
    void drawTile(int x, int y, int size) {
        fill(81, 81, 81);
        rect(x, y, size, size);
        this.drawContents(x, y, size);
    }
}

///// WALLS /////

class Wall extends Tile {}

class StoneWall extends Wall {
    void drawTile(int x, int y, int size) {
        fill(211, 208, 200);
        rect(x, y, size, size);
        this.drawContents(x, y, size);
    }
}

///// SCENERY /////

class Scenery extends Tile {}
