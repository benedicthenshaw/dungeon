// Input.pde : user input management

// player actions
enum actions {
    MOVE_UP,
    MOVE_DOWN,
    MOVE_LEFT,
    MOVE_RIGHT,
    INTERACT,
    SKIP
}

void keyPressed() {
    if (key == Settings.upKey || keyCode == Settings.upKey) {
        game.level.performTurn(actions.MOVE_UP);
    }
    if (key == Settings.downKey || keyCode == Settings.downKey) {
        game.level.performTurn(actions.MOVE_DOWN);
    }
    if (key == Settings.leftKey || keyCode == Settings.leftKey) {
        game.level.performTurn(actions.MOVE_LEFT);
    }
    if (key == Settings.rightKey || keyCode == Settings.rightKey) {
        game.level.performTurn(actions.MOVE_RIGHT);
    }
    if (key == Settings.interactKey || keyCode == Settings.interactKey) {
        game.level.performTurn(actions.INTERACT);
    }
}
