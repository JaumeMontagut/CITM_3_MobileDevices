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
              Band(20, Color.pink),
              Band(30, Color.red),
              Band(50, Color.blue)
            ]),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}

class Band extends StatelessWidget {

  int percent;
  Color color;

  Band(this.percent, this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: color,
        child: Center(
          child: Text(
            percent.toString(),
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
      flex: percent,
    );
  }
}
