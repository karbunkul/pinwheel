import 'package:flutter/material.dart';
import 'package:pinwheel/pinwheel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinwheel Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Pinwheel Demo'),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _body(),
      floatingActionButton: ConditionContainer(
        condition: true,
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _body() {
    return StickyContent(
      child: ListView(children: [
        Text('Foo Bar 1'),
        Text('Foo Bar 2'),
        Text('Foo Bar 3'),
        Text('Foo Bar 4'),
        Text('Foo Bar 5'),
        Text('Foo Bar 6'),
        Text('Foo Bar 7'),
        Text('Foo Bar 8'),
      ]),
      content: Container(
        child: Text('Sticky content'),
        color: Colors.amber,
      ),
    );
  }
}
