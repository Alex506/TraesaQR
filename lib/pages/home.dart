import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:traesa_qr/state/qr_state.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/traesa_qr.png',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              SizedBox(height: 20),
              Container(
                child: Column(children: [
                  Text("Traesa QR"),
                  Text("Escanear código QR"),
                ]),
              ),
              TextButton(
                style: TextButton.styleFrom(),
                onPressed: () => scanQR,
                child: Text("Escanear"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void scanQR() async {
    final qr_state = Provider.of<QR_State>(context, listen: false);
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      qr_state.qrCode = barcodeScanRes;
      Navigator.pushNamed(context, 'verify');
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }
}
