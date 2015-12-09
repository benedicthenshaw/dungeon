class Prtc {
  float x, y, speedX, speedY, alpha=0;
  PImage src=null;

  Prtc (PImage inputImg) {
    src=inputImg;
    alpha=round(random(100, 255));
    x=width/2-src.width/2;
    y=height/2-src.height/2;
    while ((speedX==0)&&(speedY==0))
    {
      speedX=(random(-2, 2));
      speedY=(random(-2, 2));
    }
  }
  Prtc (PImage inputImg, float tx, float ty) {
    src=inputImg;
    alpha=round(random(100, 255));
    x=tx;
    y=ty;
    while ((speedX==0)&&(speedY==0))
    {
      speedX=(random(-2, 2));
      speedY=(random(-2, 2));
    }
  }
  Prtc (PImage inputImg, float tx, float ty, float tSpeedX, float tSpeedY) {
    src=inputImg;
    alpha=round(random(100, 255));
    x=tx;
    y=ty;
    speedX=tSpeedX;
    speedY=tSpeedY;
  }
  Prtc (PImage inputImg, float tx, float ty, float tSpeedX, float tSpeedY, float tAlpha) {
    src=inputImg;
    alpha=round(tAlpha);
    x=tx;
    y=ty;
    speedX=tSpeedX;
    speedY=tSpeedY;
  }

  void draw() {
    alpha--;
    x+=speedX;
    y+=speedY;
    speedX*=1.01;
    speedY*=1.01;
    tint(255, alpha);
    image(src, x, y, src.width, src.height);
  }
}

void createParticles(PImage prt, float x, float y) {
  potionuse.trigger();
  int n=round(random(10, 50));
  for (int i=0; i<n; i++) {
    game.pCount++;
    game.prtcls.add(new Prtc(prt, x, y, cos(radians(360*i/n)), sin(radians(360*i/n)), 255));
  }
}

void createParticles(PImage prt, float x, float y, int min, int max) {
  int n=round(random(10, 50));
  for (int i=0; i<=n; i++) {
    game.pCount++;
    game.prtcls.add(new Prtc(prt, x, y, cos(radians(360*i/n)), sin(radians(360*i/n)), 255));
  }
}