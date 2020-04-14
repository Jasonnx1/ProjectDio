int previousTime;
int deltaTime;
int currentTime;
Organism org;
ArrayList<Organism> orgs, deadOrgs, newOrgs;
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
  deadOrgs = new ArrayList<Organism>();
  newOrgs = new ArrayList<Organism>();
  orgs.add(new Organism());
  orgs.add(new Organism());
  orgs.add(new Organism());
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
    
    if(o.energy<0)
    {
      deadOrgs.add(o);
    }
    else if(o.energy > int(o.speed*o.size*15))
    {
      newOrgs.add(new Organism(o));
      o.energy = int(o.speed*o.size*5);
    }
  }
  
  for(Organism dO : deadOrgs)
  {
    orgs.remove(dO);
  }
  deadOrgs.clear();
  
  for(Organism nO : newOrgs)
  {
    orgs.add(nO);
    nO.energy -= int(nO.speed*nO.size*5);
  }
  newOrgs.clear();

  
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
