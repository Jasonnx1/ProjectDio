class Organism extends Object
{
  Food target;
  
  Organism(int x, int y)
  {
    location = new PVector(x,y);
  }
  
  void update(float deltaTime)
  {
    if(target != null)
    {
      location.x = lerp(location.x, target.location.x, 0.05);
      location.y = lerp(location.y, target.location.y, 0.05);
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
    
  }
}
