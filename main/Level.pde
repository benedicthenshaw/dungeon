// Level.pde : level generation and management

// layout/generation for levels
class Level {
    Grid grid;
    ArrayList<Enemy> enemies;
    ArrayList<Peaceful> peacefuls;
    Player player;

    Level(int gridWidth, int gridHeight, int screenWidth, int screenHeight) {
        this.grid = new Grid(gridWidth, gridHeight, screenWidth, screenHeight);
        this.enemies = new ArrayList<Enemy>();
        this.peacefuls = new ArrayList<Peaceful>();
        this.player = null;
    }

    // fill grid with random level
    void generateLevel() {
        this.destroy();
        switch (floor(random(0, 3))) {
            case 0: {
                this.generateOpenLevel();
            } break;

            case 1: {
                this.generateVerticalLevel();
            } break;

            case 2: {
                this.generateHorizontalLevel();
            } break;
        }
    }

    // fill grid with random level
    void generateLevel(Player p) {
        this.destroy();
        switch (floor(random(0, 3))) {
            case 0: {
                this.generateOpenLevel();
            } break;

            case 1: {
                this.generateVerticalLevel();
            } break;

            case 2: {
                this.generateHorizontalLevel();
            } break;
        }

        // remove randomly generated player, replace with given player
        this.grid.data[this.player.x][this.player.y].dyn = null;
        this.player = null;
        randomlyPlacePlayer(p);
    }


    void generateHorizontalLevel() {
        int rooms = round(random(3, 5));

        int roomSpacing = 3;
        int roomWidth = this.grid.width - 4;
        int roomHeight = this.grid.height / rooms - roomSpacing;

        int roomStartY = 1 + (this.grid.height - rooms *
            (roomHeight + roomSpacing)) / 2;
        int roomX = 2;
        int roomY = roomStartY;

        for (int i = 0; i < rooms; i++) {
            roomY = roomStartY + i * (roomHeight + roomSpacing);
            this.createRoom(roomX, roomY, roomWidth, roomHeight);

            if (i < rooms-1) {
                int pathX = round(random(roomX + 1, roomWidth - 1));
                int pathY = roomY + (roomHeight-1);
                int pathLength = roomSpacing + 1;
                this.placePathLine(pathX, pathY, pathX, pathY + pathLength);
                // 50% chance to place a second corridor
                if (floor(random(0, 2)) == 1) {
                    pathX = round(random(roomX + 1, roomWidth - 1));
                    pathY = roomY + (roomHeight-1);
                    pathLength = roomSpacing + 1;
                    this.placePathLine(pathX, pathY, pathX, pathY + pathLength);
                }
            }
        }

        this.randomlyPlaceEntities();
    }

    void generateVerticalLevel() {
        int rooms = round(random(3, 7));

        int roomSpacing = 3;
        int roomWidth = this.grid.width / rooms - roomSpacing;
        int roomHeight = this.grid.height - 4;

        int roomStartX = 1 + (this.grid.width - rooms * (roomWidth + roomSpacing)) / 2;
        int roomX = roomStartX;
        int roomY = 2;

        for (int i = 0; i < rooms; i++) {
            roomX = roomStartX + i * (roomWidth + roomSpacing);
            this.createRoom(roomX, roomY, roomWidth, roomHeight);

            if (i < rooms-1) {
                int pathX = roomX + (roomWidth-1);
                int pathY = round(random(roomY + 1, roomHeight - 1));
                int pathLength = roomSpacing + 1;
                this.placePathLine(pathX, pathY, pathX + pathLength, pathY);
                // 50% chance to place a second corridor
                if (floor(random(0, 2)) == 1) {
                    pathX = roomX + (roomWidth-1);
                    pathY = round(random(roomY + 1, roomHeight - 1));
                    pathLength = roomSpacing + 1;
                    this.placePathLine(pathX, pathY, pathX + pathLength, pathY);
                }
            }
        }

        this.randomlyPlaceEntities();
    }

    void generateOpenLevel() {
        int pillars = round(random(20, 30));
        int roomSize = round(random(8, 14));

        this.createRoom(0, 0, this.grid.width, this.grid.height);

        for (int i = 0; i < pillars; i++) {
            int x = round(random(roomSize, this.grid.width - roomSize));
            int y = round(random(roomSize, this.grid.height - roomSize));
            this.grid.data[x][y] = null;
            this.grid.setTile(x, y, new StoneWall());
        }

        this.randomlyPlaceEntities();
    }

    void randomlyPlaceEntities() {
        randomlyPlacePlayer();
        randomlyPlaceEnemies(round(random(10, 25)));
        randomlyPlacePeacefuls(round(random(0, 5)));
        randomlyPlaceItems(round(random(5, 15)));
        randomlyPlaceTrapDoor();
    }

