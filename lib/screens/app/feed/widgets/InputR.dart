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
  final fotoController = TextEditingController();
  final dataController = TextEditingController();
  final codigoController = TextEditingController();
  final categoriaController = TextEditingController();

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
                hintText: 'Valor',
                labelText: 'Valor',
              ),
              controller: valorController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
            ),
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  hintText: 'Descrição',
                  focusColor: Colors.white,
                  labelText: 'Descrição'),
              keyboardType: TextInputType.number,
              controller: descricaoController,
            ),
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  hintText: 'Foto',
                  focusColor: Colors.white,
                  labelText: 'Foto'),
              controller: fotoController,
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  hintText: 'Data',
                  focusColor: Colors.white,
                  labelText: 'Data'),
              keyboardType: TextInputType.number,
              controller: dataController,
            ),
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white,
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
                    color: Colors.white,
                  ),
                  hintText: 'Categória',
                  focusColor: Colors.white,
                  labelText: 'Categória'),
              keyboardType: TextInputType.number,
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
                    Database database =
                        Database('Empresas/Pagow/Despesas');
                    Despesa despesa = Despesa(
                        valor: valorController.text,
                        descricao: descricaoController.text,
                        fotoNF: fotoController.text,
                        data: dataController.text);
                    //teste
                    await database.inputReembolso(despesa);
                    //teste
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
