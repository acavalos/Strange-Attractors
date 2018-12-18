int n = 5000;
float hue,sat,bri,alph;
int pause = 0;
int MODE = 0;

// Zoom and translation levels
float scale,zoom;
float dx,dy;
int log;

float[] coeff = new float[12];
dustparticle[] dust = new dustparticle[n];

void setup() {
  size(640,480,P2D);
  colorMode(HSB,100,100,100,100);
  
  hue = random(0,100);
  sat = random(0,100);
  bri = random(0,100);
  alph = 1;
  background(hue,sat,bri);
  
  scale = width/2;
  dx = 0;
  dy = 0;
  
  for(int i=0;i<12;i++) {
    coeff[i] = random(-1,1); 
  }
  
  for(int i=0;i<dust.length;i++) {
    dust[i] = new dustparticle(); 
  }
}

void draw() {
  int log = floor(log(width)/log(10));
  float zoom = pow(10,log-1);
  
  if(MODE==1) {
    background(hue,sat,bri);
    alph = 100;
  } else {
    alph = 1;
  }
  
// Controls for changing the plot
  if(keyPressed == true) {
    clear(); 
    background(hue,sat,bri);
    
    if (key == 'w') {
      dy -= zoom; 
    }
    
    if(key == 's') {
      dy += zoom; 
    }
   
    if(key == 'a') {
      dx -= zoom; 
    }
    if(key == 'd') {
      dx += zoom; 
    }


    if(key == 'r') {
      hue = random(0,100);
       sat = random(0,100);
       bri = random(0,100);  
       background(hue,sat,bri);
     }
  }
  
  translate(width/2 + dx,height/2 + dy);
  
  for(int i=0;i<dust.length;i++) {
    dust[i].update();
    dust[i].show();
  }
}

float sign(float x){
  if(x!=0) {
    return x/abs(x); 
  } else {
    return 0;
  }
}
//Adjust mode
void keyPressed() {
  if(key == 'm') {
    MODE = 1 - MODE; 
  }
  if(key == 'n') {
    setup(); 
  }
}

void mouseWheel(MouseEvent event) {
    float e = event.getCount();
    println(e,sign(e));
    scale *= pow(1-sign(e)*0.05,abs(e));
    background(hue,sat,bri);
  }