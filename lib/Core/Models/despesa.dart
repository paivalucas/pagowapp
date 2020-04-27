import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class Despesa {
  String id;
  double valor;
  String descricao;
  String categoria;
  Image fotoNF;
  DateTime data;
  String idColaborador;
  bool done;

  Despesa(String categoria, double valor, String descricao, DateTime data){
      this.categoria = categoria;
      this.valor = valor;
      this.descricao = descricao;

      //Later
      // this.fotoNF = fotoNF;

      
      this.data = data;
      this.idColaborador = idColaborador;
      }

  Despesa.fromMap(DocumentSnapshot snapshot, String id) {
    valor = snapshot['valor'];
    id = id;
    categoria = snapshot['categoria'];
    descricao = snapshot['descricao'];
    fotoNF = snapshot['fotoNF'];
    data = snapshot['data'];
    done = snapshot['reembolso'];
    idColaborador = snapshot['colaborador'];
  }

  toJson() {
    return {
      'valor': valor,
      'descricao': descricao,
      'categoria': categoria,
      'fotoNF': fotoNF,
      'data': data,
      'colaborador': idColaborador,
      'reembolso': done
    };
  }
}
