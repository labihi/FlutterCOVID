import 'package:flutter/material.dart';
import 'package:fluttertestapp/api/api.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class DPCMPagePDF extends StatefulWidget{
  final url;

  DPCMPagePDF(this.url);

  @override
  State<StatefulWidget> createState() {
    return DPCMPageStatePDF(this.url);
  }
}

class DPCMPageStatePDF extends State<DPCMPagePDF> {
  bool _isLoading = true;
  PDFDocument document;
  final url;
  DPCMPageStatePDF(this.url);

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromURL(url);
    setState(() => _isLoading = false);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Impostazioni'),
        ),
        body: Center(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : PDFViewer(document: document)),
      ),
    );
  }
}
