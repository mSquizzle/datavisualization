class Node{
  int id, id_connect, mass, x, y;
  List<Edge>connected_nodes = new ArrayList<Edge>();
  //list of connected nodes ids
  //how should we do spring values then?
  
  public Node(int a, int b, int c, int d, int e){
      id = a;
      mass = b;
      x = c;
      y = d;
      id_connect = e;
  }
  
  public Node(int a, int b, int c, int d){
      id = a;
      mass = b;
      x = c;
      y = d;
  }
  
  public Node() {
    
  }
}