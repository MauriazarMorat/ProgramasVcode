class User {
  //Defino los atributos
  String email;
  String contrasena;
  String nombre;
  String direccion;
  //Constructor
  User ( 
  this.email,
  this.contrasena,
  this.nombre,
  this.direccion
  );
}
List<User> users = [
    User("Oktubre86@gmail.com","PatricioRey","Ricotero","Almagro"),
    User("marcelotinelli@gmail.com","Showmatch","Marce","Palermo"),
    User("romanotero9@gmail.com","Futbol100","Roman","Palermo"),
    User("ArbasetiFelipe@gmail.com","OtakuFurro","Feli","Once"),
    User("1001dalmatas@gmail.com","101dalmata","1dalmata","Londres"),
    User("1","1","1dalmata","Londres")
  ];
 