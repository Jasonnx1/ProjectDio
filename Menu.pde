
class Menu
{
    

  ArrayList<Button> buttons;
  PImage background;
  int terrainChoice;
  
  // ---- CTOR ----
   Menu()
   {
     buttons = new ArrayList<Button>();
     
     buttons.add( new Button(new PVector(200,100), 25, 1, 1) );
     buttons.add( new Button(new PVector(200,200), 25, -1, 2) );
     
     buttons.add( new Button(new PVector(1000,100), 25, 1, 3) );
     buttons.add( new Button(new PVector(1000,200), 25, -1, 4) );
     
     buttons.add( new Button(new PVector(width/2 - width/20,height/2 - height/10), 25, 2, 5) );
     buttons.add( new Button(new PVector(width/2 + width/20,height/2 - height/10), 25, -2, 6) );
     
     background = loadImage("images/background.jpg");
     background.resize(width, height);
     
     terrainChoice = 0;
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
      
      switch(terrainChoice)
      {   
          case 0: text("Forest", width/2 - width/50, height/2 - height/10);
          break;
          
          case 1: text("Plains", width/2 - width/50, height/2 - height/10);
          break;
          
          case 2: text("Mountains", width/2 - width/50, height/2 - height/10);
          break;
          
          case 3: text("Tundra", width/2 - width/50, height/2 - height/10);
          break;
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
