class Node{
  int id;
  float mass, x, y, c; //c = coulomb's constant
  ArrayList<Edge> connected_nodes;
  PVector acceleration;
  PVector velocity;
 
PVector getNextVelocity(float timeStep){
  //currentVelocity = integral of (a * dt) 
  PVector aDeltaT = acceleration.mult(timeStep);
  PVector nextVelocity = PVector.add(velocity, aDeltaT);
  return nextVelocity;
}
 
float getNextX(float timeStep){
  //.5 * a (dt)squared + vt + old position
  float acc = .5 * acceleration.x * timeStep * timeStep;
  float vel = velocity.x * timeStep;
  return acc + vel + x;
}

float getNextY(float timeStep){
  float acc = .5 * acceleration.y * timeStep * timeStep;
  float vel = velocity.x * timeStep;
  return acc + vel + y;
}
 
 float getEnergy(){
   //k = .5 * m * v^2
   float velocitySquared = velocity.mag() * velocity.mag();
   float energy = .5 * mass * velocitySquared;
   return energy;
 }
  
 //this shouldn't be in node but diagram I think
 PVector getCoulombForce() {
   PVector c_totalforce = new PVector(); //total attraction/repulsion force
   PVector v1 = new PVector(x, y);//vector of this node
    
   for(int i = 0; i < connected_nodes.size(); i++) {
       Node c_node = connected_nodes.get(i).node;
       PVector v2 = new PVector(c_node.x, c_node.y);
       float d = sq(v1.dist(v2));
       float c = .5; //coulomb's constant;
       float charges = mass * c_node.mass;
       float temp_value = c * (charges/d);
       PVector unitVector = new PVector(); //what would this be? "unit vector between v1, v2"
       unitVector.mult(temp_value);
       c_totalforce.add(unitVector); //adds force to total force
   }
    
   return c_totalforce;
 }
  
PVector getSpringForce() {
   PVector s_totalforce = new PVector(); //total attraction/repulsion force
    
   for(int i = 0; i < connected_nodes.size(); i++) {
       Node c_node = connected_nodes.get(i).node;
       PVector s_force = new PVector(c_node.x, c_node.y);
       float c = .5; //spring constant (we decide);
       s_force.mult(c);
       s_totalforce.add(s_force); //adds force to total force
        
       //should be Fs = -k * length the string stretched (vector)
   }
    
   return s_totalforce;
}
   
 void addEdge(Edge e){
   this.connected_nodes.add(e); 
 }
   
  public Node(int id, int mass, float x, float y){
      this.id = id;
      this.mass = mass;
      this.x = x;
      this.y = y;
      connected_nodes = new ArrayList<Edge>();
      velocity = new PVector();
      acceleration = new PVector();
  }
}