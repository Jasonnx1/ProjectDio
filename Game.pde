class Game
{
  
  
  ArrayList<Organism> orgs, deadOrgs, newOrgs;
  PlantFactory pf;
  boolean pause;
  boolean fastForward;
  
  
 Game(int nOrgs, int nPlants)
 {
   
  pause = false;
  fastForward = false;
  
  pf = new PlantFactory();
  pf.plants = new ArrayList<Plant>();
  
  for(int i = 0; i < nPlants; i++)
  {
    pf.plants.add(new Plant(random(width),random(height)));    
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
        pf.update(deltatime);
      
      
        for(Organism o : orgs)
        {
          
          
          o.update(deltatime, pf.plants, orgs);
          //o.findPlant(pf.plants);
          
          if(o.eat())
          {
            pf.plants.remove(o.target);
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
      
        
        for(Plant p : pf.plants)
        {
          p.update(deltatime);
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
      
      // --- Display plants ---
      for(Plant p : pf.plants)
      {
        p.display();
      }
}

// --- Switch Game Time ---
void changeGameTime()
{
    if(!fastForward) 
    {
      pf.gameTime = 100;
      for(Organism o : orgs)
      {
        o.gameTime = 100;
      }
      fastForward = true;
    }
    else 
    {
      pf.gameTime = 1;
      for(Organism o : orgs)
      {
        o.gameTime = 1;
      }
      fastForward = false;
    } 
}
 
 
  
  
}
