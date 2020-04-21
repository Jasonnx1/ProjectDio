class Terrain
{
  
  color background;
  float foodRate;
  
  
  Terrain(color c, float _foodRate)
  {
    foodRate = _foodRate;
    background = c; 
  }
  
  void display()
  {
   
    background(background);
    
  }
  
  
}
