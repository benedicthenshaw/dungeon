// Input.pde : user input management

// player actions
enum actions {
    MOVE_UP,
    MOVE_DOWN,
    MOVE_LEFT,
    MOVE_RIGHT,
    INTERACT
}

// TODO: input on key press not release
// void takeKeyboardInput(Level level) {
//     if (keyPressed) {
//         if (!upPressed && key == Settings.upKey || keyCode == Settings.upKey) {
//             level.performTurn(MOVE_UP);
//             upPressed = true;
//         }

//         if (!downPressed && key == Settings.downKey || keyCode == Settings.downKey) {
//             level.performTurn(MOVE_DOWN);
//             downPressed = true;
//         }

//         if (!leftPressed && key == Settings.leftKey || keyCode == Settings.leftKey) {
//             level.performTurn(MOVE_LEFT);
//             leftPressed = true;
//         }

//         if (!rightPressed && key == Settings.rightKey || keyCode == Settings.rightKey) {
//             level.performTurn(MOVE_RIGHT);
//             rightPressed = true;
//         }

//         if (!interactPressed && key == Settings.interactKey || keyCode == Settings.interactKey) {
//             level.performTurn(INTERACT);
//             interactPressed = true;
//         }
//     }
// }

// avoid key repeats by tracking key release
// boolean upPressed       = false;
// boolean downPressed     = false;
// boolean leftPressed     = false;
// boolean rightPressed    = false;
// boolean interactPressed = false;

void keyReleased() {
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
