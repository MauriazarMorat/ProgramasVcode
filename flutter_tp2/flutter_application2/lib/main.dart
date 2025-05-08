import 'package:flutter/material.dart';

void main() { //Esto es necesario para iniciar la aplicacion
  runApp(const MainApp()); //Necesario 
}
class MainApp extends StatefulWidget {  //Esto es un statefulwidget, que cambia y no es constante
  const MainApp({super.key}); // necesario

  @override //esto es estetico?
  MainAppState createState() => MainAppState();   //Se crea una variable que va a cambiar un estado
}

class MainAppState extends State<MainApp> {                //Se define que esa variable va a cambiar el estado de X cosa                      //variable que define the forma final el largo de la caja que voy a usar
TextEditingController textoUsuario = TextEditingController();  
TextEditingController textoContra = TextEditingController();                                                    //Final fuciona como define
                                                    //Lo hice para que las cajitas tengan sus propias medidas y sean todas iguales
bool textoobscuro=true;                                                   //Las variables tienen el _ al principio porque son privadas? Tiene un sentido detras, me gusta que sean prolijas tambien
String usuarioPuesto ="NoInput";
String contraPuesta ="NoInput"; 
String resultado = "";
Color colorRespuesta = Colors.white;
String username = "Oktubre86";
String password = "PatricioRey";
void enviar(){
setState(() {
  usuarioPuesto =textoUsuario.text;
  contraPuesta =textoContra.text;
  if(usuarioPuesto==""){
    resultado = "No pusiste Usuario"; //te falto el usuario
    colorRespuesta = const Color.fromARGB(255, 209, 33, 21);
  }
  if(contraPuesta==""){
    resultado = "No pusiste Contraseña"; // te falto la contra
    colorRespuesta = const Color.fromARGB(255, 209, 33, 21);
  }
  if(usuarioPuesto==""&&contraPuesta==""){
    resultado = "No pusiste nada, jaja"; // No pusiste nada jaja
    colorRespuesta = const Color.fromARGB(255, 138, 173, 8);
  }
  if(usuarioPuesto!=""&&contraPuesta!=""){
    resultado = "Contraseña/Usuario incorrectos"; //incorrecto
    colorRespuesta = const Color.fromARGB(255, 209, 33, 21);
  }
  if(usuarioPuesto==username&&contraPuesta==password){
  resultado = "Correcto, logeandose..."; //correcto
  colorRespuesta = const Color.fromARGB(255, 32, 250, 3);
  }
});
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(                           //Esto setea el sacffold, que seria la base de la fotografia
        body: Align(                            //Aca pongo un alignment, que sirve para setear el LUGAR
          alignment: Alignment.center,          //Alignment.locacion
          child: Column(                        //Child es singular, las columnas o row tienen children, que son varios
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Text ("Logeate",style: TextStyle(fontSize: 40, color: Colors.black)),
              SizedBox(height: 40,width: 200,
              child: TextField(controller: textoUsuario,)
              ),
              SizedBox(height: 40,width: 200,
              child: TextField(controller: textoContra,obscureText: textoobscuro,decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  textoobscuro ? Icons.visibility_off : Icons.visibility
                ), onPressed: (){
                  setState((){
                    textoobscuro = !textoobscuro;
                  });
                },
              )  
              )
              ),
              SizedBox(height: 40,),
              ElevatedButton(onPressed: enviar, child: Text("Enviar")),
              Text (resultado,style: TextStyle(fontSize: 30, color: colorRespuesta)),

            ],
          ),
        ),
      ),
    );
  }
}
