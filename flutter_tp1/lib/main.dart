import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  double _fontSize = 24; // Variable que guarda el tamaño de la fuente
  Color _fontcolor = Color.fromARGB(255, 0, 111, 255); // Variable que guarda el color de la fuente
  String _contenidodeltexto = "Tocá abajo";
  final double _anchodecaja = 130;
  final double _altodecaja = 50;
  
  // Función para cambiar el tamaño de la fuente
  void _increaseFontSize() {
    setState(() {
      _fontSize += 1; // Aumenta el tamaño de la fuente
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize -= 1; // Decrementa el tamaño de la fuente
    });
  }
  void _orangeFontColor() {
    setState(() {
      _fontcolor = Color.fromARGB(255, 255, 86, 34); // Decrementa el tamaño de la fuente
    });
  }
   void _blueFontColor() {
    setState(() {
      _fontcolor = Color.fromARGB(255, 0, 111, 255); // Decrementa el tamaño de la fuente
    });
  }
  void _showFontText() {
    setState(() {
      _contenidodeltexto = "Tocá abajo";
    });
  }
  void _delFontText() {
    setState(() {
      _contenidodeltexto = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _contenidodeltexto,
                style: TextStyle(fontSize: _fontSize, color: _fontcolor),
              ),
              SizedBox(height: 20),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
              children: 
              [Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: _anchodecaja,
                    height: _altodecaja,
                    child: 
                ElevatedButton(
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
              ),],
              
              )
          
          ],
          ),
        ),
      ),
    );
  }
}
