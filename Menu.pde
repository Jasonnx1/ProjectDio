
class Menu
{
    

  
  
   Menu()
   {
     
     
   }
   
     
   void display(int nOrgs, int nFoods)
   {
      background(100);
      textSize(20);
      text("Number of starting Organisms: " + str(nOrgs), 400,50);
      text("Number of starting Food: " + str(nFoods), 400,100);
      textSize(45);
      text("Press ENTER to begin", 400, height/2);  
   }
  
}
