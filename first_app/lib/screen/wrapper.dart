import 'package:first_app/models/user.dart';
import 'package:first_app/screen/authenticate/authenticate.dart';
import 'package:first_app/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return home or authenticate
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
