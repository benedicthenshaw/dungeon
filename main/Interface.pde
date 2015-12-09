// Interface.pde

// manages and draws collections of interface elements
class Interface {
    ArrayList<Element> elements;

    void draw() {}
}

// generic user interface element
class Element {
    Clickable clickable;

    void update(int mouseX, int mouseY) {}

    void draw() {}
}

// tracks clickable areas
class Clickable {
    // clickable area
    int x;
    int y;
    int width;
    int height;

    Clickable(int x, int y, int width, int height) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }

    // called on click when mouse is in clickable area
    void onClick(Element parent) {}

    // called when mouse is in clickable area
    void onHover(Element parent) {}
}