    // TODO: major optimisation
    // TODO: stats are hard-coded here; change that!
    void randomlyPlacePlayer() {
        boolean found = false;
        while (!found) {
            int x = round(random(1, this.grid.width-1));
            int y = round(random(1, this.grid.height-1));

            if (this.grid.data[x][y] != null &&
                this.grid.data[x][y] instanceof Floor) {
                this.placePlayer(x, y, new Player(25, 1));
                found = true;
            }
        }
    }

    void randomlyPlacePlayer(Player p) {
        boolean found = false;
        while (!found) {
            int x = round(random(1, this.grid.width-1));
            int y = round(random(1, this.grid.height-1));

            if (this.grid.data[x][y] != null &&
                this.grid.data[x][y] instanceof Floor) {
                this.placePlayer(x, y, new Player(p));
                found = true;
            }
        }
    }

    // TODO: major optimisation
    // TODO: stats are hard-coded here; change that!
    void randomlyPlaceEnemies(int n) {
        for (; n > 0; n--) {
            boolean found = false;
            while (!found) {
                int x = round(random(1, this.grid.width-1));
                int y = round(random(1, this.grid.height-1));

                if (this.grid.data[x][y] != null &&
                    this.grid.data[x][y] instanceof Floor) {
                    this.placeEnemy(x, y, new Enemy(10, 1));
                    found = true;
                }
            }
        }
    }

    void randomlyPlacePeacefuls(int n) {
        for (; n > 0; n--) {
            boolean found = false;
            while (!found) {
                int x = round(random(1, this.grid.width-1));
                int y = round(random(1, this.grid.height-1));

                if (this.grid.data[x][y] != null &&
                    this.grid.data[x][y] instanceof Floor) {
                    this.placePeaceful(x, y, new Peaceful(5, 0));
                    found = true;
                }
            }
        }
    }

    // TODO: place items based on level difficulty
    // TODO: stats are hard-coded here; change that!
    void randomlyPlaceItems(int n) {
        for (; n > 0; n--) {
            boolean found = false;
            while (!found) {
                int x = round(random(1, this.grid.width-1));
                int y = round(random(1, this.grid.height-1));
                if (this.grid.data[x][y] != null &&
                    this.grid.data[x][y] instanceof Floor) {
                    // TODO: better item picking?
                    switch (round(random(0, 8))) {
                        case 0: {
                            this.placeItem(x, y, new Sword(floor(random(3, 7))));
                        } break;

                        case 1: {
                            this.placeItem(x, y, new Axe(floor(random(5, 8))));
                        } break;

                        case 2: {
                            this.placeItem(x, y, new Hammer(floor(random(8, 10))));
                        } break;

                        case 3: {
                            this.placeItem(x, y, new Pickaxe(floor(random(2, 4))));
                        } break;

                        case 4: {
                            this.placeItem(x, y, new Dagger(floor(random(1, 3))));
                        } break;

                        case 5: {
                            this.placeItem(x, y, new Mace(floor(random(3, 6))));
                        } break;

                        case 6: {
                            this.placeItem(x, y, new Spear(floor(random(5, 6))));
                        } break;

                        case 7: {
                            this.placeItem(x, y, new HealthPotion(floor(random(5, 15))));
                        } break;
                    }

                    found = true;
                }
            }
        }
    }

    // TODO: major optimisation
    void randomlyPlaceTrapDoor() {
        boolean found = false;
        while (!found) {
            int x = round(random(1, this.grid.width-1));
            int y = round(random(1, this.grid.height-1));
            if (this.grid.data[x][y] != null &&
                this.grid.data[x][y] instanceof Floor) {
                this.grid.setTile(x, y, new TrapDoor());
                found = true;
            }
        }
    }

    // remove level contents
    void destroy() {
        for (int i = 0; i < this.grid.width; i++) {
            for (int j = 0; j < this.grid.height; j++) {
                this.grid.data[i][j] = null;
            }
        }
        this.enemies = new ArrayList<Enemy>();
        this.peacefuls = new ArrayList<Peaceful>();
        this.player = null;
    }

    // TODO: get tile type from parameters

