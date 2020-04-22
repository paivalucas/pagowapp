import 'package:cloud_firestore/cloud_firestore.dart';

class Despesa {
  String valor;
  String descricao;
  String fotoNF;
  String data;

  Despesa({this.valor, this.descricao, this.fotoNF, this.data});

  Despesa.fromMap(DocumentSnapshot snapshot) {
    valor = snapshot['valor'];
    descricao = snapshot['descricao'];
    fotoNF = snapshot['fotoNF'];
    data = snapshot['data'];
  }

  toJson() {
    return {
      'valor': valor,
      'descricao': descricao,
      'fotoNF': fotoNF,
      'data': data
    };
  }
}
