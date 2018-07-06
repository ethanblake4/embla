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

  final MaterialColor green = MaterialColor(0xFF6CEA9B, const <int, Color> {
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
  });

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
      primarySwatch: MaterialColor(0xFFFFFFFF, const <int, Color> {
        50:  const Color(0xFFFFFFFF),
        100: const Color(0xFFFFFFFF),
        200: const Color(0xFFFFFFFF),
        300: const Color(0xFFFFFFFF),
        400: const Color(0xFFFFFFFF),
        500: const Color(0xFFFFFFFF),
        600: const Color(0xFFFFFFFF),
        700: const Color(0xFFFFFFFF),
        800: const Color(0xFFFFFFFF),
        900: const Color(0xFFFFFFFF),
      }),
      brightness: Brightness.light,
      accentColor: blue,
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
      primaryColorBrightness: Brightness.dark,
      primaryColor: const Color(/*0xFF6CEA9B*/0xFF0984E3),
      primaryColorDark: const Color(/*0xFF36754E*/0xFF0584A3),
      textSelectionColor: const Color(/*0xFF6CEA9B*/0xFF0984E3),
      textSelectionHandleColor: const Color(0xFF51B074),
      highlightColor: const Color(0x8CC4F7D7),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
        ),
      )
    ).copyWith(platform: TargetPlatform.iOS),
  );
}

