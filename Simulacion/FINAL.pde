import java.math.RoundingMode;
import java.text.DecimalFormat;


Table table;
int n=50;
int r=20;
int i=0; //index de la tabla
float ballX;
float ballY;
int inicio = 0;

void setup() {
  size(600,600);
  frameRate(20);
  smooth();
  ellipseMode(RADIUS);
  ////Ojo inicio
  //noFill();
  //ellipse(300,300,250,250);
  table = loadTable("DATA3.csv", "header"); //El DATA3 movimiento que no hace caso el mono
  println(table.getRowCount() + " total rows in table");
  
  background(255);
  //Ojo inicio
  noFill();
  ellipse(300,300,200,200);
}

void draw() {
     background(255);
     stroke(0);
     noFill();
     ellipse(300,300,200,200);

      //Leemos datos de la tabla
    //for (TableRow row : table.rows()) {
    //  float speedx = row.getFloat("Vx");
    //  float speedy = row.getFloat("Vy");
    //  float xi = 300 + row.getFloat("Hinicio")*10;
    //  float yi = 300 + row.getFloat("Vinicio")*10;
    //  float xf = 300 +row.getFloat("Hfinal")*10;
    //  float yf = 300 +row.getFloat("Vfinal")*10;
    //  float xt = 300 +row.getFloat("HT")*10;
    //  float yt = 300 +row.getFloat("VT")*10;
    //  println(xi);
      
     
    //  //if(keyPressed) {HACER SIGUIENTE MOVIMIENTO SACADICO}
    //  //Objetivo
    //  fill(255,0,0);//noFill();
    //  ellipse(xt,yt,r,r);
    //  //Inicio
    //  fill(0,0,0);//noFill();
    //  ellipse(xi,yi,r,r);
    //  //Final
    //  fill(0,0,255);//noFill();
    //  ellipse(xf,yf,r,r);
    //}
    
    TableRow row = table.getRow(i);
    if(i<table.getRowCount()){
      float vx = row.getFloat("Vx");
      float vy = row.getFloat("Vy");
      float xi = 300 + row.getFloat("Hinicio")*10;
      float yi = 300 + row.getFloat("Vinicio")*10;
      float xf = 300 +row.getFloat("Hfinal")*10;
      float yf = 300 +row.getFloat("Vfinal")*10;
      float xt = 300 +row.getFloat("HT")*10;
      float yt = 300 +row.getFloat("VT")*10;
      //Trazamos linea de recorrido
      float difx = xi;
      float dify = yi;
      for (float z = 0; z< 50; z+= 1){
        point(difx, dify);
        difx += (xf-xi)/50;
        dify += (yf-yi)/50;
      }
      //Objetivo
      fill(255,0,0);//noFill();
      //ellipse(xt,yt,r,r);//Objetivo target
      ////Inicio
      //fill(0,0,0);//noFill();
      //ellipse(xi,yi,r,r);
        //Final
      fill(0,0,255);//noFill();
      ellipse(xf,yf,r,r);
      if(inicio==0){
        ballX = xi;
        ballY = yi;
        inicio = 1;
      }
      
      if((abs(ballX - xf)+abs(ballY - yf))>5){
        println(vx);
        ball(vx/100,vy/100);
        i++;
      }else{
        fill(0,0,0);//noFill();
        ellipse(xf,yf,r,r);
      }
        
    }
    
      
      
}

void keyPressed(){
  //Si pulsamos tecla  borramos lo anterior y dibujamos siguiente mov sacadico
  //clear();
  //i += 1;
  //ballX = 0;
  //ballY = 0;
  //inicio=0;
}


void ball(float vx, float vy) {
  stroke(0);
  noFill();
  ellipse(300,300,200,200);
  noStroke();
  fill(color(0, 0, 0));
  ellipse(ballX, ballY, r, r);
    //Ojo inicio
  ballX += vx;
  ballY += vy;
}
