public class FoodFactory
{
 ArrayList<Food> foods;
 float timer = 0;
 int gameTime = 1;
 
 
 FoodFactory()
 {
  
  foods = new ArrayList<Food>(); 
   
 }
 
 void update(float deltaTime)
 {
   
   timer += deltaTime;
   if(timer > 250/gameTime)
   {
    timer = 0;
    foods.add( new Food(random(10, width - 10), random(10, height - 10) ) );
     
   }
   
 }
  
}
