class Details {
  
  String planetName = new String();
  String planetStatus = new String();
  String planetDiscription = new String();
  String planetDistance = new String();
  String planetInhabitants = new String();
  String [] fullDetails = {planetName,planetStatus,planetDiscription,planetDistance,planetInhabitants};
  
  String [] mercury(){
      fullDetails[0] = "Mercury";
      fullDetails[1] = "Un-Explored";
      fullDetails[2] = "Developted";
      fullDetails[3] = "1.2 parsecs";
      fullDetails[4] = "Unknown";
      
      return fullDetails;
  
  }
  String [] venus(){
      fullDetails[0] = "Venus";
      fullDetails[1] = "Explored";
      fullDetails[2] = "Developted";
      fullDetails[3] = "8.6 parsecs";
      fullDetails[4] = "7 Million";
      
      return fullDetails;
  }
  
  String [] earth(){
    fullDetails[0] = "Earth";
    fullDetails[1] = "Inhabited";
    fullDetails[2] = "Full of life";
    fullDetails[3] = "8.6 parsecs";
    fullDetails[4] = "7 Million Inhabitants";
    
    return fullDetails;
  }

  String [] mars(){
      fullDetails[0] = "Mars";
      fullDetails[1] = "Explored";
      fullDetails[2] = "Exploration required";
      fullDetails[3] = "2.45 parsecs";
      fullDetails[4] = "1 Inhabitant";
      
      return fullDetails;
  }
  String [] jupiter(){
      fullDetails[0] = "Jupiter";
      fullDetails[1] = "Un-Explored";
      fullDetails[2] = "Violent Weather";
      fullDetails[3] = "12.6 parsecs";
      fullDetails[4] = "No Inhanitants";
      
      return fullDetails;
  }
  String [] saturn(){
      fullDetails[0] = "Saturn";
      fullDetails[1] = "Queued for Exploration";
      fullDetails[2] = "Dangerous Rings";
      fullDetails[3] = "8.6 parsecs";
      fullDetails[4] = "No Inhanitants";
      
      return fullDetails;
  }
  String [] uranus(){
      fullDetails[0] = "Uranus";
      fullDetails[1] = "Super hot fire";
      fullDetails[2] = "Gassy";
      fullDetails[3] = "10.2 parsecs";
      fullDetails[4] = "No Inhanitants";
      
      return fullDetails;
  }
  String [] neptune(){
      fullDetails[0] = "Neptune";
      fullDetails[1] = "Ice Planet";
      fullDetails[2] = "Too cold for details";
      fullDetails[3] = "12.6 parsecs";
      fullDetails[4] = "No Inhanitants";
      
      return fullDetails;
  }
  

}