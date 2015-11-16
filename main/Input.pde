// Input.pde : user input management

// player actions
int MOVE_UP    = 0;
int MOVE_DOWN  = 1;
int MOVE_LEFT  = 2;
int MOVE_RIGHT = 3;
int INTERACT   = 4;

void takeKeyboardInput(Level level) {
    if (keyPressed) {
        if (!upPressed && key == Settings.upKey || keyCode == Settings.upKey) {
            level.performTurn(MOVE_UP);
            upPressed = true;
        }

        if (!downPressed && key == Settings.downKey || keyCode == Settings.downKey) {
            level.performTurn(MOVE_DOWN);
            downPressed = true;
        }

        if (!leftPressed && key == Settings.leftKey || keyCode == Settings.leftKey) {
            level.performTurn(MOVE_LEFT);
            leftPressed = true;
        }

        if (!rightPressed && key == Settings.rightKey || keyCode == Settings.rightKey) {
            level.performTurn(MOVE_RIGHT);
            rightPressed = true;
        }

        if (!interactPressed && key == Settings.interactKey || keyCode == Settings.interactKey) {
            level.performTurn(INTERACT);
            interactPressed = true;
        }
    }
}

// avoid key repeats by tracking key release
boolean upPressed       = false;
boolean downPressed     = false;
boolean leftPressed     = false;
boolean rightPressed    = false;
boolean interactPressed = false;

void keyReleased() {
    if (key == Settings.upKey || keyCode == Settings.upKey) {
            upPressed = false;
        }

        if (key == Settings.downKey || keyCode == Settings.downKey) {
            downPressed = false;
        }

        if (key == Settings.leftKey || keyCode == Settings.leftKey) {
            leftPressed = false;
        }

        if (key == Settings.rightKey || keyCode == Settings.rightKey) {
            rightPressed = false;
        }

        if (key == Settings.interactKey || keyCode == Settings.interactKey) {
            interactPressed = false;
        }
}
