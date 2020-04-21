class AI
{
  Organism org;
  
  AI(Organism o)
  {
    org = o;
  }
  
  void update(float deltaTime,ArrayList<Plant> pL, ArrayList<Organism> oL)
  {
    
    org.timer += deltaTime;
    if(org.timer > 1000)
    {
      org.energy -= (org.size/2)*org.speed*org.gameTime;
      org.timer = 0;
    }
    
    scan(pL, oL);
 
    
    if(org.target != null)
    {
      forage();
    }
    else
    {
      search();
    } 
  }
  
//=============================Scan=============================
  
  void scan(ArrayList<Plant> pL, ArrayList<Organism> oL)
  {
    findPlant(pL);
    findPrey(oL);
    if(org.prey != null)
    {
      if(org.location.dist(org.prey.location) <= org.location.dist(org.target.location))
      {
        org.target = org.prey;
      }
    }
    
    //findPredator(oL);
  }
  

  
  void findPlant(ArrayList<Plant> pL)
  {
    
    org.target = null;
    
    for(Plant p : pL)
    {
  
      if(org.location.dist(p.location) < org.range)
      {
  
        if(org.target == null) 
        {
          org.target = p;
          org.target.fillColor = color(255,0,0);
        }
        else if(org.location.dist(p.location) < org.location.dist(org.target.location))
        {
          
          org.target.fillColor = color(0,0,255);
          org.target = p;
          org.target.fillColor = color(255,0,0);
    
        }
      }
    }
  }
  
  void findPrey(ArrayList<Organism> oL)
  {
    org.prey = null;
    
    for(Organism o : oL)
    {
  
      if(org.location.dist(o.location) < org.range)
      {
        
        if(org.size > o.size + 5)
        {
          
          if(org.prey == null) 
          {
            org.prey = o;
            
          }
          else if(org.location.dist(o.location) < org.location.dist(org.prey.location))
          {
            org.prey = o;
          }
          
        }
        
      }
      
    }
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
//-----------------------------Eat-----------------------------   
  /*boolean eat()
  {
    if(org.target != null)
    {
      if(org.location.dist(org.target.location) < org.size)
      {
        // nutrition();
        org.energy += org.target.NutritiousValue;
        println(org.energy);
        return true;
      }
    }
    return false;
  }*/

//-----------------------------Seek----------------------------- 
  void search()
  {
    // Randomise X velocity

    PVector dir = new PVector(0,0);
    dir.x = noise(org.xoff.x, org.xoff.y);
    org.xoff.x += 0.002;
    org.yoff.y += 0.002;
    
    if(dir.x < 0.5)
    {
     dir.x *= -1;
    }
 
    // Randomise Y velocity
    dir.y = noise(org.yoff.x, org.yoff.y);
    org.yoff.x+= 0.005;
    org.yoff.y += 0.005;
     
    if(dir.y < 0.5)
    {
      dir.y *= -1;
    }
    // Make it a bit faster

    dir.mult(org.speed*org.gameTime);
    dir.limit(org.speed*org.gameTime);
    
    
    // Add Velocity
    
    org.location.add(dir);
  }
  
  void forage()
  {
    PVector _target = new PVector();
    _target = org.target.location.copy();
    PVector dir = _target.sub(org.location);
    dir.limit(org.speed*org.gameTime);
      
      
    org.location.add(dir);
  }
  
  
  
}
