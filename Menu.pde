import processing.sound.*;

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
     
     buttons.add( new Button(new PVector(width/2 - width/10,height/2 - height/10), 25, 2, 5) );
     buttons.add( new Button(new PVector(width/2 + width/10,height/2 - height/10), 25, -2, 6) );
     
     
     buttons.add( new Button(new PVector(width/2 + 100,600), 25, 0.1, 7) );
     buttons.add( new Button(new PVector(width/2 - 100,600), 25, -0.1, 8) );
     
     buttons.add( new Button(new PVector(width/2 + 100,650), 25, 0.1, 9) );
     buttons.add( new Button(new PVector(width/2 - 100,650), 25, -0.1, 10) );
     
     buttons.add( new Button(new PVector(width/2 + 100,700), 25, 0.1, 11) );
     buttons.add( new Button(new PVector(width/2 - 100,700), 25, -0.1, 12) );
     
     background = loadImage("images/background.jpg");
     background.resize(width, height);
     
     terrainChoice = 0;
     
     
   }
   
     // ----- DISPLAY -----
   void display(int nOrgs, int nPlants, int id, float baseSpeed, float baseSize, int baseRange)
   {
     
     
     
     switch(id)
     {
      
       case 1:
                  
                  
                  background(background);
                  textSize(20);
                  text("Number of starting Organisms: " + str(nOrgs), 200,160);
                  text("Number of starting Plant: " + str(nPlants), 1000,160);
                  text("Speed:" + str(baseSpeed), width/2, 600);
                  text("Size:" + str(baseSize),  width/2, 650);
                  text("Range:" + str(baseRange),  width/2, 700);
                  textSize(45);
                  text("Press ENTER to begin", width/2, height/2 - height/200);  
                  
                  for(Button b : buttons)
                  {
                   
                    b.display();
                    
                  }
                  
                  switch(terrainChoice)
                  {   
                      case 0: text("Forest", width/2, height/2 - height/10);
                      break;
                      
                      case 1: text("Plains", width/2, height/2 - height/10);
                      break;
                      
                      case 2: text("Mountains", width/2, height/2 - height/10);
                      break;
                      
                      case 3: text("Tundra", width/2, height/2 - height/10);
                      break;
                  }
       break;
       
       case 2:
               
               text("PAUSE MENU", width/2, height/4);
               
               text("Return to Main Menu: M", width/2, height/2);
               text("Reset: R", width/2, height/2 + height/8);
               
       
       break;
       
     }
     
      
   }
   
   
   void checkMouse(PVector mouse)
   {
     
     for(Button b : buttons)
     {
       
       if( (mouse.x < b.loc.x + b.size/2) && (mouse.x > b.loc.x-b.size/2) && (mouse.y < b.loc.y + b.size/2) && (mouse.y > b.loc.y - b.size/2)  )
       {            
             b.c = color(#FF71F1);            
       }
       else
       {
          b.c = color(255); 
       }
       
     }
 
   }
  

   
   
   // Returns button id to associate with a command
   int checkClick(PVector mouse)
   {
     
     for(Button b : buttons)
     {
       
       if( (mouse.x < b.loc.x + b.size/2) && (mouse.x > b.loc.x-b.size/2) && (mouse.y < b.loc.y + b.size/2) && (mouse.y > b.loc.y - b.size/2)  )
       {            
             return b.id;             
       }
       
       
     }
     
     return 0;
     
    
     
   }
  
}
