import 'package:flutter/material.dart';
import 'package:first_app/screen/home/home.dart';

class AspectRatioWidget extends StatefulWidget {
  @override
  _AspectRatioWidgetState createState() => _AspectRatioWidgetState();
}

class _AspectRatioWidgetState extends State<AspectRatioWidget> {
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
                    'Aspect Ratio',
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
                                      'A widget that attempts to size the child to a specific aspect ratio. The widget first tries the largest width permitted by the layout constraints. The height of the widget is determined by applying the given aspect ratio to the width, expressed as a ratio of width to height.',
                                      style: TextStyle(
                                        fontSize: 18,
					color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Card(
                                      elevation: 3.0,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            child: AspectRatio(
                                              aspectRatio: 16 / 9,
                                              child: Image(
                                                image: AssetImage(
                                                    'assets/tomato.png'),
                                                fit: BoxFit.fill, 
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
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
