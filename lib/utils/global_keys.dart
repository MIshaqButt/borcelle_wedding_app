import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();
final brightness =
    WidgetsBinding.instance.platformDispatcher.platformBrightness;