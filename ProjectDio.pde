int previousTime;
int deltaTime;
int currentTime;

Gestion gestion;

void setup()
{
  size(1200,800, P3D);
  currentTime = millis();
  previousTime = millis();
  gestion = new Gestion();
}


void draw()
{
  
  currentTime = millis();
  deltaTime = currentTime - previousTime;
 
  update(deltaTime);
  display();
  
  previousTime = currentTime;
}

void update(int deltatime)
{   
    gestion.update(deltatime);
}

void display()
{
  background(#3BBF32);
  gestion.display();
}

void keyPressed()
{
  switch(key)
  {
   case 'r':   setup();
    break;
    
    case ' ':   
               if(gestion.game != null)
               {
                  if(!gestion.game.pause) gestion.game.pause = true;
                  else gestion.game.pause = false;
               }
    break;
    
    case 'q':  if(gestion.game != null)gestion.game.changeGameTime(); 
    break;
  }
  
  if(keyCode == ENTER)
  {
   if(gestion.game == null)
    gestion.initGame();   
  }

}

// ----- MOUSE PRESSED EVENT FOR MENU -----
void mousePressed()
{

 if(gestion.game == null)
 {
   
    if(mouseButton == LEFT)
    {    
       gestion.checkClick(new PVector(mouseX, mouseY) );
    }
 
 }
  
  
}
