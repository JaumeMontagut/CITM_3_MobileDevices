import 'package:flutter/material.dart';

class NewSongScreen extends StatefulWidget {
  @override
  _NewSongScreenState createState() => _NewSongScreenState();
}

class _NewSongScreenState extends State<NewSongScreen> {
  TextEditingController _titleCtrl, _bandCtrl, _yearCtrl;

  @override
  void initState() {
    _titleCtrl = TextEditingController();
    _bandCtrl = TextEditingController();
    _yearCtrl = TextEditingController(
      text: DateTime.now().year.toString(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Song...'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _titleCtrl,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _bandCtrl,
              decoration: InputDecoration(labelText: 'Band'),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _yearCtrl,
                    decoration: InputDecoration(
                      labelText: 'Year',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      final year = int.parse(_yearCtrl.text);
                      _yearCtrl.text = '${year + 1}';
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      final year = int.parse(_yearCtrl.text);
                      _yearCtrl.text = '${year - 1}';
                    });
                  },
                ),
              ],
            ),
            Spacer(),
            FlatButton(
              child: Text(
                'SAVE',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.red,
              shape: StadiumBorder(),
              onPressed: () {
                final year = int.parse(_yearCtrl.text);
                Navigator.of(context).pop({
                  'title': _titleCtrl.text,
                  'band': _bandCtrl.text,
                  'year': year,
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
