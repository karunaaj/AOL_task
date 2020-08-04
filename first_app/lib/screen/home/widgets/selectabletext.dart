import 'package:flutter/material.dart';
import 'package:first_app/screen/home/home.dart';

class SelectableTextWidget extends StatefulWidget {
  @override
  _SelectableTextWidgetState createState() => _SelectableTextWidgetState();
}

class _SelectableTextWidgetState extends State<SelectableTextWidget> {
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
                    'Selectable Text',
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
                         /* color: Colors.white,     */
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
                                      'SelectableText Widget in Flutter lets the user Select/Copy the text on the UI. The normal Text Widget in Flutter will not allow a copy/select feature(By double-tapping on the text, we can either select/copy the text).',
                                      style: TextStyle(
                                        fontSize: 18,
										color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    SelectableText.rich(TextSpan(
                                        text: 'Hello',
                                        style: TextStyle(fontSize: 40.0,
										       color: Colors.black,
											   ),
										
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: ' Every',
                                              style:
                                                  TextStyle(color: Colors.red)),
                                          TextSpan(
                                              text: ' One',
                                              style:
                                                  TextStyle(color: Colors.red)),
                                        ])),
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
