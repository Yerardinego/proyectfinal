import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyectoflutter/models/mensaje.model.dart';
import 'package:proyectoflutter/providers/mensaje.provider.dart';
import 'package:proyectoflutter/widgets/card.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final mensajeProvider = MensajeProvider();
  late Future<List<MensajeModel>> mensaje;

  @override
  void initState() {
    mensaje = mensajeProvider.obtenerMensaje();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tu frase motivacional'),
        ),
        body: FutureBuilder(
          future: mensaje,
          builder: ((context, snapshot) {
            List<Widget> lista = [];

            if (snapshot.hasData) {
              snapshot.data?.forEach((element) => lista.add(CardWidget(
                    mensaje: element,
                  )));
              return ListView(
                children: lista,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
        ));
  }
}
