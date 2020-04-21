public class PlantFactory
{
 ArrayList<Plant> plants;
 float timer = 0;
 int gameTime = 1;
 float foodRate;
 
 PlantFactory(float _foodRate)
 {
  foodRate = _foodRate;
  plants = new ArrayList<Plant>(); 
   
 }
 
 void update(float deltaTime)
 {
   
   timer += deltaTime;
   if(timer > foodRate/gameTime)
   {
    timer = 0;
    plants.add( new Plant(random(10, width - 10), random(10, height - 10) ) );
     
   }
   
 }
  
}
