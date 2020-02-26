abstract class Object {
  
PVector location;
PVector velocity;
PVector acceleration;

color fillColor = color (255);
color strokeColor = color (0);
int strokeWeight = 1;



abstract void update(float deltaTime);

 abstract void display();

 
  
}
