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
  
  
  Gestion()
  {
    nOrgs = 5;
    nPlants = 3;
    menu = new Menu();
    game = null;
    ui = new UI();
    
  }
  
  void initGame()
  {
   
    game = new Game(nOrgs, nPlants, menu.terrainChoice);
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

    
  }
  
  
  void display()
  {
    
    
    if(game != null)
    {
     
      game.display();
      ui.display(year);

      
      if(game.pause)
      {
       menu.display(nOrgs, nPlants, 2); 
      }
      
    }
    else
    {
     
      menu.display(nOrgs, nPlants, 1);
      
   
      
    }
    
  
  }
  
  void checkClick(PVector mouse)
  {
   
    int i = menu.checkClick(mouse);
    
    switch(i)
    {
      case 1: nOrgs += 1;
      break;
      
      case 2: nOrgs -= 1;
      break;
      
      case 3: nPlants += 1;
      break;
      
      case 4: nPlants -= 1;
      break;
      
      case 5: menu.terrainChoice += 1; if(menu.terrainChoice > 3) menu.terrainChoice = 0;
      break;
      
      case 6: menu.terrainChoice -= 1; if(menu.terrainChoice < 0) menu.terrainChoice = 3;
      break;
      
    }
    
  }
  

  
  
}
