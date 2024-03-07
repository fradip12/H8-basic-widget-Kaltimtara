import 'package:flutter/foundation.dart';

class QRProvider extends ChangeNotifier {
  String? scannedCode;

  void updateCodes(String value) {
    scannedCode = value;
    notifyListeners();
  }
}
