class Organism extends Object
{
  Food target;
  PVector xoff = new PVector(0,0);
  PVector yoff = new PVector(0,0);
  float speed = 1.0;

  
  Organism(int x, int y)
  {
    location = new PVector(x,y);
     noiseSeed( millis() );
  }
  
  void update(float deltaTime)
  {
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
  }
  
  void display()
  {
    fill(0,255,0,0);
    stroke(100,100,255);
    ellipse(location.x, location.y, 150,150);
    fill(fillColor);
    stroke(strokeColor);
    ellipse(location.x, location.y, 20,20);
  }
  
  void findFood(ArrayList<Food> fL)
  {
    for(Food f : fL)
    {
      if(location.dist(f.location) < 75)
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
  
  void getFood()
  {
    
  }
  
  boolean eat()
  {
    if(target != null)
    {
      if(location.dist(target.location) < 5)
      {
        // nutrition();
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

    println(dir.x + " , " + dir.y);
    dir.limit(speed);
    // Add Velocity
    
    location.add(dir);
  
    
    
    
  }
}
