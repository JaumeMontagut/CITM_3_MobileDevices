import 'package:examen_final/pages/pageEditUser.dart';
import 'package:examen_final/pages/pageNewUser.dart';
import 'package:flutter/material.dart';
import 'db.dart' as db;
import 'model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  void _deleteUser(User currUser) {
    Firestore.instance.collection('users').document(currUser.id).delete();
  }

  void _editUser(BuildContext context, User currUser) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PageEditUser(currUser),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => PageNewUser(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: Text('Contact management'),
      ),
      body: Container(
        child: StreamBuilder(
          stream: db.getUsers(),
          builder: (context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  style: TextStyle(
                    backgroundColor: Colors.red,
                  ),
                ),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                User currUser = snapshot.data[index];
                return Dismissible(
                  background: Container(
                    color: Colors.red,
                  ),
                  secondaryBackground: Container(
                    color: Colors.green,
                  ),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      _deleteUser(currUser);
                    } else if (direction == DismissDirection.endToStart) {
                      _editUser(context, currUser);
                    }
                  },
                  key: ValueKey(currUser.id),
                  child: ListTile(
                    title: Text(
                      snapshot.data[index].username,
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        currUser.isAdmin ? Icon(Icons.star) : Container(),
                        Text(currUser.fullName),
                      ],
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.mode_edit,
                            ),
                            onPressed: () {
                              _editUser(context, currUser);
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                            ),
                            onPressed: () {
                              _deleteUser(currUser);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
