import 'package:flutter/material.dart';
import 'package:pagowandroidmobile/Views/feed/screens/Preferences.dart';
import 'screens/Feed.dart';
import 'screens/NewRefund.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Color laranjaPagow = Color(0xFFFF7C61);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  PageController _myPage;
  var selectedPage;

  @override
  void initState() {
    super.initState();
    _myPage = PageController(initialPage: 1);
    selectedPage = 1;
  }

  Color laranjaPagow = Color(0xFFFF7C61);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF2F2F2),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color(0xFFFF7C61),
          onPressed: () {
            _myPage.jumpToPage(0);
            setState(() {
              selectedPage = 0;
            });
          },
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _myPage,
          children: <Widget>[
            InputR(),
            HomeScreen(), // tela 1
            Center(child: Text("Page 2")),
            Center(child: Text("Page 3")),
            UserProfile(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.web),
                color: selectedPage == 1 ? laranjaPagow : Colors.grey,
                onPressed: () {
                  _myPage.jumpToPage(1);
                  setState(() {
                    selectedPage = 1;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.show_chart),
                color: selectedPage == 2 ? laranjaPagow : Colors.grey,
                onPressed: () {
                  _myPage.jumpToPage(2);
                  setState(() {
                    selectedPage = 2;
                  });
                },
              ),
              Divider(),
              IconButton(
                icon: Icon(
                  Icons.settings,
                ),
                color: selectedPage == 3 ? laranjaPagow : Colors.grey,
                onPressed: () {
                  _myPage.jumpToPage(3);
                  setState(() {
                    selectedPage = 3;
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                ),
                color: selectedPage == 4 ? laranjaPagow : Colors.grey,
                onPressed: () {
                  _myPage.jumpToPage(4);
                  setState(() {
                    selectedPage = 4;
                  });
                },
              ),
            ],
          ),
        ));
  }
}
