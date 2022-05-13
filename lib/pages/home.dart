import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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
                  Text(
                    "Traesa QR",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff333F48),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Escanear código QR",
                    style: TextStyle(
                      color: Color(0xff333F48),
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextButton(
                  onPressed: () => scanQR(),
                  child: Text("Escanear QR"),
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
          ),
        ),
      ),
    );
  }

  void scanQR() async {
    String barcodeScanRes;
    print("camera");
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      if (barcodeScanRes != "-1") {
        Navigator.pushNamedAndRemoveUntil(
          context,
          'verify',
          (route) => false,
          arguments: {'qrCode': barcodeScanRes.split(";")[2]},
        );
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
      print("failed");
    }
  }
}
