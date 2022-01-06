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

    List<int> bytes = document.save();

    document.dispose();
    print('Testing pdf');
    SaveAndLaunchFile(bytes, 'code.pdf');
  }
}
