MySQL mysql;

String dbHostID = "oege.ie.hva.nl";    // "127.0.0.1";    // ip address, domain or hostname such as localhost 
String dbUsername = "weelded";         // "root";
String dbUserPass = "+/TcwAKG9#Xch9";  //"";
String dbSchema = "zweelded";          //"assignment"

void createDatabaseConnection() {   
  if (localHost) {
    dbHostID = "127.0.0.1";    // ip address, domain or hostname such as localhost 
    dbUsername = "root";
    dbUserPass = "";
    dbSchema = "assignment";
  }
  mysql = new MySQL(this, dbHostID, dbSchema, dbUsername, dbUserPass);
  //queries.getStats();
} 