    // place rectangular room with one tile thick walls
    // walls will not replace floor tiles (helps avoid sealed off rooms)
    void createRoom(int x, int y, int width, int height) {
        // place floor
        for (int i = 1; i < width - 1; i++) {
            for (int j = 1; j < height - 1; j++) {
                this.grid.setTile(x + i, y + j, new StoneFloor());
            }
        }

        // place walls
        for (int i = 0; i < width; i++) {
            if (!(this.grid.data[i + x][y] instanceof Floor))
                this.grid.setTile(i + x, y, new StoneWall());
            if (!(this.grid.data[i + x][y + height-1] instanceof Floor))
                this.grid.setTile(i + x, y + height-1, new StoneWall());
        }
        for (int i = 1; i < height - 1; i++) {
            if (!(this.grid.data[x][i + y] instanceof Floor))
                this.grid.setTile(x, i + y, new StoneWall());
            if (!(this.grid.data[x + width - 1][i + y] instanceof Floor))
                this.grid.setTile(x + width - 1, i + y, new StoneWall());
        }
    }

    // places one tile of a path
    void placePathStep(int x, int y, boolean horizontal) {
        // TODO: paths need walls
        this.grid.setTile(x, y, new StoneFloor());

        if (horizontal) {
            this.grid.setTile(x, y - 1, new StoneWall());
            this.grid.setTile(x, y + 1, new StoneWall());
        } else {
            this.grid.setTile(x - 1, y, new StoneWall());
            this.grid.setTile(x + 1, y, new StoneWall());
        }
    }

    // NOTE: use Bresenham's line algorithm?
    // draw straight path from one point to another (inclusive)
    void placePathLine(int startX, int startY, int endX, int endY) {
        if (startY == endY) {
            for (int i = startX; i <= endX; i++) {
                if (this.grid.data[i][startY] == null ||
                    this.grid.data[i][startY] instanceof Wall) {
                    this.placePathStep(i, startY, true);
                }
            }
        } else {
            for (int i = startY; i <= endY; i++) {
                if (this.grid.data[startX][i] == null ||
                    this.grid.data[startX][i] instanceof Wall) {
                    this.placePathStep(startX, i, false);
                }
            }
        }
    }

    void placeItem(int x, int y, Item i) {
        this.grid.placeItem(x, y, i);
    }

    void placeEnemy(int x, int y, Enemy d) {
        d.x = x;
        d.y = y;
        this.enemies.add(d);
        this.grid.placeDynamic(x, y, d);
    }

    void placePeaceful(int x, int y, Peaceful d) {
        d.x = x;
        d.y = y;
        this.peacefuls.add(d);
        this.grid.placeDynamic(x, y, d);
    }

    void placePlayer(int x, int y, Player p) {
        p.x = x;
        p.y = y;
        this.player = p;
        this.grid.placeDynamic(x, y, p);
        // this.grid.makeAreaVisible(x, y, p.sightDistance);
    }

    // carry out tasks that cause changes to the level
    // takes a player action; occurs on key press
    void performTurn(Action a) {
        // status update
        for (int i = this.enemies.size()-1; i >= 0; i--) {
            Enemy e = this.enemies.get(i);
            if (e.health <= 0) {
                this.grid.data[e.x][e.y].dyn = null;
                this.enemies.remove(e);

                // 33% chance to drop something
                if (floor(random(0, 3)) == 0) {
                    switch (round(random(0, 8))) {
                        case 0: {
                            this.placeItem(e.x, e.y, new Sword(floor(random(3, 7))));
                        } break;

                        case 1: {
                            this.placeItem(e.x, e.y, new Axe(floor(random(5, 8))));
                        } break;

                        case 2: {
                            this.placeItem(e.x, e.y, new Hammer(floor(random(8, 10))));
                        } break;

                        case 3: {
                            this.placeItem(e.x, e.y, new Pickaxe(floor(random(2, 4))));
                        } break;

                        case 4: {
                            this.placeItem(e.x, e.y, new Dagger(floor(random(1, 3))));
                        } break;

                        case 5: {
                            this.placeItem(e.x, e.y, new Mace(floor(random(3, 6))));
                        } break;

                        case 6: {
                            this.placeItem(e.x, e.y, new Spear(floor(random(5, 6))));
                        } break;

                        case 7: {
                            this.placeItem(e.x, e.y, new HealthPotion(floor(random(5, 15))));
                        } break;
                    }
                }
            }
        }

        // status update
        for (int i = this.peacefuls.size()-1; i >= 0; i--) {
            Peaceful p = this.peacefuls.get(i);
            if (p.health <= 0) {
                this.grid.data[p.x][p.y].dyn = null;
                this.peacefuls.remove(p);
            }
        }

        // player turn
        this.player.takeTurn(a, this);

        // enemy turns
        for (Enemy e : this.enemies) {
            e.takeTurn(this);
        }

        // peaceful turns
        for (Peaceful p : this.peacefuls) {
            p.takeTurn(this);
        }
    }

    // draw level grid
    void draw() {
        this.grid.draw();
    }
}
