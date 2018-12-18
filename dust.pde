class dustparticle {
  PVector pos;
  int life;
  float max_life;
  
  dustparticle() {
    pos = newPVec();
    life = 0;
    max_life = random(1,9);
  }
  
  void update() {
    PVector pold = pos;
    pos.x = coeff[0] + coeff[1]*pold.x + coeff[2]*pold.y + coeff[6]*pold.x*pold.y + coeff[8]*pold.x*pold.x + coeff[9]*pold.y*pold.y; 
    pos.y = coeff[3] + coeff[4]*pold.x + coeff[5]*pold.y + coeff[7]*pold.x*pold.y + coeff[10]*pold.x*pold.x + coeff[11]*pold.y*pold.y;
    
    if( pos.mag() > 2*scale || life >= max_life) {
      pos = newPVec();
      max_life = random(5,50);
      life = 0;
    } else {
      life += 1; 
    }
  }
  
  void show() {
    noStroke();
    fill(100 - hue,100 - sat,100 - bri, 1);
    if(life!=0) {
      ellipse(scale * pos.x,scale * pos.y,2,alph);
    }
  }
}

PVector newPVec() {
  PVector out = new PVector(random(-1,1), random(-1,1));
  return out;
}