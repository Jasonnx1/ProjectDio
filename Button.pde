class Button
{
  int increment;
  PVector loc;
  int size;
  int id;
  
  Button(PVector _loc, int _size, int _increment, int _id)
  {
    loc = _loc;
    size = _size;  
    increment = _increment;
    id = _id;
  }
 
  
  void display()
  {
    
    fill(255);
    rectMode(CORNER);
    rect(loc.x, loc.y, size, size);
    
    
    textSize(20);
    fill(0);
    if(increment == -1)
    {
       text("-", loc.x+7, loc.y + 19); 
    }
    else
    {
      text("+", loc.x+5, loc.y + 18);
    }
    
  }
  
}
