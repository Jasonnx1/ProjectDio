class Organism extends Food
{
  Food target;
  Organism prey;
  ArrayList<Organism> predators = new ArrayList<Organism>();
  AI ai = new AI(this);
  
  PVector xoff = new PVector(0,0);
  PVector yoff = new PVector(0,0);
  float speed;
  float range;
  float size;
  //int energy;
  float timer = 0;
  long seed;
  
  int mutationFactor, mutationRoll;
  int mutationChance = 1;
  int r,g,b;
  
  
  //Comportements (0-20)
  float social;
  float aggression;
  float passif;
  
  //Stats (0-20)
  float attack;
  float defense;
  float camo;
  
  //Autre (0 = herb, 20 = meat)
  float diet;

//=============================Constructors=============================

//-----------------------------Basic---------------------------- 
  Organism()
  {
     location = new PVector(random(0, width), random(0, height));
     speed = 2;
     size = 10;
     range = 150;
     r = 150; g = 150; b = 150;
     fillColor = color(r,g,b);
     energy = int(size*20);
     seed = ( (long)random(0, 1000000) );
     
     
     social = 10;
     aggression = 10;
     passif = 10;
     //--------
     attack = 10;
     defense = 10;
     camo = 10;
     //--------
     diet = 10;
     
     
     NutritiousValue = (int) size*10;
     CollectionTime = (int) size;
  }
  
  Organism(Organism parent)
  {
     location = new PVector(parent.location.x + random(-20,20),parent.location.y + random(-20,20));
     seed = ( (long)random(0, 1000000) );
     
     //~~~~~~~~~Speed~~~~~~~~~
     mutationRoll = int (random(20));
     if(mutationRoll < mutationChance)
     {
       mutationFactor = int (random(3));
       speed = parent.speed - 1 + mutationFactor;
       r = int ((parent.r - 5 + mutationFactor*5)*5);
     }
     else 
     {
       speed = parent.speed;
       r = parent.r;
     }
     
     //~~~~~~~~~Size~~~~~~~~~
     mutationRoll = int (random(20));
     if(mutationRoll < mutationChance)
     {
       mutationFactor = int (random(5));
       size = parent.size - 2 + mutationFactor;
       g = int ((parent.g - 5 + mutationFactor*2.5)*5);
     }
     else 
     { 
       size = parent.size;
       g = parent.g;
     }
     
     //~~~~~~~~~Range~~~~~~~~~
     mutationRoll = int (random(20));
     if(mutationRoll < mutationChance)
     {
       mutationFactor = int (random(31));
       range = parent.range - 15 + mutationFactor;
       b = int ((parent.b - 5 + mutationFactor/3)*5);
     }
     else 
     {
       range = parent.range;
       b = parent.b;
     }
     
     //~~~~~~~~~Social~~~~~~~~~
     mutationRoll = int (random(20));
     if(mutationRoll < mutationChance)
     {
       mutationFactor = int (random(3));
       social = parent.social - 1 + mutationFactor;
     }
     else 
     {
       social = parent.social;
     }
     
     //~~~~~~~~~Aggression~~~~~~~~~
     mutationRoll = int (random(20));
     if(mutationRoll < mutationChance)
     {
       mutationFactor = int (random(3));
       aggression = parent.aggression - 1 + mutationFactor;
     }
     else 
     {
       aggression = parent.aggression;
     }
     
     //~~~~~~~~~Passif~~~~~~~~~
     mutationRoll = int (random(20));
     if(mutationRoll < mutationChance)
     {
       mutationFactor = int (random(3));
       passif = parent.passif - 1 + mutationFactor;
     }
     else 
     {
       passif = parent.passif;
     }
     
     //~~~~~~~~~Attack~~~~~~~~~
     mutationRoll = int (random(20));
     if(mutationRoll < mutationChance)
     {
       mutationFactor = int (random(3));
       attack = parent.attack - 1 + mutationFactor;
     }
     else 
     {
       attack = parent.attack;
     }
     
     //~~~~~~~~~Defense~~~~~~~~~
     mutationRoll = int (random(20));
     if(mutationRoll < mutationChance)
     {
       mutationFactor = int (random(3));
       defense = parent.defense - 1 + mutationFactor;
     }
     else 
     {
       defense = parent.defense;
     }
     
     //~~~~~~~~~Camo~~~~~~~~~
     mutationRoll = int (random(20));
     if(mutationRoll < mutationChance)
     {
       mutationFactor = int (random(3));
       camo = parent.camo - 1 + mutationFactor;
     }
     else 
     {
       camo = parent.camo;
     }
     
     //~~~~~~~~~Camo~~~~~~~~~
     mutationRoll = int (random(20));
     if(mutationRoll < mutationChance)
     {
       mutationFactor = int (random(3));
       diet = parent.diet - 1 + mutationFactor;
     }
     else 
     {
       diet = parent.diet;
     }
     
     gameTime = parent.gameTime;
     fillColor = color(r,g,b);
     energy = int(size*10);
     
     NutritiousValue = (int) size*10;
     CollectionTime = (int) size;
     predators = new ArrayList<Organism>();
     
     
  }
  

  
//=============================Update=============================
  
  void update(float deltaTime, ArrayList<Plant> pL, ArrayList<Organism> oL, ArrayList<Food> doL, float moveDiff)
  {
    
    noiseSeed(seed);
    
    
    ai.update(deltaTime, pL,oL, doL, moveDiff);
    
    /*
    timer += deltaTime;
    if(timer > 1000)
    {
      energy -= (size/2)*speed*gameTime;
      timer = 0;
    }
 
    findPlant(pL);
 
    if(target != null)
    {
      PVector _target = new PVector();
      _target = target.location.copy();
      PVector dir = _target.sub(location);
      dir.limit(speed*gameTime);
      
      
      location.add(dir);
    }
    else
    {
      seek();
    }
    */
    
    checkEdges();
    
  }
  
  
  
//=============================Display=============================
  
  void display()
  {
    fill(0,255,0,0);
    stroke(100,100,255);
    ellipse(location.x, location.y, range*2, range*2);
    stroke(255,100,100);
    ellipse(location.x, location.y, 300, 300);
    fill(fillColor);
    stroke(strokeColor);
    ellipse(location.x, location.y, size*2, size*2);
    fill(0);
    textSize(11);
    text(energy, location.x-10, location.y-10);
  }



//=============================Functions=============================  

//-----------------------------Find Plant----------------------------- 
  void findPlant(ArrayList<Plant> pL)
  {
    
    target = null;
    
    for(Plant p : pL)
    {
  
      if(location.dist(p.location) < range)
      {
  
        if(target == null) 
        {
          target = p;
          target.fillColor = color(255,0,0);
        }
        else if(location.dist(p.location) < location.dist(target.location))
        {
          
          target.fillColor = color(0,0,255);
          target = p;
          target.fillColor = color(255,0,0);
    
        }
      }
    }
  }
  
//-----------------------------Eat-----------------------------   
  boolean eat()
  {
    if(target != null)
    {
      if(location.dist(target.location) < size)
      {
        // nutrition();
        //energy += target.NutritiousValue;
        energy +=50;
        println(energy);
        return true;
      }
    }
    return false;
  }

//-----------------------------Seek----------------------------- 
  void seek()
  {
    // Randomise X velocity

    PVector dir = new PVector(0,0);
    dir.x = noise(xoff.x, xoff.y);
    xoff.x += 0.002;
    yoff.y += 0.002;
    
    if(dir.x < 0.5)
    {
     dir.x *= -1;
    }
 
    // Randomise Y velocity
    dir.y = noise(yoff.x, yoff.y);
    yoff.x+= 0.005;
    yoff.y += 0.005;
     
    if(dir.y < 0.5)
    {
      dir.y *= -1;
    }
    // Make it a bit faster

    dir.mult(speed*gameTime);
    dir.limit(speed*gameTime);
    
    
    // Add Velocity
    
    location.add(dir);
  }
  
  //---------------------Check Edges for loop around--------------------------
  void checkEdges()
  {
    
    if(location.x < -size)
    {      
      location.x = width + size;      
    }
    
    if(location.x > width + size)
    {
      location.x = -size; 
    }
    
    if(location.y < -size)
    {      
      location.y = height + size;      
    }
    
    if(location.y > height + size)
    {
      location.y = -size; 
    }
  }
  
  
}
