class Imagem_Teste_Model {
  String? protocoloN;
  String? foto1;
  String? foto2;
  String? assinatura;
  int? id;

  Imagem_Teste_Model(
      {this.protocoloN, this.foto1, this.foto2, this.assinatura, this.id});

  Imagem_Teste_Model.fromJson(Map<String, dynamic> json) {
    protocoloN = json['protocoloN'];
    foto1 = json['foto1'];
    foto2 = json['foto2'];
    assinatura = json['assinatura'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['protocoloN'] = this.protocoloN;
    data['foto1'] = this.foto1;
    data['foto2'] = this.foto2;
    data['assinatura'] = this.assinatura;
    data['id'] = this.id;
    return data;
  }
}
