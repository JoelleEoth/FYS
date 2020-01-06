/* Door Vivienne
Dit tekent de achtergrond en zorgt ervoor dat het loopt*/


//deze functie kopieert een verticale lijn van de achtergrond naar een ander plek
void loopBackground(){
  int bgX = frameCount % bgImg.width;
  for( int i = -bgX; i< width; i += bgImg.width){
    copy(bgImg, 0, 0, bgImg.width, height, i, 0, bgImg.width, height);
  }
  
}
