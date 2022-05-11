import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traesa_qr/state/qr_state.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final qr_state = Provider.of<QR_State>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Text(qr_state.qrCode),
      ),
    );
  }
}
