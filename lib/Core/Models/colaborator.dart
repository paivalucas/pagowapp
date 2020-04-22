import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

class Colaborador {
  String id;
  String email;
  String nome;
  String nomeDaEmpresa;
  String nTelefone;
  String senha;
  String cpf;
  String nomeDoBanco;
  String nDaConta;
  String nDaAgencia;
  List despesas;

  Colaborador(
      {this.email,
      this.id,
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
  Colaborador.fromMap(DocumentSnapshot snapshot, String docId)
      : email = snapshot['email'],
        id = docId,
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
