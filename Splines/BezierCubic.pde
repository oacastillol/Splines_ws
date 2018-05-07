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
        println("ppp "+ppx+" "+ppy+" "+ppz);
        println("upp "+upx+" "+upy+" "+upz);
        stroke(0,0,255);
        line(ppx, ppy, ppz, upx, upy, upz);
        ppx = upx;
        ppy = upy;
        ppz = upz;
      }
    }
  }

}
/*

void Bezier3(){
    float pxf;
    float pyf;
    float pzf;
    
    float pxi = (puntos.get(0).x()+4*puntos.get(1).x()+puntos.get(2).x())/6;
    float pyi = (puntos.get(0).y()+4*puntos.get(1).y()+puntos.get(2).y())/6;
    float pzi = (puntos.get(0).z()+4*puntos.get(1).z()+puntos.get(2).z())/6;

    int n = puntos.size()-1;
        for(int i=0;i<=n-3;i++)
        {
          
          for(float t=0;t<=1;t=t+0.01)
          {
            float f1x=-puntos.get(i).x()+3*puntos.get(i+1).x()-3*puntos.get(i+2).x()+puntos.get(i+3).x();
            float f2x=3*puntos.get(i).x()-6*puntos.get(i+1).x()+3*puntos.get(i+2).x();
            float f3x=-3*puntos.get(i).x()+3*puntos.get(i+2).x();
            float f4x=puntos.get(i).x()+4*puntos.get(i+1).x()+puntos.get(i+2).x();
            pxf=(pow(t,3)*(f1x)+pow(t,2)*(f2x)+pow(t,1)*(f3x)+1*(f4x))/6;
            
            
            float f1y=-puntos.get(i).y()+3*puntos.get(i+1).y()-3*puntos.get(i+2).y()+puntos.get(i+3).y();
            float f2y=3*puntos.get(i).y()-6*puntos.get(i+1).y()+3*puntos.get(i+2).y();
            float f3y=-3*puntos.get(i).y()+3*puntos.get(i+2).y();
            float f4y=puntos.get(i).y()+4*puntos.get(i+1).y()+puntos.get(i+2).y();
            pyf=(pow(t,3)*(f1y)+pow(t,2)*(f2y)+pow(t,1)*(f3y)+1*(f4y))/6;
            
            
            float f1z=-puntos.get(i).z()+3*puntos.get(i+1).z()-3*puntos.get(i+2).z()+puntos.get(i+3).z();
            float f2z=3*puntos.get(i).z()-6*puntos.get(i+1).z()+3*puntos.get(i+2).z();
            float f3z=-3*puntos.get(i).z()+3*puntos.get(i+2).z();
            float f4z=puntos.get(i).z()+4*puntos.get(i+1).z()+puntos.get(i+2).z();
            pzf=(pow(t,3)*(f1z)+pow(t,2)*(f2z)+pow(t,1)*(f3z)+1*(f4z))/6;
            
            line(pxi,pyi,pzi,pxf,pyf,pzf);

            pxi=pxf;
            pyi=pyf;
            pzi=pzf;
          }
          
        } 
}*/
