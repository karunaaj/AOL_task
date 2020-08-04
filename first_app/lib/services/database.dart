import 'dart:convert';

import 'package:first_app/models/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference profileCollection =
      Firestore.instance.collection('profiles');
  String user1 = '';

  Future updateUserData(String name, String age) async {
    return await profileCollection
        .document(uid)
        .setData({'name': name, 'age': age});
  }

  Stream<List<Profile>> get profiles {
    return profileCollection.snapshots().map(_profileListFromSnapshot);
  }

  List<Profile> _profileListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Profile(name: doc.data['name'] ?? '', age: doc.data['age'] ?? '');
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      age: snapshot.data['age'],
    );
  }

  // get user doc stream
  Stream<UserData> get userData {
    return profileCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
