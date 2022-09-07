import 'package:flutter/material.dart';

CustomTheme customTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  bool _isDark = false;

  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.amber,
      //     accentColor: Colors.orange,
      fontFamily: 'Raleway',
      textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
          ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.black,
        )
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Raleway',
      textTheme: ThemeData.dark().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromARGB(255, 33, 236, 243),
            ),
            bodyText2: const TextStyle(
              color:  Color.fromARGB(255, 33, 236, 243),
            ),
          ),
      buttonTheme: ButtonThemeData(
          buttonColor: Colors.white,
          splashColor: Colors.white,
          // textTheme: TextTheme()
        )
    );
  }
}
