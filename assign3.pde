//You should implement your assign3 here.
final int gameStart = 1;
final int gameRun = 2;
final int enemy1 =3;
final int enemy2 =4;
final int enemy3 =5;


PImage backgroundImg1;
PImage backgroundImg2;
PImage fighter;
PImage treasure;
PImage hp;
PImage enemy;
PImage start1;
PImage start2;

int state = gameStart;
int state2 = enemy1;


int x,y;
//fighter
int fighterX,fighterY;
float speed ;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
//treasure
int treasureX,treasureY;
//HP
int hpX;
//enemy
int enemyX,enemyY;

void setup () {
  size(640, 480) ;
  backgroundImg1 = loadImage("img/bg1.png");
  backgroundImg2 = loadImage("img/bg2.png");
  fighter = loadImage("img/fighter.png");
  treasure = loadImage("img/treasure.png");
  hp = loadImage("img/hp.png");
  enemy = loadImage("img/enemy.png");
  start1 = loadImage("img/start1.png");
  start2= loadImage("img/start2.png");
  
  //background
  x = -640;
  y = 0;
  //fighter
  speed = 5;
  fighterX = 570;
  fighterY = 240;
  //treasure
  treasureX = floor(random(600));
  treasureY = floor(random(400));
  //enemy
  enemyX = 0;
  enemyY = floor(random(400));

}

void draw() {
  switch(state){
    case gameStart :
    
    image(start2,0,0,640,480);
    if(mouseX> 210 && mouseX< 440 && mouseY > 370 && mouseY< 410){
      image(start1,0,0,640,480);
    }
    
    break;
    
    case gameRun:
   
    // background
    image(backgroundImg1,x,0,640,480);
    image(backgroundImg2,y,0,640,480);
    x++;
    y++;
    if(y==640){
      y=-640;
    }
    if(x==640){
      x=-640;
    }
    //fighter
    
    if (upPressed) {
      fighterY -= speed;
    }
    if (downPressed) {
      fighterY += speed;
    }
    if (leftPressed) {
      fighterX -= speed;
    }
    if (rightPressed) {
      fighterX += speed;
    }
    image(fighter,fighterX,fighterY);
    //boundary detection
    if(fighterX < 0){
      fighterX = 0;
    }
    if(fighterX > width-51){
      fighterX = width-51;
    }
    if(fighterY < 0){
      fighterY = 0;
    }
    if(fighterY > 480-51){
      fighterY = 429;
    }
    //treasure
    image(treasure,treasureX,treasureY);
    //hp
    fill(255,0,0);
    rect(15,13,200,20);
    image(hp,10,10);
    
    //enemy
    switch(state2){
      case enemy1:
        for(int i=0;i<5;i++){
        image(enemy,enemyX-61*i,enemyY);
        }
        enemyX += 5;
        if(enemyX-61*5 >= 640){
          state2 = enemy2;
          enemyX =0;
          enemyY = floor(random(100));
        }
        break;
      case enemy2:
        for(int i=0;i<5;i++){
          image(enemy,enemyX-61*i,enemyY+61*i);
      }
        enemyX +=5;
        if(enemyX-61*5 >= 640){
          state2=enemy3;
          enemyX =0;
          enemyY = floor(random(70,295));
        }
      
      break;
      
      case enemy3:
        for(int i=0;i<5;i++){
          
            if(i<3){
            image(enemy,enemyX-61*i,enemyY+61*i);
            
            }else if(i==3){
              image(enemy,enemyX-61*i,enemyY+61*(i-2));
            }else{
              image(enemy,enemyX-61*i,enemyY);
            }
        } 
        for(int j=0; j<5;j++){
          if(j<3){
            image(enemy,enemyX-61*j,enemyY-61*j);
          }else if(j==3){
            image(enemy,enemyX-61*j,enemyY-61*(j-2));
          }else{
            image(enemy,enemyX-61*j,enemyY);
          }
        }
        enemyX +=5;
        if(enemyX-61*5 >= 640){
          state2=enemy1;
          enemyX =0;
          enemyY = floor(random(400));
        }
        
        break;
    }
    }
}

void mousePressed(){
  if(mouseX> 210 && mouseX< 440 && mouseY > 370 && mouseY< 410){
  state = gameRun; 
  }
  
}

void keyPressed() {
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
