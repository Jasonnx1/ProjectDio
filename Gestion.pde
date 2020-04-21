class Gestion
{
  
  Game game;
  Menu menu;
  
  int nOrgs;
  int nFoods;
  
  
  Gestion()
  {
    nOrgs = 5;
    nFoods = 3;
    menu = new Menu();
    game = null;
    
  }
  
  void initGame()
  {
   
    game = new Game(nOrgs, nFoods);
    
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
     
      menu.display(nOrgs, nFoods);
      
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
      
      case 3: nFoods += 1;
      break;
      
      case 4: nFoods -= 1;
      break;
      
    }
    
  }
  

  
  
}
