import 'package:exemples/model/song.dart';
import 'package:exemples/model/songlist.dart';
import 'package:exemples/screens/newsong_screen.dart';
import 'package:flutter/material.dart';

class SongListScreen extends StatefulWidget {
  @override
  _SongListScreenState createState() => _SongListScreenState();
}

class _SongListScreenState extends State<SongListScreen> {
  SongList _model;

  @override
  void initState() {
    _model = SongList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Song List'),
      ),
      body: ListView.separated(
        itemCount: _model.numSongs,
        itemBuilder: (context, index) {
          final Song song = _model.getSong(index);
          return ListTile(
            title: Text(song.title),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(song.band),
                Text('${song.year}'),
              ],
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
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => NewSongScreen(),
            ),
          )
              .then((songMap) {
            print(songMap);
            if (songMap != null) {
              setState(() {
                _model.addSong(Song(
                  songMap['title'],
                  songMap['band'],
                  songMap['year'],
                ));
              });
            }
          });
        },
      ),
    );
  }
}
