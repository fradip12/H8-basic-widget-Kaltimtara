import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_one/controller/qr_controller.dart';
import 'package:session_one/pages/pages_scanner.dart';

class QRCodesScanner extends StatelessWidget {
  const QRCodesScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ScannerCam()));
        },
        child: const Icon(Icons.qr_code),
      ),
      body: Consumer<QRProvider>(
        builder: (_, data, __) {
          return Center(
            child: Text(data.scannedCode ?? '-'),
          );
        },
      ),
    );
  }
}
