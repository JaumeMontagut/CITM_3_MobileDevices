import 'package:flutter/material.dart';
import 'package:examples/horari.dart';

void main() {
  runApp(ScheduleApp());
}

class ScheduleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ChooseSchedule());
  }
}

class ChooseSchedule extends StatefulWidget {
  @override
  _ChooseScheduleState createState() => _ChooseScheduleState();
}

class _ChooseScheduleState extends State<ChooseSchedule> {
  //The items that will be displayed
  List<int> selectedSchedulesIndex = new List<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey,
            child: Row(
              children: <Widget>[
                Text("Horari escollit"),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(
                      MaterialPageRoute(
                        builder: (context) => ChooseSchedulePage(selectedSchedulesIndex),
                      ),
                    )
                        .then(
                      (selectedCheckbox) {
                        if (selectedCheckbox != null) {
                          setState(() {
                            selectedSchedulesIndex.clear();
                            for (int i = 0; i < totsElsHoraris.length; ++i) {
                              if (selectedCheckbox[i] == true) {
                                selectedSchedulesIndex.add(i);
                              }
                            }
                          });
                        }
                      },
                    );
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.edit),
                      Text("Canviar"),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: selectedSchedulesIndex.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(totsElsHoraris[selectedSchedulesIndex[index]].toString()),
                  trailing: Icon(Icons.close),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey[300],
                  height: 1,
                  thickness: 1,
                );
              },
            ),
          )
        ],
      ),
      appBar: AppBar(
        title: Text("Consultes"),
      ),
    );
  }
}

class ChooseSchedulePage extends StatefulWidget {
  final List<int> selectedSchedules;

  ChooseSchedulePage(this.selectedSchedules);

  @override
  _ChooseSchedulePageState createState() => _ChooseSchedulePageState();
}

class _ChooseSchedulePageState extends State<ChooseSchedulePage> {
  List<bool> selectedCheckboxs = new List();

  @override
  void initState() {
    for (int i = 0; i < totsElsHoraris.length; ++i)
    {
      selectedCheckboxs.add(false);
    }
    for(int i = 0; i < widget.selectedSchedules.length; ++i)
    {
      selectedCheckboxs[widget.selectedSchedules[i]] = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escull horari"),
        actions: <Widget>[
          FlatButton(
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop(selectedCheckboxs);
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: totsElsHoraris.length,
        itemBuilder: (context, index) {
          final Horari horari = totsElsHoraris[index];
          return ListTile(
            leading: Checkbox(
              value: selectedCheckboxs[index],
              onChanged: (newValue) {
                setState(
                  () {
                    selectedCheckboxs[index] = newValue;
                  },
                );
              },
            ),
            title: Text(
              horari.toString(),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[300],
            height: 1,
            thickness: 1,
          );
        },
      ),
    );
  }
}
