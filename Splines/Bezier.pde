import java.util.List;

class Bezier{
  
  private List<Vector> puntos;
  
  public Bezier(List<Vector> puntos){
    this.puntos = puntos;
  }
  
  public void pintar(){
    int n = puntos.size();
    Vector aux = null;
    Vector point = puntos.get(0);
    
    for(float t=0; t<=1; t+=0.01){
      aux = new Vector(0, 0, 0);
      for (int i=0; i<n; i++){
        aux.add (Vector.multiply(puntos.get(i), combinatoria(n,i) * pow(t, i) * pow(1-t, n-i)));
      }
      stroke(255,255,255);
      line(point.x(),point.y(),point.z(),aux.x(),aux.y(),aux.z());
      point = aux;
    }
  }
  
   private float combinatoria(int n,int p){
     float numerador = factorial(n);
     float denominador = factorial(p) * factorial(n-p);
     return numerador / denominador;
  }
  
  private int factorial(int n) {
    int factorial = 1;
    while ( n!=0) {
      factorial=factorial*n;
      n--;
    }
    return factorial;
  }
  
}
