class Game
{
  
  
  ArrayList<Organism> orgs, deadOrgs, newOrgs;
  FoodFactory ff;
  boolean pause;
  boolean fastForward;
  
  
 Game(int nOrgs, int nFoods)
 {
   
  pause = false;
  fastForward = false;
  
  ff = new FoodFactory();
  ff.foods = new ArrayList<Food>();
  
  for(int i = 0; i < nFoods; i++)
  {
    ff.foods.add(new Food(random(width),random(height)));    
  }
  
  
  orgs = new ArrayList<Organism>();
  deadOrgs = new ArrayList<Organism>();
  newOrgs = new ArrayList<Organism>();
  
  for(int i = 0; i < nOrgs; i++)
  {
    orgs.add(new Organism());
  }
  
   
   
 }
 
 
 void update(float deltatime)
 {
      if(!pause)
      {
        ff.update(deltatime);
      
      
        for(Organism o : orgs)
        {
          
          o.findFood(ff.foods);
          o.update(deltatime);
          
          if(o.eat())
          {
            ff.foods.remove(o.target);
            o.target = null;      
          }
       
          
          if(o.energy<=0)
          {
            deadOrgs.add(o);
          }
          else if(o.energy > int(o.size*30))
          {
            newOrgs.add(new Organism(o));
            o.energy = int(o.size*10);
          }
        }
        
        for(Organism dO : deadOrgs)
        {
          orgs.remove(dO);
        }
        deadOrgs.clear();
        
        for(Organism nO : newOrgs)
        {
          orgs.add(nO);
        }
        newOrgs.clear();
      
        
        for(Food f : ff.foods)
        {
          f.update(deltatime);
        }
      }   
   
 }
 
 
 void display()
 {
       // --- Display organisms ---
      for(Organism o : orgs)
      {
        o.display();
      }
      
      // --- Display foods ---
      for(Food f : ff.foods)
      {
        f.display();
      }
}

// --- Switch Game Time ---
void changeGameTime()
{
    if(!fastForward) 
    {
      ff.gameTime = 100;
      for(Organism o : orgs)
      {
        o.gameTime = 100;
      }
      fastForward = true;
    }
    else 
    {
      ff.gameTime = 1;
      for(Organism o : orgs)
      {
        o.gameTime = 1;
      }
      fastForward = false;
    } 
}
 
 
  
  
}
