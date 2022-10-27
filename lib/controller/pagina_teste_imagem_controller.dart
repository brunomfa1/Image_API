import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:myteste/model/pagina_teste_imagem_model.dart';
import 'package:myteste/model/pagina_teste_imagem_model_assifoto.dart';

class ImagemTesteVisu {
  static Future<Imagem_Teste_Model> verificaImagem(String protocoloN) async {
    var url = Uri.parse(
        "API");
    var header = {'Content-type': 'application/json; charset=utf-8'};

    String parametros = protocoloN;
    var body = json.encode(parametros.toString());
    final response = await post(url, headers: header, body: body);
    print('Response status : ${response.statusCode}');
    dynamic mapdeResposta = json.decode(response.body);
    Imagem_Teste_Model autoConcluAssiFotoFiscaliza = new Imagem_Teste_Model();  
    // var retorno = AutoConcluAssiFoto();
    if (response.statusCode == 200) {
      var resposta = Imagem_Teste_Model.fromJson(mapdeResposta);
      if (resposta != null) {
        autoConcluAssiFotoFiscaliza = resposta; 
      }
    }
    return autoConcluAssiFotoFiscaliza;
   }

 
}
