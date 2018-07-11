import 'package:flutter/material.dart';
import 'items.dart';
import 'init.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'app_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter/foundation.dart';

void main() {

  AppState().storage = new FirebaseStorage(
      storageBucket: 'gs://embla-889b2.appspot.com');

  runApp(EmblaApp());
}

class EmblaApp extends StatelessWidget {

  final TextStyle textBase = TextStyle(fontFamily: 'Renner');

  final MaterialColor blue = MaterialColor(0xFF0984E3, const <int, Color> {
    50:  const Color(0xFF0984E3),
    100: const Color(0xFF0984E3),
    200: const Color(0xFF0984E3),
    300: const Color(0xFF0984E3),
    400: const Color(0xFF0984E3),
    500: const Color(0xFF0984E3),
    600: const Color(0xFF0984E3),
    700: const Color(0xFF0984E3),
    800: const Color(0xFF0984E3),
    900: const Color(0xFF0984E3),
  });

  /*final MaterialColor green = MaterialColor(0xFF6CEA9B, const <int, Color> {
    50:  const Color(0xFFE2FBEB),
    100: const Color(0xFFC4F7D7),
    200: const Color(0xFFA7F2C3),
    300: const Color(0xFF89EEAF),
    400: const Color(0xFF78EC9F),
    500: const Color(0xFF6CEA9B),
    600: const Color(0xFF51B074),
    700: const Color(0xFF36754E),
    800: const Color(0xFF275C36),
    900: const Color(0xFF1B3A27),
  });*/

  final MaterialColor purple = MaterialColor(0xFF271BC1, const <int, Color> {
    50:  const Color(0xFFD8DDFF),
    100: const Color(0xFFD8DDFF),
    200: const Color(0xFFD8DDFF),
    300: const Color(0xFF4C43CE),
    400: const Color(0xFF4C43CE),
    500: const Color(0xFF4C43CE),
    600: const Color(0xFF4C43CE),
    700: const Color(0xFF271BC1),
    800: const Color(0xFF271BC1),
    900: const Color(0xFF271BC1),
  });

  final MaterialColor yellow = MaterialColor(0xFFFFC918, const <int, Color> {
    50:  const Color(0xFFFFC918),
    100: const Color(0xFFFFC918),
    200: const Color(0xFFFFC918),
    300: const Color(0xFFFFC918),
    400: const Color(0xFFFFC918),
    500: const Color(0xFFFFC918),
    600: const Color(0xFFFFC918),
    700: const Color(0xFFFFC918),
    800: const Color(0xFFFFC918),
    900: const Color(0xFFFFC918),
  });

  final Color purpleColorLight = const Color(0xFFD8DDFF);
  final Color purpleColor = const Color(0xFF4C43CE);
  final Color purpleColorDark = const Color(0xFF271BC1);
  final Color yellowColor = const Color(0xFFFFC918);

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Embla',
    routes: new Map.fromIterable(
        buildItems(),
        key: (dynamic item) => item.routeName,
        value: (dynamic item) => item.buildWidget
    ),
    home: InitPage(),
    theme: new ThemeData(
      primarySwatch: purple,
      brightness: Brightness.light,
      accentColor: yellow,
      textTheme: TextTheme(
        title: textBase.copyWith(
            fontSize: 45.0,
            fontWeight: FontWeight.bold
        ),
        subhead: textBase.copyWith(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
        ),
        body1: textBase.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.normal
        ),
        button: textBase.copyWith(
          fontWeight: FontWeight.bold
        ),
        display1: textBase.copyWith(
          fontSize: 20.0,
            fontWeight: FontWeight.bold
        ),
      ),
      primaryColorBrightness: Brightness.light,
      primaryColor: purpleColor,
      primaryColorLight: purpleColorLight,
      primaryColorDark: purpleColorDark,
      textSelectionColor: purpleColorLight,
      textSelectionHandleColor: purpleColorLight,
      highlightColor: purpleColorLight,
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
        ),
      )
    ).copyWith(platform: TargetPlatform.iOS),
  );
}

