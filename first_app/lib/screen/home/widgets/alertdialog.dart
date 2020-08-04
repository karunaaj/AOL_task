import 'package:flutter/material.dart';
import 'package:first_app/screen/home/home.dart';

class AlertDialogWidget extends StatefulWidget {
  @override
  _AlertDialogWidgetState createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  @override
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert Dialog Box'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a Demo Alert Dialog.'),
                Text('To see further widgets cancel the dialog box!'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
                    'Alert Dialog',
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
                          /* color: Color.fromRGBO(255,255,255,0.35), */
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
                                      'An alert dialog informs the user about situations',
                                      style: TextStyle(
					color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      'that require acknowledgement. An alert dialog has an optional title and an optional list of actions. The title is displayed above the content and the actions are displayed below the content.',
                                      style: TextStyle(
					color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    RaisedButton(
                                      color: Colors.blue[500],
				      shape: RoundedRectangleBorder(
  				      borderRadius: BorderRadius.circular(18.0),
  				      side: BorderSide(color: Colors.black)
					),
                                      child: Text(
                                        'Show Dialog',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                      onPressed: () => _showMyDialog(),
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
