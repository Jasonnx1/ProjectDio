class Game
{
  
  
  ArrayList<Organism> orgs, newOrgs;
  ArrayList<Food> deadOrgs, corpses;
  PlantFactory pf;
  boolean pause;
  boolean fastForward;
  Terrain terrain;
  
  
 Game(int nOrgs, int nPlants, int _terrain)
 {
   switch(_terrain)
   {
    
     case 0: terrain = new Terrain(color(#228B22), 250, 1); //Forest
     break;
     
     case 1: terrain = new Terrain(color(#FFDF00), 100, 0.7); //Plains
     break;
     
     case 2: terrain = new Terrain(color(#7a7372), 600, 2); //Mountain
     break;
     
     case 3: terrain = new Terrain(color(#d0ec98), 500, 1.3); //Tundra
     break;
     
     
   }
   
  pause = false;
  fastForward = false;
  
  pf = new PlantFactory(terrain.foodRate);
  pf.plants = new ArrayList<Plant>();
  
  for(int i = 0; i < nPlants; i++)
  {
    pf.plants.add(new Plant(random(width),random(height)));    
  }
  
  
  orgs = new ArrayList<Organism>();
  deadOrgs = new ArrayList<Food>();
  newOrgs = new ArrayList<Organism>();
  corpses = new ArrayList<Food>();
  
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
          
          
          o.update(deltatime, pf.plants, orgs, corpses, terrain.moveDiff);
          //o.findPlant(pf.plants);
          
          if(o.eat())
          {
            if(o.target.getClass() == Plant.class)
            {
              pf.plants.remove(o.target);
            }
            else if (o.target.getClass() == Organism.class)
            {
              if(o.target.energy > 0 ) deadOrgs.add(o.target);
              else corpses.remove(o.target);
            }
            
            o.target = null;      
          }
       
          
          if(o.energy<=0)
          {
            o.fillColor = color(50,50,50);
            o.range = 0;
            o.energy = 0;
            deadOrgs.add(o);
            corpses.add(o);
          }
          else if(o.energy > int(o.size*30))
          {
            newOrgs.add(new Organism(o));
            o.energy = int(o.size*10);
          }
        }
        
        for(Food dO : deadOrgs)
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
   
      terrain.display();
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
      
      for(Food dO: corpses)
      {
        dO.display();
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
