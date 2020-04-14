int previousTime;
int deltaTime;
int currentTime;
Organism org;
ArrayList<Organism> orgs, deadOrgs, newOrgs;
FoodFactory ff;
boolean pause;
boolean fastForward;

void setup()
{
  fullScreen(P2D);
  currentTime = millis();
  previousTime = millis();
  
  pause = false;
  fastForward = false;
  
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
  if(!pause)
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
   
      
      if(o.energy<=0)
      {
        deadOrgs.add(o);
      }
      else if(o.energy > int(o.size*30))
      {
        newOrgs.add(new Organism(o));
        o.energy = int(o.size*10);
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
    }
    newOrgs.clear();
  
    
    for(Food f : ff.foods)
    {
      f.update(deltatime);
    }
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

void changeGameTime()
{
  if(!fastForward) 
  {
    ff.gameTime = 100;
    for(Organism o : orgs)
    {
      o.gameTime = 100;
    }
    fastForward = true;
  }
  else 
  {
    ff.gameTime = 1;
    for(Organism o : orgs)
    {
      o.gameTime = 1;
    }
    fastForward = false;
  }
}

void keyPressed()
{
  switch(key)
  {
   case 'r':   setup();
    break;
    
    case ' ':   
      if(!pause) pause = true;
      else pause = false;
    break;
    
    case 'q':  changeGameTime(); 
    break;
  }

}
