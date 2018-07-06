import 'package:flutter/material.dart';
import 'package:embla/util/auth.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({this.loginComplete});

  final VoidCallback loginComplete;

  LoginPageState createState() => LoginPageState();

}

class LoginPageState extends State<LoginPage> {

  bool isComplete = false;

  Widget build(BuildContext context) {
    return new SafeArea(
        child: Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            child: Column(
              children: <Widget>[
                /*Padding(
                  padding: EdgeInsets.only(top: 80.0, bottom: 20.0),
                  child: Text(
                    'Embla.',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                SizedBox(
                    width: 60.0, height: 4.0, child: Material(type: MaterialType.canvas, color: Colors.greenAccent)),*/
                Padding(padding: EdgeInsets.only(top: 34.0)),
                RaisedButton(
                    color: Colors.white,
                    colorBrightness: Brightness.light,
                    onPressed: isComplete
                        ? null
                        : () {
                            initialSignIn().then((z) {
                              setState(() {
                                isComplete = true;
                              });
                              widget.loginComplete();
                            });
                          },
                    elevation: 10.0,
                    highlightElevation: 16.0,
                    child: Row(children: [
                      Image.asset('assets/google_logo.png', width: 24.0, height: 24.0,),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
                          child: Text(isComplete ? 'SIGNED IN' : 'SIGN IN',))
                    ], mainAxisSize: MainAxisSize.min)),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            )));
  }
}
