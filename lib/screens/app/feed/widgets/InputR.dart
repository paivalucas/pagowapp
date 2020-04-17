import 'package:flutter/material.dart';
import 'package:pagowandroidmobile/Core/Models/despesa.dart';
import 'package:pagowandroidmobile/Core/Services/database.dart';

class InputR extends StatefulWidget {
  @override
  _InputRState createState() => _InputRState();
}

class _InputRState extends State<InputR> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(40, 80, 40, 40),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  hintText: 'Insira seu email',
                  labelText: 'Endereço de Email',
                ),
                style: TextStyle(color: Colors.white),
              ),
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    hintText: 'Insira sua senha',
                    focusColor: Colors.white,
                    labelText: 'Senha'),
              ),
              Container(
                height: 30,
              ),
              ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                      onPressed: () {
                        // _formKey.currentState.validate()
                        if (true) {
                          Services database =
                              Services('Empresas/Pagow/Despesas');
                          Despesa despesa = Despesa(
                              valor: 'valor',
                              descricao: 'descricao',
                              fotoNF: 'dale',
                              data: 'esa');
                          database.inputReembolso(despesa);
                        }
                      },
                      color: Colors.white,
                      child: Text(
                        'Enviar',
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Color(0xFFFF7255),
                          fontWeight: FontWeight.bold,
                        ),
                      )))
            ],
          ),
        ));
  }
}
