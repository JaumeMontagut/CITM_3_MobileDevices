import 'package:flutter/material.dart';
import 'package:examples/CounterList.dart';

void main() {
  runApp(ExamenPractice());
}

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ExamenPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainWindow());
  }
}

class MainWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CounterListPage(),
    );
  }
}

class CounterListPage extends StatefulWidget {
  @override
  _CounterListPageState createState() => _CounterListPageState();
}

class _CounterListPageState extends State<CounterListPage> {
  CounterList counterList;
  double sideLength = 50;

  @override
  void initState() {
    counterList = CounterList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
        counterList.counters.length,
        (index) {
          return Card(
            color: Colors.yellow,
            child: InkWell(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 80,
                    child: Text('${counterList.counters[index].count}'),
                  ),
                  Expanded(
                    flex: 20,
                    child: Text(
                      counterList.counters[index].word,
                    ),
                  ),
                ],
              ),
              onTap: () {
                setState(
                  () {
                    sideLength == 50 ? sideLength = 100 : sideLength = 50;
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
