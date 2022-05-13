import 'package:flutter/material.dart';
import 'package:traesa_qr/pages/home.dart';
import 'package:traesa_qr/pages/verify.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: 'Traesa QR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Gotham'),
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'verify': (context) => VerifyPage(),
      },
    ));
  }
}
