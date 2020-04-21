class Gestion
{
  
  Game game;
  Menu menu;
  
  int nOrgs;
  int nPlants;
  
  
  Gestion()
  {
    nOrgs = 5;
    nPlants = 3;
    menu = new Menu();
    game = null;
    
  }
  
  void initGame()
  {
   
    game = new Game(nOrgs, nPlants, menu.terrainChoice);
    
  }
  
  
  void update(float deltatime)
  {
    
    if(game != null)
    {
     
      game.update(deltatime);
      
    }

    
  }
  
  
  void display()
  {
    
    if(game != null)
    {
     
      game.display();
      
    }
    else
    {
     
      menu.display(nOrgs, nPlants);
      
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
