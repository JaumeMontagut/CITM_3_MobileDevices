import 'package:flutter/material.dart';

void main() {
  runApp(
    App(),
  );
}

class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hola Flutter'),
        ),
        body: Center(
          child: Text(
            'hello world',
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
        backgroundColor: Colors.yellow,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.battery_alert),
          onPressed: () {
            print("Has apretat el botó.");
          },
        ),
      ),
    );
  }
}
