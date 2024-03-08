import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:http/http.dart';

class PageNFC extends StatefulWidget {
  const PageNFC({super.key});

  @override
  State<PageNFC> createState() => _PageNFCState();
}

class _PageNFCState extends State<PageNFC> {
  void readNfc() async {
    try {
      print('NFC Availability : ${await FlutterNfcKit.nfcAvailability}');
      NFCTag poll = await FlutterNfcKit.poll(
        timeout: Duration(seconds: 5),
      );
      print(poll);
      print(poll.toJson());
      FlutterNfcKit.finish();
    } on Exception catch (e) {
      if (mounted) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Gagal Membaca Data'),
          ),
        );
      }
    }
  }

  void validateData() async {
    // String result1 = await FlutterNfcKit.transceive("00B0950000");
    String result2 =
        await FlutterNfcKit.transceive("00A4040009A00000000386980701");
    print(result2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: readNfc,
          child: Text('Read NFC'),
        ),
      ),
    );
  }
}
