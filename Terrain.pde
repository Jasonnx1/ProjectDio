class Terrain
{
  
  color background;
  float foodRate;
  float moveDiff;
  
  
  Terrain(color c, float _foodRate, float _moveDiff)
  {
    foodRate = _foodRate;
    background = c; 
    moveDiff = _moveDiff;
    
  }
  
  void display()
  {
    background(background); 
  }
  
  
}
