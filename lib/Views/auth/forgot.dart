import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:pagowandroidmobile/Core/Services/auth.dart';
import 'login.dart';

  // TODO: teste

class EsqueciSenha extends StatefulWidget {
  @override
  _EsqueciSenhaState createState() => _EsqueciSenhaState();
}

class _EsqueciSenhaState extends State<EsqueciSenha> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _emailEsqueci = TextEditingController();

  void _submitEsqueci(String email) {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      _esqueciComando(email);
    }
  }

  void _esqueciComando(String email) {
    final snackbar = SnackBar(
      content: Text('Email: $_emailEsqueci'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
    Auth a;
    a.passwordResetEmail(email);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[10],
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(40, 60, 40, 40),
        child: Column(
          children: <Widget>[
            Row(
              //cabecalho
              children: <Widget>[
                Column(
                  children: <Widget>[
                    // coluna 1/3
                    FlatButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    //coluna 2/3
                  ],
                ),
                Column(
                  children: <Widget>[
                    //coluna 3/3
                  ],
                )
              ],
            ),

            ///
            /// Fim cabecalho
            ///

            Container(height: 160),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Recuperar senha",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: Colors.black),
                ),
              ],
            ),
            Text(
              "Insira o email da sua conta para que possamos te ajudar a recuperar",
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 20.0,
                  color: Colors.black),
            ),
            Container(height: 40),
            Form(
                key: formKey,
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    hintText: 'Insira seu email',
                    labelText: 'Endereço de Email',
                  ),
                  controller: _emailEsqueci,
                  style: TextStyle(color: Colors.black),
                  validator: (val) => !EmailValidator.validate(val, true)
                      ? 'Email inválido.'
                      : null,
                )),
            Container(height: 40),
            ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                    onPressed: () {
                      _submitEsqueci(_emailEsqueci.text);
                    },
                    color: Colors.white,
                    child: Text(
                      'Enviar',
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
