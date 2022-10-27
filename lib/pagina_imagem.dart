

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class AquiMostra extends StatefulWidget {

  final Uint8List foto1;
   final Uint8List foto2;
    final Uint8List assinatura;
  AquiMostra({Key? key,  required this.foto1, required this.foto2, required this.assinatura}) : super(key: key);

  @override
  State<AquiMostra> createState() => _AquiMostraState();
}

class _AquiMostraState extends State<AquiMostra> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mostra Imagem"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
       child: Column(
         children: [
           Container(
            padding: EdgeInsets.all(16),
            child: Card(child: Image(image:MemoryImage(widget.foto1)))
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Card(child: Image(image:MemoryImage(widget.foto2)))
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Card(child: Image(image:MemoryImage(widget.assinatura)))
          )
         ],
       )),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
      ),
    );
  }
}