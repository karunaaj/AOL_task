import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screen/authenticate/sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileScreen extends StatelessWidget {
  final UserDetails detailsUser;

  ProfileScreen({Key key, @required this.detailsUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoogleSignIn _gSignIn = GoogleSignIn();

    return Scaffold(
      appBar: AppBar(
        //title: Text(detailsUser.userName),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.signOutAlt,
              size: 20,
              color: Colors.white,
            ),
            onPressed: () {
              _gSignIn.signOut();
              print('You are Signed Out');
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*CircleAvatar(
              backgroundImage: NetworkImage(detailsUser.photoUrl),
              radius: 50,
            ),
            SizedBox(height: 15,),
            Text(
              'Name : ' +detailsUser.userName,
            ),
            SizedBox(height: 15,),
            Text(
              'Name : ' +detailsUser.userEmail,
            ),
            SizedBox(height: 15,),
            Text(
              'Name : ' +detailsUser.providerDetails,
            ),*/
          ],
        ),
      ),
    );
  }
}
