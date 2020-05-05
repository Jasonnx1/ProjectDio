int previousTime;
int deltaTime;
int currentTime;

Gestion gestion;

// Initialiser les musiques
SoundFile menuMus;
String menuPath = ("sound/menu.mp3");

SoundFile gameMus;
String gamePath = ("sound/game.mp3");

void setup()
{
  
  size(1200,800, P3D);
  
  currentTime = millis();
  previousTime = millis();
  gestion = new Gestion();
  textAlign(CENTER);
  
  // Envoyer les musiques à la classe de gestion
  menuMus = new SoundFile(this, menuPath);
  menuMus.amp(0.005);
  gestion.menuMusic = menuMus;
  gestion.menuMusic.loop();
  
  gameMus = new SoundFile(this, gamePath);
  gameMus.amp(0.03);
  gestion.gameMusic = gameMus;

  
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
  gestion.display();
}

void keyPressed()
{
  switch(key)
  {
    case 'r':   if(gestion.game != null) if(gestion.game.pause){ gestion.initGame(); }
    break;
    
    case 'm': if(gestion.game != null) if(gestion.game.pause){gestion.gameMusic.stop(); setup();}
    break;
    
    case 'p':   
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
     {
      gestion.initGame(); 
      gestion.gameMusic.loop();
     }
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
