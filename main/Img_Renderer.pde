//Image renderer/resizer for all sprites used. Images are drawn from the left top corner.


PImage imgPotion, imgFrame, imgBlip, tileWood, imgSword, imgPickaxe, imgAxe, imgHammer,prt1=null;
int wpnImgCount=0;
PImage[] wpnImg;

void imgLoad() {
  imgFrame=loadImage("FrameTR.png");
  imgPotion=loadImage("Potion.png");
  imgSword=loadImage("Sword.png");
  imgAxe=loadImage("Axe.png");
  imgHammer=loadImage("Hammer.png");
  imgPickaxe=loadImage("Pickaxe.png");
  tileWood=loadImage("Wood_tile.png");
  imgBlip=loadImage("Blip.png");
  prt1=loadImage("HealSFX.png");
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


void imgRender(PImage ayy, int posX, int posY, int rsize) {
  PImage ayyRsz=null;
  if (rsize==1) {
    ayyRsz=ayy;
  } else
  {
    ayyRsz=createImage(ayy.width*rsize, ayy.height*rsize, ARGB);
    ayyRsz.loadPixels();

    /* DEBUG
     for (int i =0; i<ayyRsz.width*ayyRsz.height; i++)
     {
     ayyRsz.pixels[i]=color(255);
     }*/
    for (int y=0; y<ayy.height; y++)
    {
      for (int x=0; x<ayy.width; x++)
      {
        for ( int ry=0; ry<rsize; ry++)
        {
          for ( int rx=0; rx<rsize; rx++)
          {
            ayyRsz.pixels[x*rsize+rx+y*rsize*ayyRsz.height+ry*ayyRsz.height]=ayy.pixels[x+y*ayy.height];
          }
        }
      }
    }
    ayyRsz.updatePixels();
  }
  image(ayyRsz, posX, posY, ayyRsz.width, ayyRsz.height);
}
void imgRender(PImage ayy, int posX, int posY) {
  image(ayy, posX, posY, ayy.width, ayy.height);
}