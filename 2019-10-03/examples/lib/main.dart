import 'package:flutter/material.dart';

void main() {
  runApp(
    Exercice04(),
  );
}

class Exercice04 extends StatelessWidget {
  const Exercice04({
    Key key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(body : StadiumBorder(side: BorderSide)
    );
  }
}

//Exercice02

class Exercice02 extends StatelessWidget {
  const Exercice02({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
              width: 200,
              height: 500,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

//Exercice01

class Exercice01 extends StatelessWidget {
  const Exercice01({
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
              Band(20, Colors.pink),
              Band(30, Colors.red),
              Band(50, Colors.blue)
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
