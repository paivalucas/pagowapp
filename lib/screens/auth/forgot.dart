import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'login.dart';

class EsqueciSenha extends StatefulWidget {
  @override
  _EsqueciSenhaState createState() => _EsqueciSenhaState();
}

class _EsqueciSenhaState extends State<EsqueciSenha> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _emailEsqueci  = TextEditingController();

  void _submitEsqueci() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      _esqueciComando();
    }
  }

  void _esqueciComando() {
    final snackbar = SnackBar(
      content: Text('Email: $_emailEsqueci'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333333),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    //coluna 2/3
                    Image.asset('images/logo.png', width: 120.0),
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
            Divider(
              color: Color(0xFF333333),
              height: 160,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Recuperar senha",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: Colors.white),
                ),
              ],
            ),
            Text(
              "Insira o email da sua conta para que possamos te ajudar a recuperar",
              style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 20.0,
                  color: Colors.white),
            ),
            Divider(color: Color(0xFF33333), height: 40.0),
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
              validator: (val) => !EmailValidator.validate(val, true)
                  ? 'Email inválido.'
                  : null,
            ),
            Divider(color: Color(0xFF33333), height: 40.0),
            ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                    onPressed: () {
                      _submitEsqueci();
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