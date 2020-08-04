import 'package:first_app/screen/home/widgets/alertdialog.dart';
import 'package:first_app/screen/home/widgets/aspectratio.dart';
import 'package:first_app/screen/home/widgets/colorfilter.dart';
import 'package:first_app/screen/home/widgets/divider.dart';
import 'package:first_app/screen/home/widgets/flexible.dart';
import 'package:first_app/screen/home/widgets/ignorepointer.dart';
import 'package:first_app/screen/home/widgets/richtext.dart';
import 'package:first_app/screen/home/widgets/selectabletext.dart';
import 'package:first_app/screen/home/widgets/sizedbox.dart';
import 'package:first_app/screen/home/widgets/spacer.dart';
import 'package:first_app/screen/home/widgets/tooltip.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:first_app/services/auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:first_app/screen/home/home.dart';

class WidgetFile extends StatefulWidget {
  @override
  _WidgetFileState createState() => _WidgetFileState();
}

class _WidgetFileState extends State<WidgetFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.person_pin, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop()),
              ],
            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Widget Page',
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
                  color: Color.fromRGBO(255,255,255,0.35),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)) 
		), 
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      alignment: FractionalOffset.center,
                      color: Colors.white,
                      child: ListView(
                        children: <Widget>[
                          Container(
                            height: 800,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AlertDialogWidget()));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        color: Colors.red[900],
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                            child: const Text('ALERT DIALOG',
                                                style: TextStyle(
                                                    color: Colors.white))),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RichTextWidget()));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        color: Colors.deepPurple[800],
                                        padding: const EdgeInsets.all(6),
                                        child: Center(
                                            child: const Text('RICH TEXT',
                                                style: TextStyle(
                                                    color: Colors.white))),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SelectableTextWidget()));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        color: Colors.deepOrange,
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                            child: const Text('SELECTABLE TEXT',
                                                style: TextStyle(
                                                    color: Colors.white))),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FlexibleWidget()));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        color: Colors.pink[400],
                                        padding: const EdgeInsets.all(6),
                                        child: Center(
                                            child: const Text('FLEXIBLE',
                                                style: TextStyle(
                                                    color: Colors.white))),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SpacerWidget()));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        color: Colors.orange[200],
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                            child: const Text('SPACER',
                                                style: TextStyle(
                                                    color: Colors.white))),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DividerWidget()));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        color: Colors.lightGreen[700],
                                        padding: const EdgeInsets.all(6),
                                        child: Center(
                                            child: const Text('DIVIDER',
                                                style: TextStyle(
                                                    color: Colors.white))),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    IgnorePointerWidget()));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        color: Colors.cyan[600],
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                            child: const Text('IGNORE POINTER',
                                                style: TextStyle(
                                                    color: Colors.white))),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ColorFilterWidget()));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        color: Colors.purpleAccent,
                                        padding: const EdgeInsets.all(6),
                                        child: Center(
                                            child: const Text('COLOR FILTER',
                                                style: TextStyle(
                                                    color: Colors.white))),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ToolTipWidget()));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        color: Colors.blue,
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                            child: const Text('TOOL TIP',
                                                style: TextStyle(
                                                    color: Colors.white))),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AspectRatioWidget()));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        color: Colors.black,
                                        padding: const EdgeInsets.all(6),
                                        child: Center(
                                            child: const Text('ASPECT RATIO',
                                                style: TextStyle(
                                                    color: Colors.white))),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SizedBoxWidget()));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        color: Colors.brown,
                                        padding: const EdgeInsets.all(8),
                                        child: Center(
                                            child: const Text('SIZED BOX',
                                                style: TextStyle(
                                                    color: Colors.white))),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
