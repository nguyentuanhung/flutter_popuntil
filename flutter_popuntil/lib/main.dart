import 'package:flutter/material.dart';
import 'package:flutter_test_pop/pop_result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Demo Pop Until'),
      routes: <String, WidgetBuilder>{
        MyHomePage.pageName: (_) => MyHomePage(),
        Page1.pageName: (_) => Page1(),
        Page2.pageName: (_) => Page2(),
        Page3.pageName: (_) => Page3(),
        Page4.pageName: (_) => Page4(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static final String pageName = "MyHomePage";
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("to page 1"),
              onPressed: () {
                Navigator.of(context).pushNamed(Page1.pageName);
              },
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Page1 extends StatelessWidget {
  static final String pageName = "page1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("to page 2"),
              onPressed: () {
                Navigator.of(context).pushNamed(Page2.pageName).then((results) {
                  PopWithResults popResult = results as PopWithResults;
                  if (popResult != null) {
                    if (popResult.toPage == pageName) {
                      print(popResult.results.values.toList()[0]);
                    } else {
                      Navigator.of(context).pop(results);
                    }
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  static final String pageName = "page2";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("to page 3"),
              onPressed: () {
                Navigator.of(context).pushNamed(Page3.pageName).then((results) {
                  if (results is PopWithResults) {
                    PopWithResults popResult = results;
                    if (popResult.toPage == pageName) {
                      // TODO do stuff
                    } else {
                      Navigator.of(context).pop(results);
                    }
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  static final String pageName = "page3";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page3"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("to page 4"),
              onPressed: () {
                Navigator.of(context).pushNamed(Page4.pageName).then((results) {
                  if (results is PopWithResults) {
                    PopWithResults popResult = results;
                    if (popResult.toPage == pageName) {
                      // TODO do stuff
                    } else {
                      Navigator.of(context).pop(results);
                    }
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  static final String pageName = "page4";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page4"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("back to page 1"),
              onPressed: () {
                Navigator.of(context).pop(
                  PopWithResults(
                    fromPage: pageName,
                    toPage: Page1.pageName,
                    results: {"pop_result": "this is the pop's result"},
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
