import 'package:flutter/widgets.dart';

class Despesa {
  String valor;
  String descricao;
  String fotoNF;
  String data;

  Despesa({this.valor, this.descricao, this.fotoNF, this.data});


  Despesa.fromMap(dynamic snapshot){
    Map<String, dynamic> data = snapshot.data();
    valor = data['valor'];
    descricao = data['descricao'];
    fotoNF = data['fotoNF'];
    data = data['data'];
  }

  toJson(){
    return {
      'valor':valor,
      'descricao':descricao,
      'fotoNF':fotoNF,
      'data':data
    };
  }
}