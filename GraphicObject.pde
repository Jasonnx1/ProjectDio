abstract class Object {
  
PVector location;
PVector velocity;
PVector acceleration;

color fillColor = color (255);
color strokeColor = color (255);
color strokeWeight = 1;



abstract void update(float deltaTime);

 abstract void display();

 
  
}
