class Spotter{
 float x,y;
 float checkX, checkY;
 Car car;
 
 Spotter(Car _car){
   car = _car;
   
   x = car.x;
   y = car.y;
   
   checkX = x + (25 * (car.speed/5));
   checkY = y + (25 * (car.speed/5));
   
   
 } 
 
 
 void checkCar(Car oCar){
   if(oCar.x > x && oCar.x < checkX)
     car.speed -= 0.25;
   if(oCar.y > y &&  oCar.y < checkY)
     car.speed -= 0.25;
 }

  void display(){
    line(x,y,checkX,checkY);
  }
}
