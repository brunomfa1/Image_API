import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myteste/pagina_imagem.dart';
import 'package:myteste/pagina_imagem.dart';

import 'controller/pagina_teste_imagem_controller.dart';
import 'model/pagina_teste_imagem_model.dart';

class TelaBuscaProtocolo extends StatefulWidget {
  TelaBuscaProtocolo({Key? key}) : super(key: key);

  @override
  State<TelaBuscaProtocolo> createState() => _PaginaTelaBuscaProtocoloState();
}

class _PaginaTelaBuscaProtocoloState extends State<TelaBuscaProtocolo> {
  TextEditingController protocolo = TextEditingController();
  late Image foto;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mostra Imagem'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  flex: 8,
                  child: TextFormField(
                    controller: protocolo,
                    decoration: const InputDecoration(
                        hintText: "Insira o protocolo da fiscalização",
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.redAccent))),
                  ),
                ),
                const SizedBox(height: 10),
                Flexible(
                  flex: 2,
                  child: TextButton(
                      child: const Text('Procurar Fotos'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.greenAccent),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: () {
                        var procuraFotos =
                            ImagemTesteVisu.verificaImagem(protocolo.text);
                        procuraFotos.then((valorfoto) {
                          late var fotorecebida = Imagem_Teste_Model();
                          fotorecebida.id = valorfoto.id;
                          fotorecebida.protocoloN =
                              valorfoto.protocoloN.toString();
                          fotorecebida.foto1 = valorfoto.foto1;
                          fotorecebida.foto2 = valorfoto.foto2;
                          fotorecebida.assinatura = valorfoto.assinatura;

                          var foto1 = fotorecebida.foto1;
                          var fotoDOC1 =
                              Uint8List.fromList(retornaListaInt(foto1!));
                          var foto2 = fotorecebida.foto2;
                          var fotoDoc2 =
                              Uint8List.fromList(retornaListaInt(foto2!));
                          var assinatura = fotorecebida.assinatura;
                          var assinaturaDOC =
                              Uint8List.fromList(retornaListaInt(assinatura!));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AquiMostra(
                                        foto1: fotoDOC1,
                                        foto2: fotoDoc2,
                                        assinatura: assinaturaDOC,
                                      )));
                        });
                      }),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  static List<int> retornaListaInt(String listaQueeUmaListaMasnSabe) {
    List<int> retorno = <int>[];
    var listaString = listaQueeUmaListaMasnSabe
        .replaceAll('[', '')
        .replaceAll(']', '')
        .split(',');
    for (var i = 0; i < listaString.length; i++) {
      retorno.add(int.parse(listaString[i]));
    }
    return retorno;
  }
}
