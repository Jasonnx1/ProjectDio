int previousTime;
int deltaTime;
int currentTime;

void setup()
{
  size(640, 480);
  currentTime = millis();
  previousTime = millis();
}


void draw()
{
  currentTime = millis();
  deltaTime = currentTime - previousTime;
 
  update(deltaTime);
  display();
  
  previousTime = currentTime;
}

void update(int deltatime)
{
  
  
}

void display()

{
  
  
}
