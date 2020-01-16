import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:examen_final/model/user.dart';
//import 'package:examen_final/db.dart' as db;

class PageEditUser extends StatefulWidget {
  PageEditUser(this.currUser);
  final User currUser;

  @override
  _PageEditUserState createState() => _PageEditUserState();
}

class _PageEditUserState extends State<PageEditUser> {
  TextEditingController _usernameController;
  TextEditingController _fullNameController;
  bool _isAdmin;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _usernameController.text = widget.currUser.username;
    _fullNameController = TextEditingController();
    _fullNameController.text = widget.currUser.fullName;
    _isAdmin = widget.currUser.isAdmin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final db = Firestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new user'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              db.collection('users').document(widget.currUser.id).updateData(
                {
                  'username': _usernameController.text,
                  'fullName': _fullNameController.text,
                  'isAdmin': _isAdmin,
                },
              );
              Navigator.of(context).pop();
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
        ],
      ),
    );
  }
}
