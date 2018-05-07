public class HermiteSpline{
  /*
  El siguiente codigo se encuentra basado en https://blog.demofox.org/2015/08/08/cubic-hermite-interpolation/
  con su adaptación para processing y adaptandolo para 3 dimenisones
  */
   ArrayList<Vector> points; 
   int n;
   HermiteSpline(ArrayList<Vector> points){
     this.points = points;
     this.n  = points.size();
   }
   float cubicHermite(float ai, float bi, float ci, float di, float t){
    float a = -ai/2.0 + (3.0f*bi)/2.0 - (3.0*ci)/2.0 + di/2.0;
    float b = ai - (5.0*bi)/2.0 + 2.0*ci - di / 2.0;
    float c = -ai/2.0 + ci/2.0;
    float d = bi;  
    return a*t*t*t + b*t*t + c*t + d;     
   }
   Vector getIndexClamped(int index){
    if(index<0){
      return this.points.get(0);  
    }else if ( index >= this.n){
      return this.points.get(this.n-1); 
    }else{
      return this.points.get(index); 
    }
   }
   void pintar(){
     float lastX = this.points.get(0).x();
     float lastY = this.points.get(0).y();
     float lastZ = this.points.get(0).z();
     for(int i=1; i<this.n*20;i++){
      float percent = (float)i / ((this.n*20)-1);
      float tx = (this.n-1)* percent;
      int index = int(tx);
      float t = tx - floor(tx);
      Vector A,B,C,D;
      A=getIndexClamped(index-1);
      B=getIndexClamped(index);
      C=getIndexClamped(index+1);
      D=getIndexClamped(index+2);
      float x,y,z;
      x=cubicHermite(A.x(),B.x(),C.x(),D.x(),t);
      y=cubicHermite(A.y(),B.y(),C.y(),D.y(),t);
      z=cubicHermite(A.z(),B.z(),C.z(),D.z(),t);
      stroke(255,255,255);
      line(lastX,lastY,lastZ,x,y,z);
      lastX = x;
      lastY = y;
      lastZ = z;
     }
   }
}
