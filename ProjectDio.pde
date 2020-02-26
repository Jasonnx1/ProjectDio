int previousTime;
int deltaTime;
int currentTime;
Organism org;
ArrayList<Food> foodList;

void setup()
{
  size(640, 480);
  currentTime = millis();
  previousTime = millis();
  
  foodList = new ArrayList<Food>();
  foodList.add(new Food(150,150));
  foodList.add(new Food(350,350));
  foodList.add(new Food(130,130));
  org = new Organism(100,100);
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
  org.update(deltatime);
  org.findFood(foodList);
  if(org.eat())
  {
    foodList.remove(org.target);
    org.target = null;
  }
  
  for(Food f : foodList)
  {
    f.update(deltatime);
  }
}

void display()
{
  background(#3BBF32);
  
  org.display();
  
  for(Food f : foodList)
  {
    f.display();
  }
}

void keyPressed()
{
  switch(key)
  {
   case 'r':   setup();
    break;
  }

}
