class BezierCubic{
  
  private List<Vector> puntos;
  
  public BezierCubic(List<Vector> puntos){
    this.puntos = puntos;
  }
  
  public void pintar(){
    float ppx, ppy, ppz;
    float upx, upy, upz; 
    Vector auxPunto;
    
    auxPunto = puntos.get(0);
    ppx = auxPunto.x();
    ppy = auxPunto.y();
    ppz = auxPunto.z();
    
    int n = puntos.size() - 1;
    
    for(int i = 0; i <= n-3; i+=3){
      
      for(float t = 0.0; t < 1; t += 0.01){
        upx = pow(1 - t, 3) * puntos.get(i).x() + 3 * t * pow(1 - t, 2) * puntos.get(i + 1).x() + 3 * pow(t, 2) * (1 - t) * puntos.get(i + 2).x() + pow(t, 3) * puntos.get(i + 3).x();
        upy = pow(1 - t, 3) * puntos.get(i).y() + 3 * t * pow(1 - t, 2) * puntos.get(i + 1).y() + 3 * pow(t, 2) * (1 - t) * puntos.get(i + 2).y() + pow(t, 3) * puntos.get(i + 3).y();
        upz = pow(1 - t, 3) * puntos.get(i).z() + 3 * t * pow(1 - t, 2) * puntos.get(i + 1).z() + 3 * pow(t, 2) * (1 - t) * puntos.get(i + 2).z() + pow(t, 3) * puntos.get(i + 3).z();
        stroke(0,0,255);
        line(ppx, ppy, ppz, upx, upy, upz);
        ppx = upx;
        ppy = upy;
        ppz = upz;
      }
    }
  }

}
