import 'package:flutter/material.dart';

class QR_State with ChangeNotifier {
  String _qrCode = '';

  String get qrCode => _qrCode;
  set qrCode(String value) {
    _qrCode = value.split(";")[2];
    notifyListeners();
  }

  void apicall() {
    print(_qrCode);
    String url =
        "https://api.blackvector.com/getVerifyActiveEmployee?identificacion=$_qrCode&codigoMarca=&usuario=admintractores&key=C-S8sSG5-P9q]?kV%3Ex-j%7BvJ]KMqo%5E=bXLH%3EbTi";
    print(url);
  }
}
