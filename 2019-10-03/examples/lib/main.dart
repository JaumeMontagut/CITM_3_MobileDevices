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
              Expanded(
                child: Container(
                  color: Colors.pink,
                  child: Center(
                    child: Text(
                      "20%",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                flex: 20,
              ),
              Expanded(
                child: Container(
                  color: Colors.purple,
                  child: Center(
                    child: Text(
                      "30%",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                flex: 30,
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      "50%",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                flex: 50,
              ),
            ]),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}
