import 'package:flutter/material.dart';
import 'package:lamp/lamp.dart';

void main() {
  runApp(
    CalendarExercice(),
  );
}

class CalendarExercice extends StatefulWidget {
  @override
  _CalendarExerciceState createState() => _CalendarExerciceState();
}

class _CalendarExerciceState extends State<CalendarExercice> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Container(
          decoration: ShapeDecoration(
            shape : RoundedRectangleBorder(),
            gradient: RadialGradient(
              colors: [
                Colors.blue[100],
                Colors.blue[400],
                Colors.purple[500],
              ],
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DayWidget(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (isOn) {
              Lamp.turnOff();
              isOn = false;
            } else {
              Lamp.turnOn();
              isOn = true;
            }
          }
        ),
      ),
    );
  }
}

class DayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 100,
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        gradient: LinearGradient(
          colors: [
            Colors.blue[100],
            Colors.blue[400],
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

// class Exercice04 extends StatelessWidget {
//   const Exercice04({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home:Scaffold(body : StadiumBorder(side: BorderSide)
//     );
//   }
// }

//Exercici03
class Exercice03 extends StatelessWidget {
  const Exercice03({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.yellow,
            body: Center(
                child: Row(
              children: <Widget>[
                Container(
                    width: 50,
                    height: 50,
                    decoration: ShapeDecoration(
                      color: Colors.red,
                      shape: CircleBorder(),
                    ),
                    child: Center(child: Text('0'))),
              ],
            ))));
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
