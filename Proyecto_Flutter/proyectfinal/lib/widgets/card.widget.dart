import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyectoflutter/models/mensaje.model.dart';

class CardWidget extends StatelessWidget {
  CardWidget({super.key, required this.mensaje});

  MensajeModel mensaje;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.amber,
        height: 400,
        child: Column(
          children: [
            Text(mensaje.content),
            Text(mensaje.name),
          ],
        ),
      ),
    );
  }
}
