import 'package:cloud_firestore/cloud_firestore.dart';
import 'model/user.dart';

Stream<List<User>> getUsers(){
  return Firestore.instance.collection('users').snapshots().map(toUsersList);
}