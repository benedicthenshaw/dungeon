// Item.pde : superclass; all game items

// superclass for items
class Item {
    void onConsume(Player p) {}

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

class HealthPotion extends Item {
    void onConsume(Player p) {
        p.health += 1;
    }

    void draw(int x, int y, int size) {
        fill(102, 153, 204);
        ellipse(x + size/4, y + size/4, size/2, size/2);
    }
}
