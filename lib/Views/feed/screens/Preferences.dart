import 'package:flutter/material.dart';
import 'package:pagowandroidmobile/Core/Models/colaborator.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _formKey = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _username = TextEditingController();
  final _empresa = TextEditingController();
  final _telefone = TextEditingController();
  final _senha = TextEditingController();
  final _cpf = TextEditingController();
  final _nomeDoBanco = TextEditingController();
  final _nDaConta = TextEditingController();
  final _nDaAgencia = TextEditingController();

  // TODO: Tela de usuário

  Color laranjaPagow = Color(0xFFFF7C61);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(40, 80, 40, 40),
          width: double.infinity,
          height: 200,
          color: laranjaPagow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //TODO: Tornar dinâmico
              Text(
                "Olá, Username!",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              //TODO: Tornar dinâmico
              Text(
                "EmpresaDoUser",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              )
            ],
          ),
        ),
        //TODO: Tornar dinâmico os campos
        Container(
          padding: const EdgeInsets.fromLTRB(40, 20, 40, 40),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: laranjaPagow,
                      ),
                      hintText: 'Insira seu nome',
                      labelText: 'Nome',
                    ),
                    controller: _nome,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.white),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.verified_user,
                        color: laranjaPagow,
                      ),
                      hintText: 'Insira seu nome de usuário',
                      labelText: 'Nome de Usuário',
                    ),
                    controller: _username,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.white),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.business,
                        color: laranjaPagow,
                      ),
                      hintText: 'Insira o nome da empresa',
                      labelText: 'Empresa',
                    ),
                    controller: _empresa,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.white),
                  ),
                  
                ],
              )),
        ),
      ],
    ));
  }
}
