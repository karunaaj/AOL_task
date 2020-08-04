import 'package:first_app/models/profile.dart';
import 'package:first_app/screen/home/widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:first_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:first_app/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:first_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:first_app/models/profile.dart';
import 'package:first_app/screen/home/profilelist.dart';
import 'package:first_app/screen/home/editform.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _pass = '';
  String em = '';
  String email = '';
  String uid = '';

  //final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthService _auth = AuthService();

  @override
  Future<bool> loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final pass = preferences.getString("passValue") ?? 0;
    final email = preferences.getString("emailValue") ?? 0;
    setState(() {
      this.em = email;
      this._pass = pass;
    });
  }

  void initState() {
    loadData();
    super.initState();
  }

  void _showEditPanel() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            child: EditForm(),
          );
        });
  }

  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final GoogleSignIn _gSignIn = GoogleSignIn();
    return StreamProvider<List<Profile>>.value(
      value: DatabaseService().profiles,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fish_tank.png'), fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.home, color: Colors.white),
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => WidgetFile()))),
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.white),
                      onPressed: () => _showEditPanel(),
                    ),
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.signOutAlt,
                          color: Colors.white),
                      onPressed: () async {
                        _gSignIn.signOut();
                        await _auth.signOut();
                      },
                    ),
                  ],
                ),
                onPressed: () async {
                  _gSignIn.signOut();
                  await _auth.signOut();
                },
              ),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Profile Page',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(25), child: ProfileList()),
                ),
              ),
              SizedBox(height: 100),
              Card(
                margin: EdgeInsets.fromLTRB(35, 5, 35, 0),
                color: Colors.white,
                child: ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.pink[600],
                      child: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Email',
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      user.email,
                      style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(height: 20),
              Card(
                margin: EdgeInsets.fromLTRB(35, 5, 35, 0),
                color: Colors.white,
                child: ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.pink[600],
                      child: Icon(Icons.perm_identity, color: Colors.white),
                    ),
                    title: Text(
                      'User ID',
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      user.uid,
                      style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
