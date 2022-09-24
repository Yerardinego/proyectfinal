import 'dart:convert';

import 'package:proyectoflutter/models/mensaje.model.dart';
import 'package:http/http.dart' as http;

class MensajeProvider {
  Future<List<MensajeModel>> obtenerMensaje() async {
    List<MensajeModel> mensaje = [];
    var client = http.Client();

    try {
      Map<String, String> parametros = {
        'language_code': 'es',
      };

      Map<String, String> cabecera = {
        'X-RapidAPI-Key': '87a5ec13famsh47061dc8e2eca8ep188f11jsne5d2c59b0b0a',
        'X-RapidAPI-Host': 'quotes15.p.rapidapi.com',
      };

      var url =
          Uri.https('quotes15.p.rapidapi.com', 'quotes/random/', parametros);
      var response = await http.get(url, headers: cabecera);
      // print(response.body);
      var decodeResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      // print(decodeResponse['originator']['name']);
      mensaje.add(MensajeModel(content: decodeResponse['content'], name: decodeResponse['originator']['name']));
      return mensaje;
    } finally {
      client.close();
    }
  }
}
