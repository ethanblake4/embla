import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AppState {

  static final AppState _appstate = new AppState._internal();
  static const String appFont = 'Renner';

  static const bool isDesktop = true;

  static final bool isDark = true;

  FirebaseStorage storage;

  GoogleSignInAccount currentUser;
  GoogleSignInAuthentication auth;

  int accountDocLastUpdate = 0;
  DocumentSnapshot accountDoc;
  bool forceAccountDocUpdate = false;

  factory AppState() {
    return _appstate;
  }

  AppState._internal();
}