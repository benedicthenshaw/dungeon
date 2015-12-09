import ddf.minim.*;

//minim specific pre-loading
Minim minim;
AudioSample step1;
AudioSample step2;
AudioSample step3;
AudioSample step4;
AudioSample potionuse;
AudioPlayer music;
AudioPlayer drips;

void audioLoad() {
    //minim setup
    minim = new Minim(this);
    step1 = minim.loadSample("step1.wav");
    step2 = minim.loadSample("step2.wav");
    step3 = minim.loadSample("step3.wav");
    step4 = minim.loadSample("step4.wav");
    potionuse = minim.loadSample("potionuse.wav");
    music = minim.loadFile("dungeon.wav");
    drips = minim.loadFile("drips.wav");//not currently used
    
    music.setGain(-24);
    potionuse.setGain(-9);
    music.cue(0);
    music.loop();
}