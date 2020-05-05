class Button
{
  float increment;
  PVector loc;
  int size;
  int id;
  color c = color(255);
  
  Button(PVector _loc, int _size, float _increment, int _id)
  {
    loc = _loc;
    size = _size;  
    increment = _increment;
    id = _id;
  }
 
  
  void display()
  {
    
    fill(c);
    rectMode(CENTER);
    rect(loc.x, loc.y, size, size);
    
    
    textSize(20);
    fill(0);
    if(increment == -1 || increment == -0.1)
    {
       text("-", loc.x, loc.y+7); 
    }
    else if(increment == 1 || increment == 0.1)
    {
      text("+", loc.x, loc.y+7);
    }
    else if(increment == 2)
    {
      text("<", loc.x, loc.y+7);
    }
    else if(increment == -2)
    {
      text(">", loc.x, loc.y+7);
    }
   
    
  }
  
}
