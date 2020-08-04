import 'package:flutter/material.dart';
import 'package:first_app/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  // TextField text
  String email = '';
  String password = '';
  String error = '';
  var passControl = new TextEditingController();
  var emailControl = new TextEditingController();

  void setData() {
    String email = emailControl.text;
    String pass = passControl.text;
    saveData(pass, email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fish_tank.png'), fit: BoxFit.cover)),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              FlatButton(
                child: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  widget.toggleView();
                },
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(height: 50),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 7),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255,255,255,0.35),
                    borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5))
					), 
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 80),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(153, 0, 76, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                )
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(2),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Enter email..',
                                      hintStyle: TextStyle(color: Colors.blue)),
                                  controller: emailControl,
                                  validator: (val) =>
                                      val.isEmpty ? 'Enter an Email' : null,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(2),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Enter password..',
                                      hintStyle: TextStyle(color: Colors.blue)),
                                  controller: passControl,
                                  validator: (val) => val.length < 6
                                      ? 'Enter Password 6 characters long'
                                      : null,
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 70),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.blue[900]),
                          child: Center(
                            child: FlatButton(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                          email, password);
                                  setData();
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool> saveData(String pass, String email) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString("emailValue", email);
  await preferences.setString("passValue", pass);
}
