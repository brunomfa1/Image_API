import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

class AutoConcluAssiFoto {
  String? protocoloN;
  Image? Foto1;
  Image? Foto2;
  Image? Assinatura;

  AutoConcluAssiFoto(
      {this.protocoloN, this.Foto1, this.Foto2, this.Assinatura});

  AutoConcluAssiFoto.fromJson(Map<String, dynamic> json) {
    protocoloN = json['protocoloN'];
    Foto1 = json['Foto1'];
    Foto2 = json['Foto2'];
    Assinatura = json['Assinatura'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['protocoloN'] = this.protocoloN;
    data['tipoUnidade'] = this.Foto1;
    data['material'] = this.Foto2;
    data['revestimentoExterno'] = this.Assinatura;
    return data;
  }
}
