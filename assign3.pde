/* please implement your assign1 code in this file. */

  PImage fighter;
  PImage bg1;
  PImage bg2;
  PImage hp;
  PImage enemy, enemy1;
  PImage treasure;
  PImage startBg1, startBg2, endBg1,endBg2;
  int treasureX, treasureY;
  int bloodX;
  int x;
  int y;
  int a;
  int b;
  int c;
  int bg1X,bg2X;
  int speedBg,speedFighter;
  float enemyX,enemyY, enemy1X, enemy1Y;
  int fighterX,fighterY;
  boolean upPressed;
  boolean downPressed;
  boolean rightPressed;
  boolean leftPressed;
  boolean reset;
  final int STATE_1=1, STATE_2=2,STATE_3=3;
  int gameState;
  
  
  
void setup () {
  //load image
  fighter=loadImage("img/fighter.png");
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  hp=loadImage("img/hp.png");
  enemy=loadImage("img/enemy.png");
  enemy1=loadImage("img/enemy1.png");
  treasure=loadImage("img/treasure.png");
  
  //initiate variables
  treasureX=floor(random(80,400));
  treasureY=floor(random(100,400));
  bloodX=40;
  x=0;
  y=0;
  size(640,480); 
  
  bg1X=0;
  bg2X=-640;
  speedBg=4;
  speedFighter=8;
  
  enemyX=0;
  enemyY=floor(random(140,200));
  fighterX=580;
  fighterY=240;
  upPressed=false;
  downPressed=false;
  rightPressed=false;
  leftPressed=false;
  reset=false;
  
  gameState=STATE_1;

}




void draw() {
      
      //bg scrolling
      image(bg1,bg1X,0);
      image(bg2,bg2X,0);
      bg1X+=speedBg;
      bg2X+=speedBg;
      if (bg1X>640){
      bg1X*=-1;}
      if (bg2X>640){
      bg2X*=-1;}
      
      
      image(fighter,fighterX,fighterY);
      image(treasure,treasureX,treasureY);
      rect(37,23,bloodX,25);  //blood
      fill(255,0,0);
      stroke(0,0,0,0);
      image(hp,30,20); 
      
      //enemy                 
      if (enemyX>640){ 
      enemyX=enemyX-1000;}
      if (enemyY>640){ 
      enemyY=enemyY-640;}
      
      enemyX+=speedFighter-5;  
      
      switch (gameState){
 
        case STATE_1:
          //straight line
          for (int i=0; i<400; i+=80){
          image(enemy,enemyX+i,enemyY);
          }
          enemyX+=speedFighter-5;
          
          if (enemyX>640){
          enemyY=floor(random(140,200));
          gameState=STATE_2;}
          break;
        
        case STATE_2:
          //leaning line
          for (int p=0; p<350; p+=70){
            for (int h=0; h<250; h+=50){
              if (p==h*1.4){
                image(enemy,enemyX+p,enemyY+h);}
              }
          }
          enemyX+=speedFighter-5; 
          
          
          if (enemyX>640){
          enemyY=floor(random(80,200));
          gameState=STATE_3;}
          break;
        
        case STATE_3:
          //dimond
          for (int a=0; a<210; a+=70){
              image(enemy,enemyX,enemyY);
              image(enemy,enemyX+70,enemyY+70);
              image(enemy,enemyX+140,enemyY+140);
              image(enemy,enemyX+70,enemyY-70);
              image(enemy,enemyX+140,enemyY-140);
              image(enemy,enemyX+210,enemyY+70);
              image(enemy,enemyX+210,enemyY-70);
              image(enemy,enemyX+280,enemyY);
          }
          enemyX+=speedFighter-5; 
          if (enemyX>640){
          enemyY=floor(random(140,200));
          gameState=STATE_1;}
          break;
          

      }
      
      
      
      
    
      //key control of the plane
      if (upPressed){
      fighterY-=speedFighter;
      }
      if (downPressed){
      fighterY+=speedFighter;
      }
      if (rightPressed){
      fighterX+=speedFighter;
      }
      if (leftPressed){
      fighterX-=speedFighter;
      }
      
      //border
      if (fighterX>width-50){fighterX=width-50;}
      if (fighterX<0){fighterX=0;}
      if (fighterY>height-50){fighterY=height-50;}
      if (fighterY<0){fighterY=0;}
      if (bloodX>200){bloodX=200;}

}




//use switch function wit hboolean to control keyPressed
void keyPressed(){
  if(key==CODED){     //detect special key input
    switch(keyCode){  //keyCode is the special coded key
      case UP:
         upPressed=true;
         break;
      case DOWN:
         downPressed=true;
         break;
      case RIGHT:
         rightPressed=true;
         break;
      case LEFT:
         leftPressed=true;
         break;
    }//switch colunmn
  }  //if column

}//keyPressed coulumn


void keyReleased(){
  if(key==CODED){     //detect special key input
    switch(keyCode){  //keyCode is the special coded key
      case UP:
         upPressed=false;
         break;
      case DOWN:
         downPressed=false;
         break;
      case RIGHT:
         rightPressed=false;
         break;
      case LEFT:
         leftPressed=false;
         break;
    }//switch colunmn
  }  //if column
}//keyReleased coulumn
