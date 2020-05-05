class Gestion
{
  
  Game game;
  Menu menu;
  UI ui;
  
  SoundFile menuMusic;
  SoundFile gameMusic;
  
  int year = 0;
  float timer = 0;
  
  int nOrgs;
  int nPlants;

  float baseSize;
  float baseSpeed;
  int baseRange;
  
  Gestion()
  {
    nOrgs = 5;
    nPlants = 3;
    
    baseSize = 7;
    baseSpeed = 1;
    baseRange = 150;
    
    menu = new Menu();
    game = null;
    ui = new UI();
    
  }
  
  void initGame()
  {
   
    game = new Game(nOrgs, nPlants, menu.terrainChoice, baseSpeed, baseSize, baseRange);
    menu.buttons.clear();
    year = 0;
    timer = 0;
    menuMusic.stop();
  }
  
  
  void update(float deltatime)
  {
    
    
    
    if(game != null)
    {
      if(!game.pause)
      {
          timer += deltatime;
          if(timer > 10/game.gameTime)
          { 
            if(game.gameTime > 1)
            {
             
              year += timer/10;
              
            }
            else
            {
             year++; 
             timer = 0;    
            }
            
          }
         
          game.update(deltatime);
      }
      
    }
    else
    {    
      menu.checkMouse(new PVector(mouseX, mouseY) );    
    }

    
  }
  
  
  void display()
  {
    
    
    if(game != null)
    {
     
      game.display();
      ui.display(year);

      
      if(game.pause)
      {
       menu.display(nOrgs, nPlants, 2, baseSpeed, baseSize, baseRange); 
      }
      
    }
    else
    {
     
      menu.display(nOrgs, nPlants, 1,  baseSpeed, baseSize, baseRange);
      
   
      
    }
    
  
  }
  
  void checkClick(PVector mouse)
  {
   
    int i = menu.checkClick(mouse);
    
    switch(i)
    {
      case 1: nOrgs += 1;
      break;
      
      case 2: if(nOrgs > 1)nOrgs -= 1;
      break;
      
      case 3: nPlants += 1;
      break;
      
      case 4: if(nPlants> 1)nPlants -= 1;
      break;
      
      case 5: menu.terrainChoice += 1; if(menu.terrainChoice > 3) menu.terrainChoice = 0;
      break;
      
      case 6: menu.terrainChoice -= 1; if(menu.terrainChoice < 0) menu.terrainChoice = 3;
      break;
      
      case 7: baseSpeed += 0.1;
      break;
      
      case 8: if(baseSpeed > 0.1)baseSpeed -= 0.1;
      break;
      
      case 9: baseSize += 0.1;
      break;
      
      case 10: if(baseSize > 0.1)baseSize -= 0.1;
      break;
      
      case 11: baseRange += 1;
      break;
      
      case 12: if(baseRange > 1)baseRange -= 1;
      break;
      
      
    }
    
  }
  

  
  
}
