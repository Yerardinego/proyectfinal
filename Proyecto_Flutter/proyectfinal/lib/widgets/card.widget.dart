import 'dart:math';
import 'package:bordered_text/bordered_text.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyectoflutter/main.dart';
import 'package:proyectoflutter/models/mensaje.model.dart';
import 'package:proyectoflutter/providers/mensaje.provider.dart';

class CardWidget extends StatelessWidget {
  CardWidget({
    super.key,
    required this.mensaje,
    required this.callback,
  });

  MensajeModel mensaje;
  final Function callback;
  var numImagen = 1 + Random().nextInt(7-1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 700,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imagen$numImagen.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: BorderedText(
                    strokeWidth: 3,
                    strokeColor: Colors.white,
                    child: Text(
                      '"${mensaje.content}"',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: BorderedText(
                    strokeWidth: 3.0,
                    strokeColor: Colors.white,
                    child: Text(
                      mensaje.name,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    callback();
                  },
                  child: const Text(
                    "Generar frase",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                   FlutterClipboard.copy('"${mensaje.content}"').then((value) => print('copiado'));
                  },
                  icon: Icon(
                    Icons.copy,
                  ),
                  label: Text('Copiar Mi Mensaje'),
                    
                  ),
                
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                  
                  },
                  icon: Icon(
                    Icons.share,
                  size: 50.0,),
                  
                  label: Text(''),
                    
                  ),
                
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
