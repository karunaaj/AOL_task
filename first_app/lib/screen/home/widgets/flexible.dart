import 'package:flutter/material.dart';
import 'package:first_app/screen/home/home.dart';

class FlexibleWidget extends StatefulWidget {
  @override
  _FlexibleWidgetState createState() => _FlexibleWidgetState();
}

class _FlexibleWidgetState extends State<FlexibleWidget> {
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop())
              ],
            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Flexible',
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
                margin: EdgeInsets.symmetric(horizontal: 7),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255,255,255,0.35),
                    borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5))),

                child: Padding(
                    padding: EdgeInsets.all(25),
                    child: ListView(
                      children: <Widget>[
                        Container(
                          alignment: FractionalOffset.center,
                         /* color: Colors.white, */
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Home()));
                                },
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'A Flexible widget must be a descendant of a Row, Column, or Flex, and the path from the Flexible widget to its enclosing Row, Column, or Flex must contain only StatelessWidgets or StatefulWidgets (not other kinds of widgets, like RenderObjectWidgets).',
                                      style: TextStyle(
                                        fontSize: 18,
					color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Flexible(
                                          child: Container(
                                            height: 30,
                                            width: double.infinity,
                                            color: Colors.pink[400],
                                            child: Center(child: Text('HELLO')),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            height: 15,
                                            width: double.infinity,
                                            color: Colors.yellow[500],
                                            child:
                                                Center(child: Text('EVERYONE')),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
