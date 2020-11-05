import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementarContador() {
    setState(() {
      if (_counter < 33) {
        _counter++;
      }
    });
  }

  void _reducirContador() {
    if (_counter > 0)
      setState(() {
        _counter--;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: _reducirContador,
                    tooltip: 'Reduce',
                    child: Icon(Icons.remove),
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  FloatingActionButton(
                    onPressed: _incrementarContador,
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Container(
              child: GridView.count(
                physics: new NeverScrollableScrollPhysics(),
                crossAxisCount: 5,
                shrinkWrap: true,
                children: List.generate(_counter, (index) {
                  var newIndex = index + 1;
                  if ((newIndex % 3) == 0 && (newIndex % 5) == 0) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.blue,
                      ),
                      child: Center(child: Text('FaceBook')),
                    );
                  }
                  if ((newIndex % 3) == 0) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.red),
                      child: Center(child: Text('Face')),
                    );
                  }
                  if ((newIndex % 5) == 0) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.amber[300]),
                      child: Center(child: Text('Book')),
                    );
                  }

                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.teal),
                    child: Center(child: Text('$newIndex')),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
