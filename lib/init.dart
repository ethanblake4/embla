import 'package:flutter/material.dart';
import 'package:embla/util/auth.dart';
import 'app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InitPage extends StatefulWidget {

  @override
  _InitPageState createState() => new _InitPageState();
}

class _InitPageState extends State<InitPage> {

  @override
  void initState() {
    super.initState();

    signInWithGoogle().then((user) {

      if(user == null) {
        Navigator.of(context).pushReplacementNamed('/intro');
        return;
      }

      var app = new AppState();

      app.currentUser = user.item1;
      app.auth = user.item2;

      Firestore.instance.collection('users').document(user.item1.email);

      Navigator.of(context).pushReplacementNamed('/intro');

    });

  }

  Widget build(BuildContext context) => Container();
}