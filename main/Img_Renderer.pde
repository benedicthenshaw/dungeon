//Image renderer/resizer for all sprites used. Images are drawn from the left top corner.


PImage imgPotion, imgFrame, imgBlip,
       tileWood, imgSword, imgPickaxe,
       imgAxe, imgHammer, imgDagger,
       imgMace, imgSpear, prt1 = null;
int wpnImgCount = 0;
PImage[] wpnImg;

void imgLoad() {
    imgFrame = loadImage("FrameTR.png");
    imgPotion = loadImage("Potion.png");
    imgSword = loadImage("Sword.png");
    imgAxe = loadImage("Axe.png");
    imgHammer = loadImage("Hammer.png");
    imgPickaxe = loadImage("Pickaxe.png");
    imgDagger = loadImage("Dagger.png");
    imgMace = loadImage("Mace.png");
    imgSpear = loadImage("Spear.png");
    tileWood = loadImage("Wood_tile.png");
    imgBlip = loadImage("Blip.png");
    prt1 = loadImage("HealSFX.png");

    //file read system
    /*String lines[] = loadStrings("Items.txt");
    println("there are " + lines.length + " lines");
    for (int i = 0; i < lines.length; i++) {
    if (lines[i].charAt(0)=='#') {
    wpnImg[wpnImgCount]=loadImage(lines[i+1]);
    wpnImgCount++;
    println(lines[i+2]);
    println(int(lines[i+3])+round(random(int(lines[i+4]), int(lines[i+5]))));
    i+=5;
    }
    }*/
}


void imgRender(PImage img, int posX, int posY, int rsize) {
    PImage imgRsz = null;
    if (rsize == 1) {
        imgRsz=img;
    } else {
        imgRsz=createImage(img.width*rsize, img.height*rsize, ARGB);
        imgRsz.loadPixels();

        for (int y = 0; y < img.height; y++) {
            for (int x = 0; x < img.width; x++) {
                for (int ry = 0; ry < rsize; ry++) {
                    for (int rx=0; rx < rsize; rx++) {
                        imgRsz.pixels[x * rsize + rx + y * rsize * imgRsz.height + ry * imgRsz.height] = img.pixels[x + y * img.height];
                    }
                }
            }
        }

        imgRsz.updatePixels();
    }

    image(imgRsz, posX, posY, imgRsz.width, imgRsz.height);
}

void imgRender(PImage img, int posX, int posY) {
    image(img, posX, posY, img.width, img.height);
}
