import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dynamic db = Firestore.instance;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: StreamBuilder(
            stream: db.document('users/tEt1dWtSmieUCdvKq7od').snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return RaisedButton(
                onPressed: () {
                  db.document('users/tEt1dWtSmieUCdvKq7od').updateData(
                    {
                      // 'name' : 'Joan',
                      // 'age': 18,
                      'flirtLvl': null,
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
