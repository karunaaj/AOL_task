import 'package:first_app/screen/authenticate/forgotpass.dart';
import 'package:first_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:first_app/screen/ProfileScreen.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Google sign In start

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn(BuildContext context) async {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Signing In'),
    ));

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: (await googleUser.authentication).idToken,
        accessToken: (await googleUser.authentication).accessToken);

    FirebaseUser userDetails =
        (await _firebaseAuth.signInWithCredential(credential)) as FirebaseUser;
    ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);

    List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);

    UserDetails details = new UserDetails(
        userDetails.providerId,
        userDetails.email,
        userDetails.displayName,
        userDetails.uid,
        providerData);

    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => ProfileScreen(detailsUser: details),
        ));

    debugPrint('Signed In');

    return userDetails;
  }

  // Google sign In end

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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

  void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
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
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.data_usage, color: Colors.white),
                        SizedBox(width: 5),
                        Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPass()));
                    },
                  ),
                  FlatButton(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.supervised_user_circle, color: Colors.white),
                        SizedBox(width: 5),
                        Text(
                          'New User',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      widget.toggleView();
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Login',
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
                          topRight: Radius.circular(5))),
					  
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 60),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(153, 0, 76, .37),
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
                                  obscureText: true,
                                  validator: (val) => val.length < 6
                                      ? 'Enter a Password 6 characters long'
                                      : null,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: Colors.red[900]),
                          child: Center(
                            child: FlatButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FaIcon(FontAwesomeIcons.envelope,
                                      color: Colors.white),
                                  SizedBox(width: 10),
                                  Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  dynamic result =
                                      await _auth.signInWithEmailAndPassword(
                                          email, password);
                                  setData();
                                }
                                _showScaffold("Invalid Email or Password");
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: Colors.green[900]),
                          child: Center(
                            child: FlatButton(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FaIcon(FontAwesomeIcons.google,
                                      color: Colors.white),
                                  SizedBox(width: 10),
                                  Text(
                                    'SignIn with Google',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                _signIn(context)
                                    .then((FirebaseUser user) => print(user))
                                    .catchError((e) => print(e));
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

class UserDetails {
  final String providerDetails;
  final String userEmail;
  final String userName;
  final String userUID;
  final List<ProviderDetails> providerData;
  UserDetails(this.providerDetails, this.userEmail, this.userName, this.userUID,
      this.providerData);
}

class ProviderDetails {
  final String providerDetails;
  ProviderDetails(this.providerDetails);
}
