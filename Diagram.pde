class Diagram {
  
  List<Node>node_list = new ArrayList<Node>();
  color node_color = #FFFFFF;
  
  void drawDiagram(){
      drawNodes();
      //draw edges
  }
  
  void drawNodes() {
      for(int i = 0; i < node_list.size(); i++){   
        Node node = node_list.get(i);
        int radius = node.mass * 50; //should be proportional to screen size
        fill(colorPicker(node));
        ellipse(node.x, node.y, radius, radius);
        showLabel(node);
      }
  }
  
  boolean nodeExists(int search_id){
    for(int i = 0; i < node_list.size(); i++){
      if(node_list.get(i).id == search_id)
        return true;
    }
    return false;
  }
  
  
  boolean mouseHover(Node node) {
    if(dist(mouseX, mouseY, node.x, node.y) <= (node.mass * 50)/2){
         return true; 
    }
       return false;
  }
  
  void showLabel(Node node) {
    if(mouseHover(node)){
        fill(#000000);
        text("ID: " + node.id + "\nMass: " + node.mass, node.x, node.y);
    } 
  }
  
  
  color colorPicker(Node node) {
    if(mouseHover(node)){
            node_color = #cc7c7c; //pink
        } else {
            node_color = #FFFFFF;
        }
    return node_color;
  }

  void createEdges(String[] data){
    int checkpoint = Integer.parseInt(data[0]) + 2; //start of second half of data
    for(int j = checkpoint; j < data.length; j++) {
      String[] line = split(data[j], ","); 
      int id = Integer.parseInt(line[0]);
      int connect_id = Integer.parseInt(line[1]);
      int length = Integer.parseInt(line[2]);
      //add edge to node_list[node @ id] 
    }
  }
}