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
    return Scaffold(
      body: Center(
        child: FutureBuilder<bool>(
          future: apiCall(routes['qrCode'].toString()),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      snapshot.data!
                          ? Icon(Icons.check, color: Colors.green, size: 100)
                          : Icon(Icons.close, color: Colors.red, size: 100),
                      Text(
                        snapshot.data!
                            ? "Empleado Activo"
                            : "Empleado NO pertence a la empresa",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: 20,
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              'home',
                              (route) => false,
                            );
                          },
                          child: Text("Volver"),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Color(0xffF37021),
                            shape: const StadiumBorder(),
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            minimumSize: const Size.fromHeight(50),
                          ),
                        ),
                      ),
                    ],
                  )
                : CircularProgressIndicator(
                    color: Color(0xff333F48),
                  );
          },
        ),
      ),
    );
  }

  Future<bool> apiCall(String id) async {
    String key = "C-S8sSG5-P9q]?kV%3Ex-j%7BvJ]KMqo%5E=bXLH%3EbTi";
    String base = "https://api.blackvector.com/getVerifyActiveEmployee";
    String data =
        "?identificacion=$id&codigoMarca=&usuario=admintractores&key=";

    final uri = Uri.parse("$base$data$key");
    // api call
    final response = await http.get(uri);
    return response.body == "1" ? true : false;
  }
}
