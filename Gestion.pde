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
   
    game = new Game(nOrgs, nPlants);
    
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
      
    }
    
  }
  

  
  
}
