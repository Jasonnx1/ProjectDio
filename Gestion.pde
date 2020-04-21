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
  
  void changeNOrgs(int i)
  {
    nOrgs += i;
    
    if(nOrgs < 1)
    nOrgs = 1; 
  }
  
  
  void changeNFoods(int i)
  {   
    nFoods += i;
    
    if(nFoods < 1)
    nFoods = 1; 
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
  

  
  
}
