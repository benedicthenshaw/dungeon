// Item.pde : superclass; all game items

// superclass for items
class Item {
    Tile tile;
    // called when item is used inside inventory
    void onUse(Dynamic d) {}

    void draw(int x, int y, int size) {}
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

class Consumable extends Item {}

class HealthPotion extends Item {
    int heal;

    HealthPotion(int heal) {
        this.heal = heal;
    }

    void onUse(Dynamic d) {
        if (d.health <= d.maxHealth - heal) {
            d.health += this.heal;
        } else {
            d.health = d.maxHealth;
        }
        tile.item = null;
        createParticles(prt1, game.level.player.x * game.level.grid.tileSize,
                        game.level.player.y * game.level.grid.tileSize);
    }

    void draw(int x, int y, int size) {
        //fill(102, 153, 204);
        //ellipse(x + size/4, y + size/4, size/2, size/2);
        imgRender(imgPotion, x, y);
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
        imgRender(imgSword, x, y);
    }
}

class Axe extends Weapon {
    Axe(int damage) {
        super(damage);
    }

    void draw(int x, int y, int size) {
        imgRender(imgAxe, x, y);
    }
}

class Hammer extends Weapon {
    Hammer(int damage) {
        super(damage);
    }

    void draw(int x, int y, int size) {
        imgRender(imgHammer, x, y);
    }
}

class Pickaxe extends Weapon {
    Pickaxe(int damage) {
        super(damage);
    }

    void draw(int x, int y, int size) {
        imgRender(imgPickaxe, x, y);
    }
}
