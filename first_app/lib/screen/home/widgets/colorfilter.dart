import 'package:flutter/material.dart';
import 'package:first_app/screen/home/home.dart';

class ColorFilterWidget extends StatefulWidget {
  @override
  _ColorFilterWidgetState createState() => _ColorFilterWidgetState();
}

class _ColorFilterWidgetState extends State<ColorFilterWidget> {
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
                    'Color Filtered',
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
                          /* color: Colors.white,  */
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
                                      'A color filter is a function that takes two colors, and outputs one color. When applied during compositing, it is independently applied to each pixel of the layer being drawn before the entire layer is merged with the destination.',
                                      style: TextStyle(
                                        fontSize: 18,
										color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Container(
                                      margin: const EdgeInsets.all(20),
                                      width: 250,
                                      height: 250,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black38,
                                                blurRadius: 10)
                                          ],
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/tomato.png'),
                                              fit: BoxFit.cover,
                                              colorFilter: ColorFilter.mode(
                                                  Colors.orange
                                                      .withOpacity(0.5),
                                                  BlendMode.darken))),
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
