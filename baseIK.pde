PVector atbCmc;
float atbAng;
float atbCpt;
PVector atbFim = new PVector();

PVector brcCmc;
float brcAng;
float brcCpt;
PVector brcFim = new PVector();

PVector ombro;

void setup(){
  size(600,400);
  stroke(255);
  
  atbCmc = new PVector(300,200);
  atbCpt = 50;
  
  brcCmc = new PVector(300,200);
  brcCpt = 50;
  
  ombro = new PVector(width/2, height);
}

void draw(){
  background(51);
  
  { //antebraco ATB (end)
    PVector tempTarget = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(tempTarget,atbCmc);
    atbAng = dir.heading();
    dir.setMag(atbCpt);
    dir.mult(-1);
    atbCmc = PVector.add(tempTarget, dir);
  }
  
  { //antebraco ATB (end)
    float dx = atbCpt * cos(atbAng);
    float dy = atbCpt * sin(atbAng);
    atbFim.set(atbCmc.x+dx, atbCmc.y+dy);
  }
  
  { //braço BRC (start)
    PVector tempTarget = new PVector(atbCmc.x,atbCmc.y);
    PVector dir = PVector.sub(tempTarget,brcCmc);
    brcAng = dir.heading();
    dir.setMag(brcCpt);
    dir.mult(-1);
    brcCmc = PVector.add(tempTarget, dir);
  }
  
  { //braço BRC (start)
    float dx = brcCpt * cos(brcAng);
    float dy = brcCpt * sin(brcAng);
    brcFim.set(brcCmc.x+dx, brcCmc.y+dy);
  }
  
  {
    brcCmc = ombro.copy();
  }
  
  {
    float dx = brcCpt * cos(brcAng);
    float dy = brcCpt * sin(brcAng);
    brcFim.set(brcCmc.x+dx, brcCmc.y+dy);
  }
  
  {
    atbCmc = brcFim;
  }
  
  {
    float dx = atbCpt * cos(atbAng);
    float dy = atbCpt * sin(atbAng);
    atbFim.set(atbCmc.x+dx, atbCmc.y+dy);
  }
  
  stroke(0,255,0);
  line(atbCmc.x, atbCmc.y, atbFim.x, atbFim.y);
  
  stroke(255,0,0);
  line(brcCmc.x, brcCmc.y, brcFim.x, brcFim.y);
  
}