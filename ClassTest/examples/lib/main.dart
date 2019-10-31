import 'package:flutter/material.dart';
import 'package:exemples/screens/songlist_screen.dart';

void main() => runApp(SongListApp());

class SongListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SongListScreen(),
    );
  }
}
