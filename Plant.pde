class Plant extends Object
{
  int NutritiousValue = 50;
  int CollectionTime = 10;
  
  Plant(float x, float y)
  {
    location = new PVector(x,y);
    fillColor = color(50,255,50);
  }
  
  void update(float deltaTime)
  {
    
    
  }
  
  void display()
  {
    fill(fillColor);
    ellipse(location.x, location.y, 10,10);
  }
  
}
