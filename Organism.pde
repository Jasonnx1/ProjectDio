class Organism extends Object
{
  Food target;
  PVector xoff = new PVector(0,0);
  PVector yoff = new PVector(0,0);
  float speed;
  float range;
  float size;
  int energy;
  float timer = 0;
  long seed;
  
  int mutationFactor, mutationRoll;
  int mutationChance = 1;
  int r,g,b;

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
  }
  
  void checkEdges()
  {
    
    //---------------------Check Edges for loop around--------------------------
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
     
     gameTime = parent.gameTime;
     fillColor = color(r,g,b);
     energy = int(size*10);
  }
  
  
  
  
//=============================Update=============================
  
  void update(float deltaTime)
  {
    
    noiseSeed(seed);
    
    timer += deltaTime;
    if(timer > 1000)
    {
     
      energy -= (size/2)*speed*gameTime;
      timer = 0;
      
    }
 
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
    text(energy, location.x-10, location.y-10);
  }



//=============================Functions=============================  

//-----------------------------Find Food----------------------------- 
  void findFood(ArrayList<Food> fL)
  {
    
    target = null;
    
    for(Food f : fL)
    {
  
      if(location.dist(f.location) < range)
      {
  
        if(target == null) 
        {
          target = f;
          target.fillColor = color(255,0,0);
        }
        else if(location.dist(f.location) < location.dist(target.location))
        {
          
          target.fillColor = color(0,0,255);
          target = f;
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
        energy += target.NutritiousValue;
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
  
  
}
