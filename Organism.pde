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

  
  Organism(float x, float y)
  {
     location = new PVector(x,y);
     noiseSeed( (long)random(0, 1000000) );
     speed = 2;
     range = 150;
     size = 10;
     energy = 1000;
  }
  
  void update(float deltaTime)
  {
    
    timer += deltaTime;
    if(timer > 1000)
    {
     
      energy -= size*speed;
      timer = 0;
      
    }
    
    
    if(target != null)
    {
      PVector _target = new PVector();
      _target = target.location.copy();
      PVector dir = _target.sub(location);
      dir.limit(speed);
      location.add(dir);
    }
    else
    {
      seek();
    }
    
    if(location.x < size)
    location .x = size;
    
    if (location.y < size)
    location.y = size;
    
    if(location.x > width - size)
    location.x = width - size;
    
    if(location.y > height - size)
    location.y = height - size;
    
  }
  
  void display()
  {
    fill(0,255,0,0);
    stroke(100,100,255);
    ellipse(location.x, location.y, range*2, range*2);
    fill(fillColor);
    stroke(strokeColor);
    ellipse(location.x, location.y, size*2, size*2);
    fill(0);
    text(energy, location.x-10, location.y-10);
  }
  
  void findFood(ArrayList<Food> fL)
  {
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
  
  
  boolean eat()
  {
    if(target != null)
    {
      if(location.dist(target.location) < 5)
      {
        // nutrition();
        energy += target.NutritiousValue;
        println(energy);
        return true;
      }
    }
    return false;
  }
  
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

    dir.mult(speed);
    dir.limit(speed);
    // Add Velocity
    
    location.add(dir);
  
    
    
    
  }
}
