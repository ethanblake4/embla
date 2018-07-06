import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'package:tuple/tuple.dart';

final GoogleSignIn _googleSignIn = new GoogleSignIn();

Future<Tuple2<GoogleSignInAccount, GoogleSignInAuthentication>> signInWithGoogle() async {
  // Attempt to get the currently authenticated user
  GoogleSignInAccount currentUser = _googleSignIn.currentUser;
  if (currentUser == null) {
    // Attempt to sign in without user interaction
    currentUser = await _googleSignIn.signInSilently();
  }

  if(currentUser == null) return null;

  final GoogleSignInAuthentication auth = await currentUser.authentication;

  if(auth == null) return null;

  return Tuple2(currentUser, auth);

}

Future<Tuple2<GoogleSignInAccount, GoogleSignInAuthentication>> initialSignIn() async {
  // Attempt to get the currently authenticated user
  GoogleSignInAccount currentUser = _googleSignIn.currentUser;
  if (currentUser == null) {
    // Attempt to sign in without user interaction
    currentUser = await _googleSignIn.signIn();
  }

  if(currentUser == null) return null;

  final GoogleSignInAuthentication auth = await currentUser.authentication;

  if(auth == null) return null;

  return Tuple2(currentUser, auth);

}
