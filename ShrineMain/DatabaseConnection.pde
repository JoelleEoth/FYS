MySQL mysql;

String dbHostID = "oege.ie.hva.nl";    // ip address, domain or hostname such as localhost 
String dbUsername = "weelded";
String dbUserPass = "+/TcwAKG9#Xch9";
String dbSchema = "zweelded";  

void createDatabaseConnection() {   
  mysql = new MySQL(this, dbHostID, dbSchema, dbUsername, dbUserPass);
  //queries.getStats();
} 
