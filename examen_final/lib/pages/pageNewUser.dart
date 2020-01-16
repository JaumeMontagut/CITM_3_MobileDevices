import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:examen_final/db.dart' as db;

class PageNewUser extends StatefulWidget {
  @override
  _PageNewUserState createState() => _PageNewUserState();
}

class _PageNewUserState extends State<PageNewUser> {
  TextEditingController _usernameController;
  TextEditingController _fullNameController;
  bool _isAdmin = false;
  @override
  void initState() {
    _usernameController = TextEditingController();
    _fullNameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final db = Firestore.instance;
    return Scaffold(
      appBar: AppBar(
        // leading: Row(
        //   children: <Widget>[
        //     Icon(Icons.arrow_back_ios),
        //     Text('DISCARD'),
        //   ],
        // ), //TODO: Add the ability to go back
        title: Text('Add new user'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              db.collection('users').document().setData(
                {
                  'username': _usernameController.text,
                  'fullName': _fullNameController.text,
                  'isAdmin': _isAdmin,
                },
              );
            },
            child: Text(
              'SAVE',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      //body: Text('Hello'),
      body: Column(
        children: <Widget>[
          Text('Username'),
          TextField(
            controller: _usernameController,
          ),
          Text('Full name'),
          TextField(
            controller: _fullNameController,
          ),
          Text('Admin'),
          Checkbox(
            value: _isAdmin,
            onChanged: (value) {
              setState(
                () {
                  _isAdmin = value;
                },
              );
            },
          )
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: <Widget>[
          //     Text('Username:'),
          //     TextField(controller: _usernameController),
          //   ],
          // ),
          // Row(
          //   children: <Widget>[
          //     Text('Full name:'),
          //     TextField(controller: _fullNameController),
          //   ],
          // ),
          // Row(
          //   children: <Widget>[
          //     Text('Admin:'),
          //     Checkbox(
          //       value: _isAdmin,
          //       onChanged: (value) {
          //         _isAdmin = value;
          //       },
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
