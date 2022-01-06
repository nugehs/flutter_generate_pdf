import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../services/mobile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: const Text('Create PDF'),
        onPressed: _createPDF,
      )),
    );
  }

  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    page.graphics.drawString(
        'Welcome to Bashbop', PdfStandardFont(PdfFontFamily.helvetica, 30));

    page.graphics.drawImage(PdfBitmap(await _readImageData('bashqr.png')),
        Rect.fromLTWH(0, 100, 440, 550));

    List<int> bytes = document.save();

    document.dispose();
    SaveAndLaunchFile(bytes, 'code.pdf');
  }

  Future<Uint8List> _readImageData(String name) async {
    final data = await rootBundle.load('assets/$name');

    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }
}
