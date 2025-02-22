import 'package:flutter/material.dart';
import 'package:lamp/lamp.dart';

void main() {
  runApp(ExpandableTextExercice());
}

//15/10/2019

class ExpandableTextExercice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.grey[100],
      body: ExpandableText(),
    ));
  }
}

class ExpandableText extends StatefulWidget {
  static final int maxLinesExpanded = 100;
  static final int maxLinesCompressed = 10;

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  String textString =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin consectetur gravida eros, ut ullamcorper tortor molestie eget. Duis sit amet tincidunt nisi, sed blandit nisl. Ut iaculis, sem quis fermentum consequat, leo quam hendrerit sapien, eu tempor justo erat sit amet purus. Proin id quam vitae velit finibus molestie vel eget enim. Praesent mattis lacus velit, sed vestibulum sapien luctus et. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec nec elit sodales, pulvinar felis eget, egestas neque. Phasellus egestas, quam eget cursus pretium, magna metus luctus nulla, cursus dapibus augue neque sed velit. Aliquam sagittis lacus nec nisl pretium porttitor. In aliquet felis a nibh tempor hendrerit. Pellentesque velit justo, lobortis eu tellus a, facilisis luctus augue.";

  bool expanded = false;

  int currMaxLines = ExpandableText.maxLinesExpanded;

  void expandText() {
    setState(() {
      expanded = !expanded;
      currMaxLines = expanded
          ? ExpandableText.maxLinesExpanded
          : ExpandableText.maxLinesCompressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          textString,
          maxLines: currMaxLines,
        ),
        FlatButton(
            onPressed: expandText,
            child: Container(
              color: Colors.yellow,
              child: Text(
                "Button",
              ),
            ),
            color: Colors.blue),
      ],
    );
  }
}

//10/10/2019

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
            shape: RoundedRectangleBorder(),
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
        floatingActionButton: FloatingActionButton(onPressed: () {
          if (isOn) {
            Lamp.turnOff();
            isOn = false;
          } else {
            Lamp.turnOn();
            isOn = true;
          }
        }),
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
