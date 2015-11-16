// Input.pde : user input management

static class Keys {
    static boolean up       = false;
    static boolean down     = false;
    static boolean left     = false;
    static boolean right    = false;
    static boolean interact = false;

    void reset() {
        this.up       = false;
        this.down     = false;
        this.left     = false;
        this.right    = false;
        this.interact = false;
    }
}

void keyPressed() {
    if (key == Settings.upKey || keyCode == Settings.upKey) {
        Keys.up = true;
    }

    if (key == Settings.downKey || keyCode == Settings.downKey) {
        Keys.down = true;
    }

    if (key == Settings.leftKey || keyCode == Settings.leftKey) {
        Keys.left = true;
    }

    if (key == Settings.rightKey || keyCode == Settings.rightKey) {
        Keys.right = true;
    }

    if (key == Settings.interactKey || keyCode == Settings.interactKey) {
        Keys.interact = true;
    }
}
