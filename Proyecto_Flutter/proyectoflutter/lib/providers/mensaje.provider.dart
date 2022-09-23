import 'dart:convert';

import 'package:proyectoflutter/models/mensaje.model.dart';
import 'package:http/http.dart' as http;

class MensajeProvider {
  Future<List<MensajeModel>> obtenerMensaje() async {
    List<MensajeModel> mensaje = [];
    var client = http.Client();

    try {
      Map<String, String> parametros = {
        'category': 'all',
        'count': '1',
      };

      Map<String, String> cabecera = {
        'Authorization': 'undefined',
		    'X-RapidAPI-Key': '87a5ec13famsh47061dc8e2eca8ep188f11jsne5d2c59b0b0a',
		    'X-RapidAPI-Host': 'paperquotes.p.rapidapi.com'
      };

      var url = Uri.https('famous-quotes4.p.rapidapi.com', 'quotes', parametros);
      var response = await http.get(url, headers: cabecera);
      var decodeResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      decodeResponse['results']
          .forEach((item) => mensaje.add(MensajeModel.fromJson(item)));

      return mensaje;
    } finally {
      client.close();
    }
  }
}