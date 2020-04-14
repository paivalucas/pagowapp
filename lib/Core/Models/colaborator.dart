import 'dart:core';
import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'despesa.dart';

class Colaborador {
  String email;
  String nome;
  String nomeDaEmpresa;
  String nTelefone;
  String senha;
  Double cpf;
  String nomeDoBanco;
  String nDaConta;
  String nDaAgencia;
  List<Despesa> despesas;
  

  Colaborador(
      {this.email,
      this.nome,
      this.nomeDaEmpresa,
      this.nTelefone,
      this.senha,
      this.cpf,
      this.nomeDoBanco,
      this.nDaAgencia,
      this.nDaConta,
      this.despesas});


  // Transforma o objeto JSON obtido pela requisição do Firebase em um objeto Colaborador
  Colaborador.fromMap(DocumentSnapshot snapshot)
      : email = snapshot['email'],
        nome = snapshot['nome'],
        nomeDaEmpresa = snapshot['nomeDaEmpresa'],
        nTelefone = snapshot['nTelefone'],
        senha = snapshot['senha'],
        cpf = snapshot['cpf'],
        nomeDoBanco = snapshot['nomeDoBanco'],
        nDaAgencia = snapshot['nTelefone'],
        nDaConta = snapshot['nTelefone'],
        despesas = snapshot['despesas'];

  // Transforma um objeto Colaborador em um objeto JSON para ser enviado para o Firebase
  toJson() {
    return {
      'email': email,
      'nome': nome,
      'nomeDaEmpresa': nomeDaEmpresa,
      'nTelefone': nTelefone,
      'senha': senha,
      'cpf': cpf,
      'nomeDoBanco': nomeDoBanco,
      'nDaAgencia': nTelefone,
      'nDaConta': nTelefone,
      'despesas': despesas,
    };
  }
}

