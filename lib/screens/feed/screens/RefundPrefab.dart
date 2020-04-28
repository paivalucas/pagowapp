import 'package:flutter/material.dart';
import 'package:pagowandroidmobile/Core/Services/database.dart';

class RefundWidget extends StatefulWidget {
  @override
  _RefundWidgetState createState() => _RefundWidgetState();
}

class _RefundWidgetState extends State<RefundWidget> {
  Color laranjaPagow = Color(0xFFFF7C61);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: readData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: Text("Carregando Dados...",
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  textAlign: TextAlign.center),
            );
          default:
            if (snapshot.hasError) {
              print(snapshot.data);
              return Center(
                child: Text("Erro ao Carregar Dados...",
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                    textAlign: TextAlign.center),
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.fastfood,
                        size: 45,
                        color: laranjaPagow,
                      ),
                      title: Text(snapshot.data[index]['categoria']),
                      subtitle: Text(
                        snapshot.data[index]['valor'].toString() + ' R\$',
                        maxLines: 3,
                        softWrap: true,
                      ),
                      isThreeLine: true,
                      dense: true,
                      trailing: FlatButton(
                        onPressed: () {
                          print('Detalhes');
                        },
                        child: Icon(
                          Icons.search,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
        }
      },
    );
  }

  Future<List> readData() async {
    // TODO: path
    Database database = Database('Empresas/Pagow/Colaboradores');
    return await database
        .searchColab('Jefferson Guerra')
        .then((colaborador) => colaborador.despesas);
  }
}
