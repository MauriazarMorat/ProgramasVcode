import 'package:flutter/material.dart';

void main() { //Esto es necesario para iniciar la aplicacion
  runApp(const MainApp()); //Necesario 
}

class MainApp extends StatefulWidget {  //Esto es un statefulwidget, que cambia y no es constante
  const MainApp({super.key}); // necesario

  @override //esto es estetico?
  MainAppState createState() => MainAppState();   //Se crea una variable que va a cambiar un estado
}
                                                            //Las variables van acá: 
class MainAppState extends State<MainApp> {                //Se define que esa variable va a cambiar el estado de X cosa
  double _fontSize = 24;                                  // Variable que guarda el tamaño de la fuente
  Color _fontcolor = Color.fromARGB(255, 0, 111, 255); // Variable que guarda el color de la fuente
  String _fontText = "Tocá abajo";                      //variable que guarda el contenido del texto
  final double _anchodecaja = 130;                     //variable que define the forma FINAL el ancho de la caja que voy a usar
  final double _altodecaja = 50;                      //variable que define the forma final el largo de la caja que voy a usar
                                                     //Final fuciona como define
                                                    //Lo hice para que las cajitas tengan sus propias medidas y sean todas iguales
                                                   //Las variables tienen el _ al principio porque son privadas? Tiene un sentido detras, me gusta que sean prolijas tambien
  // Función para cambiar el tamaño de la fuente
  void _increaseFontSize() {
    setState(() {
      _fontSize += 1; // Aumenta el tamaño de la fuente
    });
  }
  //Fución para cmabiar el tamaño de la fuente
  void _decreaseFontSize() {
    setState(() {
      _fontSize -= 1; // Decrementa el tamaño de la fuente
    });
  }
  //funcion para cambiar el color de la fuente
  void _orangeFontColor() {
    setState(() {
      _fontcolor = Color.fromARGB(255, 255, 86, 34); // Decrementa el tamaño de la fuente
    });
  }
  //funcion para cambiar el color de la fuente
   void _blueFontColor() {
    setState(() {
      _fontcolor = Color.fromARGB(255, 0, 111, 255); // Decrementa el tamaño de la fuente
    });
  }
  //funcion para mostrar el texto:
  void _showFontText() {
    setState(() {
      _fontText = "Tocá abajo";
    });
  }
  //funcion para borrar el texto:
  void _delFontText() {
    setState(() {
      _fontText = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(                           //Esto setea el sacffold, que seria la base de la fotografia
        body: Align(                            //Aca pongo un alignment, que sirve para setear el LUGAR
          alignment: Alignment.center,          //Alignment.locacion
          child: Column(                        //Child es singular, las columnas o row tienen children, que son varios
            mainAxisAlignment: MainAxisAlignment.center,   //Aca estoy seteando los alignment de la columna despues pongo los chidren
            crossAxisAlignment: CrossAxisAlignment.center,  //Realmente no se que tanto es necesario ya que esta puesto aca y atras, pero para asegurarse
            children: [ //Los hijos de la columna
              Text(
                _fontText,
                style: TextStyle(fontSize: _fontSize, color: _fontcolor),
              ), 

              SizedBox(height: 20), //Esto es una caja sin nada que separa un poquito el texto de la columa de botones
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
              children: 
              [Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox( // Seteo ua caja y pongo el botón adentro, asi no se mueve el tamaño
                    width: _anchodecaja,
                    height: _altodecaja,
                    child: 
                ElevatedButton( //Un tipo de boton?
                onPressed: _showFontText, // Llama a la función cuando se presiona el botón
                child: const Text("SHOW"),
              ),
                  ),
                  SizedBox(
                    width: _anchodecaja,
                    height: _altodecaja, 
                  child: 
              ElevatedButton(
                onPressed: _delFontText, // Llama a la función cuando se presiona el botón
                child: const Text("DEL"),
              ),
                  )
                ],
              ),Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                SizedBox(
                    width: _anchodecaja,
                    height: _altodecaja, 
                  child:
                ElevatedButton(
                onPressed: _decreaseFontSize, // Llama a la función cuando se presiona el botón
                child: const Text("- Tamaño"),
              ),
              ),
                  SizedBox(
                    width: _anchodecaja,
                    height: _altodecaja, 
                  child:
              ElevatedButton(
                onPressed: _increaseFontSize, // Llama a la función cuando se presiona el botón
                child: const Text("+ Tamaño"),
                ),
              ) 
                ],
              ),Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                SizedBox(
                    width: _anchodecaja,
                    height: _altodecaja, 
                  child:
                ElevatedButton(
                onPressed: _blueFontColor, // Llama a la función cuando se presiona el botón
                child: const Text("Azul"),
              ),
                ),
              SizedBox(
                    width: _anchodecaja,
                    height: _altodecaja, 
                  child:  
              ElevatedButton(
                onPressed: _orangeFontColor, // Llama a la función cuando se presiona el botón
                child: const Text("Naranja"),
              ),
              ), 
                
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
