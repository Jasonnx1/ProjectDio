int previousTime;
int deltaTime;
int currentTime;
Organism org;
ArrayList<Organism> orgs;
FoodFactory ff;

void setup()
{
  size(800, 600);
  currentTime = millis();
  previousTime = millis();
  ff = new FoodFactory();
  ff.foods = new ArrayList<Food>();
  ff.foods.add(new Food(150,150));
  ff.foods.add(new Food(350,350));
  ff.foods.add(new Food(130,130));
  orgs = new ArrayList<Organism>();
  orgs.add(new Organism( random(0, width), random(0, height)));
  orgs.add(new Organism( random(0, width), random(0, height)));
    orgs.add(new Organism( random(0, width), random(0, height)));
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
  ff.update(deltatime);
  
  for(Organism o : orgs)
  {
    
    o.findFood(ff.foods);
    o.update(deltatime);
    
    if(o.eat())
    {
      ff.foods.remove(o.target);
      o.target = null;      
    }
    
  }

  
  for(Food f : ff.foods)
  {
    f.update(deltatime);
  }
}

void display()
{
  background(#3BBF32);
  
  
  for(Organism o : orgs)
  {
    o.display();
  }
  
  for(Food f : ff.foods)
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
