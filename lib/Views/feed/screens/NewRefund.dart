import 'package:flutter/material.dart';
import 'package:pagowandroidmobile/Core/Models/despesa.dart';
import 'package:pagowandroidmobile/Core/Services/database.dart';

class InputR extends StatefulWidget {
  @override
  _InputRState createState() => _InputRState();
}

class _InputRState extends State<InputR> {
  final _formKey = GlobalKey<FormState>();
  final valorController = TextEditingController();
  final descricaoController = TextEditingController();
  final dataController = TextEditingController();
  final codigoController = TextEditingController();
  final categoriaController = TextEditingController();


Color laranjaPagow = Color(0xFFFF7C61);
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
                  color: laranjaPagow
                ),
                hintText: 'Valor',
                labelText: 'Valor',
              ),
              controller: valorController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.black),
            ),
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: laranjaPagow
                  ),
                  hintText: 'Descrição',
                  focusColor: Colors.white,
                  labelText: 'Descrição'),
              keyboardType: TextInputType.text,
              controller: descricaoController,
            ),
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: laranjaPagow
                  ),
                  hintText: 'Foto',
                  focusColor: Colors.white,
                  labelText: 'Foto'),
            ),
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: laranjaPagow
                  ),
                  hintText: 'Data',
                  focusColor: Colors.white,
                  labelText: 'Example: 2000-12-24'),
              keyboardType: TextInputType.datetime,
              controller: dataController,
            ),
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: laranjaPagow
                  ),
                  hintText: 'Código',
                  focusColor: Colors.white,
                  labelText: 'Código'),
              keyboardType: TextInputType.number,
              controller: codigoController,
            ),
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: laranjaPagow
                  ),
                  hintText: 'Categória',
                  focusColor: Colors.white,
                  labelText: 'Categória'),
              keyboardType: TextInputType.text,
              controller: categoriaController,
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
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    Database database = Database('Empresas/Pagow/Despesas');
                    Despesa despesa = Despesa(
                      categoriaController.text,
                      int.parse(valorController.text),
                      descricaoController.text,
                      DateTime.parse(dataController.text),
                    );
                    //teste
                    await database.inputReembolso(despesa);
                    //teste
                  } else{
                    print('form não validado');
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
