import 'package:flutter/material.dart';
import 'package:first_app/models/profile.dart';

class ProfileTile extends StatelessWidget {
  final Profile profile;

  ProfileTile({this.profile});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.verified_user, color: Colors.white),
          radius: 20,
          backgroundColor: Colors.indigo[900],
        ),
        title: Text(profile.name),
        subtitle: Text('${profile.age} years'),
      ),
    );
  }
}
