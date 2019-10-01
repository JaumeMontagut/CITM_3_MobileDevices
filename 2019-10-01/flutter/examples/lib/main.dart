import 'package:flutter/material.dart';

void main() {
  runApp(
    App(),
  );
}

// body: Center(
//           child: Container(
//             width: 200,
//             height: 200,
//             child: Image.asset('assets/girl.jpg',
//             fit: BoxFit.cover),
//           ),
//         ),

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
          Container(
            width: 200,
            height: 200,
            child: Image.asset('assets/girl.jpg', fit: BoxFit.cover),
          )
        ]),
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
