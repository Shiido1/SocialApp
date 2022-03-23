import 'package:flutter/cupertino.dart';

BuildContext? globalContext;

class Routes {
  static const String board = '/board';
  static const String getStarted = '/getStarted';
  static const String verifyPin = '/verifyPin';
  static const String username = '/username';
  static const String profile = '/profile';

  static Map<String, Widget Function(BuildContext mainContext)> get getRoutes =>
      {
        board: (BuildContext context) {
          globalContext = context;
          return Container();
        },
      };
}
