class Plant extends Food
{
  int NutritiousValue;
  int CollectionTime;
  
  Plant(float x, float y)
  {
    location = new PVector(x,y);
    fillColor = color(50,255,50);
    NutritiousValue = 50;
    CollectionTime = 10;
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
