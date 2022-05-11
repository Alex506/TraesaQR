import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traesa_qr/pages/home.dart';
import 'package:traesa_qr/pages/verify.dart';
import 'package:traesa_qr/state/qr_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QR_State()),
      ],
      child: MaterialApp(
        title: 'Traesa QR',
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (context) => HomePage(),
          'verify': (context) => VerifyPage(),
        },
      ),
    ));
  }
}
