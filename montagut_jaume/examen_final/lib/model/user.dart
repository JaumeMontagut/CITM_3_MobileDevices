import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String username;
  String fullName;
  bool isAdmin;
  String id;

  User(
    this.username,
    this.fullName,
    this.isAdmin,
  );

  User.fromFirestore(DocumentSnapshot doc)
      : id = doc.documentID,
        username = doc.data['username'],
        fullName = doc.data['fullName'],
        isAdmin = doc.data['isAdmin'];
}

List<User> toUsersList(QuerySnapshot query) {
  return query.documents.map((doc) => User.fromFirestore(doc)).toList();
}
