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

  Color laranjaPagow = Color(0xFFFF7C61);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(40, 80, 40, 40),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: "@Nome",
                readOnly: true,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: laranjaPagow,
                  ),
                  labelText: 'Nome',
                
                ),
                controller: _nome,
              ),
              TextFormField(
                initialValue: "@UserName",
                readOnly: true,
                controller: _username,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.card_membership,
                    color: laranjaPagow,
                  ),
                  labelText: 'Nome de Usuário',
                ),
              ),
              TextFormField(
                initialValue: "@Empresa",
                readOnly: true,
                controller: _empresa,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.card_membership,
                    color: laranjaPagow,
                  ),
                  labelText: 'Empresa',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
