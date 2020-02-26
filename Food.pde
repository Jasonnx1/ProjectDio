class Food extends Object
{
  int NutritiousValue = 10;
  int CollectionTime = 10;
  
  Food(int x, int y)
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
