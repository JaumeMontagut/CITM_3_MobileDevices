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

class MainWindow extends StatefulWidget {
  @override
  _MainWindowState createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> {
  CounterList counterList;

  @override
  void initState() {
    counterList = CounterList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
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
                      counterList.counters[index].count++;
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
      appBar: AppBar(
        title: Text('Counter List'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: (() {
              setState(
                () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Confim"),
                      content:
                          Text("Are you sure you want to reset the counters?"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Cancel"),
                          onPressed: () {
                             //Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text("Reset"),
                          onPressed: () {
                            for (Counter counter in counterList.counters) {
                              counter.count = 0;
                            }
                            //Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
                  );
                },
              );
            }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //Go to the next screen
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => NewCounterPage(),
            ),
          )
              .then(
            (newWord) {
              if (newWord != null) {
                setState(
                  () {
                    counterList.counters.add(
                      Counter(newWord),
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}

//Do I have to create another Scaffold to have the app bar?
//Stateful because we need the text editing controllers
class NewCounterPage extends StatefulWidget {
  @override
  _NewCounterPageState createState() => _NewCounterPageState();
}

class _NewCounterPageState extends State<NewCounterPage> {
  TextEditingController _wordCtrl;

  @override
  void initState() {
    _wordCtrl = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Counter'),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: _wordCtrl,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            FlatButton(
              child: Text('SAVE'),
              color: Colors.grey,
              onPressed: () {
                Navigator.of(context).pop(_wordCtrl.text);
              },
            )
          ],
        ));
  }
}
