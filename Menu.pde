
class Menu
{
    

  ArrayList<Button> buttons;
  PImage background;
  
  // ---- CTOR ----
   Menu()
   {
     buttons = new ArrayList<Button>();
     
     buttons.add( new Button(new PVector(200,100), 25, 1, 1) );
     buttons.add( new Button(new PVector(200,200), 25, -1, 2) );
     
     buttons.add( new Button(new PVector(1000,100), 25, 1, 3) );
     buttons.add( new Button(new PVector(1000,200), 25, -1, 4) );
     
     background = loadImage("images/background.jpg");
     background.resize(width, height);
     
   }
   
     // ----- DISPLAY -----
   void display(int nOrgs, int nPlants)
   {
      background(background);
      textSize(20);
      text("Number of starting Organisms: " + str(nOrgs), 80,170);
      text("Number of starting Plant: " + str(nPlants), 880,170);
      textSize(45);
      text("Press ENTER to begin", 400, height/2);  
      
      for(Button b : buttons)
      {
       
        b.display();
        
      }
   }
   
   
   // Returns button id to associate with a command
   int checkClick(PVector mouse)
   {
     
     for(Button b : buttons)
     {
       
       if( (mouse.x < b.loc.x + b.size) && (mouse.x > b.loc.x) && (mouse.y < b.loc.y + b.size) && (mouse.y > b.loc.y)  )
       {            
             return b.id;             
       }
       
       
     }
     
     return 0;
     
    
     
   }
  
}
