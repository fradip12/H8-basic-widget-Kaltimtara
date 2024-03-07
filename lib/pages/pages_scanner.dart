import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:session_one/controller/qr_controller.dart';

class ScannerCam extends StatefulWidget {
  const ScannerCam({super.key});

  @override
  State<ScannerCam> createState() => _ScannerCamState();
}

class _ScannerCamState extends State<ScannerCam> {
  late MobileScannerController controller;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController(torchEnabled: true);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QRProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            onPressed: () => controller.toggleTorch(),
            icon: ValueListenableBuilder(
              valueListenable: controller.torchState,
              builder: (context, value, child) {
                switch (value) {
                  case TorchState.off:
                    return Icon(Icons.flash_off);

                  case TorchState.on:
                    return Icon(Icons.flash_on);
                  default:
                    return Container();
                }
              },
            ),
          ),
        ],
      ),
      body: MobileScanner(
        controller: controller,
        onDetect: (BarcodeCapture barcodes) {
          provider.updateCodes(barcodes.barcodes.first.rawValue ?? 'N/A');
          Navigator.pop(context);
        },
      ),
    );
  }
}
