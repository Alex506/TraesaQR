import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VerifyPage extends StatefulWidget {
  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  @override
  Widget build(BuildContext context) {
    final routes =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    apiCall(routes['qrCode'].toString());
    return Scaffold(
      body: Center(
        child: Text("Verificando..."),
      ),
    );
  }

  Future<void> apiCall(String id) async {
    String key = "C-S8sSG5-P9q]?kV%3Ex-j%7BvJ]KMqo%5E=bXLH%3EbTi";
    String base = "https://api.blackvector.com/getVerifyActiveEmployee";
    String data =
        "?identificacion=$id&codigoMarca=&usuario=admintractores&key=";

    final uri = Uri.parse("$base$data$key");
    // api call
    final response = await http.get(uri);
    print(response.body);
  }
}
