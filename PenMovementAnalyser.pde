boolean drawing;
int prevX, prevY;
int startTime, ic, vsc, sc, rc, fc, sfc;

void setup() {
  size(1000,500);
  frameRate = 60;
  background(255);
  smooth();
  
  //initialize vars
  drawing = false;
  
}

void draw() {
  if(drawing) {
    //calculate spacing and orientation between mouse positions at each frame
    stroke(0);
    line(prevX,prevY,mouseX,mouseY);
    
    noStroke();
    fill(255);
    rect(0,height-20,width,20);
    fill(0);
    //text(analyseMove(),width/2,height);
    println((millis() - startTime) + " " + analyseMove());
    
    
    prevX = mouseX;
    prevY = mouseY;
  }
}

String analyseMove() {
  //first check if is idle
  //if(prevX == mouseX && prevY == mouseY) {
  //  ic++;
  //  return "idle";
  //}
  
  float dist = abs(dist(prevX,prevY,mouseX,mouseY)) / 10;
  if(dist > 0 && dist < 0.2) {
    vsc++;
    return "very slow";
  }
  if(dist < 0.5) {
    sc++;
    return "slow";
  }
  
  if(dist < 1) {
    rc++;
    return "regular";
  }
  
  if(dist < 2) {
    fc++;
    return "fast";
  } else {
    sfc++;
    return "super fast";
  }
}

void mousePressed() {
  prevX = mouseX;
  prevY = mouseY;
  ic = vsc = sc = rc = fc = sfc = 0;
  startTime = millis();
  drawing = true;
}

void mouseReleased() {
  drawing = false;
  println("Shape took " + (millis() - startTime) + " ms (" + ic +" idle, "+ vsc +" veryslow, "+ sc +" slow, "+ rc +" regular, "+ fc +" fast, "+ sfc +" superfast)"); 
}
