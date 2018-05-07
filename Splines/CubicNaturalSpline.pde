public class CubicNaturalSpline{
  // El siguiente codigo se basa en http://www.inf-cr.uclm.es/www/cglez/downloads/docencia/AC/splines.pdf
  // se usan las definiciones matematicas planteadas en el documento
  ArrayList<Vector> points;
  int n;
  /* this arrays save coefficients of equation
     position 0 = a, 1 = b, 2 = c, 3 = d;
  */
  float[][] coefX,coefY,coefZ;
  float[] derivate, gamma, omega;
  CubicNaturalSpline(ArrayList<Vector> points){
    this.points= points;
    this.n = points.size();    
    this.derivate = new float[points.size()];
    this.gamma = new float[points.size()];
    this.omega = new float[points.size()];     
    calcular();
  }
  void calcularGamma(){
    this.gamma[0]=0.5;
    for(int i = 1; i<this.n-1;++i){
       this.gamma[i]=1.0/(4.0-this.gamma[i-1]);
    }
    this.gamma[this.n-1]= 1.0/(2.0-this.gamma[this.n-2]);
  }
  void calcularOmegaAndDerivate(ArrayList<Float> pComponent){
    this.omega[0] = 3.0 * (pComponent.get(1)-pComponent.get(0))*this.gamma[0];
    for(int  i = 1; i< this.n-1; ++i){
     this.omega[i] = (3.0*(pComponent.get(i+1)-pComponent.get(i-1))-this.omega[i-1])*this.gamma[i];
    }
    this.omega[this.n-1] = (3.0*(pComponent.get(this.n-1)-pComponent.get(this.n-2))-this.omega[this.n-2])*this.gamma[this.n-1];
    this.derivate[this.n-1]=this.omega[this.n-1];
    for(int i=this.n-2;i>=0;--i){
     this.derivate[i]=this.omega[i]-this.gamma[i]*this.derivate[i+1]; 
    }
  }
  float[][] calcCoef(ArrayList<Float> pComponent){
    float[][] coef= new float[this.n][4];
    for(int i = 0; i<this.n-1;++i){
       coef[i][0] = pComponent.get(i);
       coef[i][1] = this.derivate[i];
       coef[i][2] = 3.0 * (pComponent.get(i+1)-pComponent.get(i))-this.derivate[i+1]-2.0*this.derivate[i];
       coef[i][3] = 2.0 * (pComponent.get(i)-pComponent.get(i+1))+this.derivate[i]+this.derivate[i+1];
    }
    return coef;
  }
  void calcular(){
    calcularGamma();
    ArrayList<Float> xTmp = new ArrayList<Float>();
    ArrayList<Float> yTmp = new ArrayList<Float>();
    ArrayList<Float> zTmp = new ArrayList<Float>();
    for(Vector v: this.points){
       xTmp.add(new Float(v.x()));
       yTmp.add(new Float(v.y()));
       zTmp.add(new Float(v.z()));
    }
    calcularOmegaAndDerivate(xTmp);
    this.coefX = calcCoef(xTmp);
    calcularOmegaAndDerivate(yTmp);
    this.coefY = calcCoef(yTmp);
    calcularOmegaAndDerivate(zTmp);
    this.coefZ=calcCoef(zTmp);
  }
  void pintar(){
    float dt=1.0/20.0;
    float lastX = this.points.get(0).x();
    float lastY = this.points.get(0).y();
    float lastZ = this.points.get(0).z();
    float deltaX,deltaY,deltaZ;
    for(int i =0;i<this.n-1;++i){
      for(int j = 1; j<20;j++){
        float t = dt * (float) j;
        deltaX=this.coefX[i][0]+this.coefX[i][1]*t+this.coefX[i][2]*t*t+this.coefX[i][3]*t*t*t;
        deltaY=this.coefY[i][0]+this.coefY[i][1]*t+this.coefY[i][2]*t*t+this.coefY[i][3]*t*t*t;
        deltaZ=this.coefZ[i][0]+this.coefZ[i][1]*t+this.coefZ[i][2]*t*t+this.coefZ[i][3]*t*t*t;
        stroke(255,255,255);
        line(lastX,lastY,lastZ,deltaX,deltaY,deltaZ);
        lastX = deltaX;
        lastY = deltaY;
        lastZ = deltaZ;
      }      
    }
    
  }
}
