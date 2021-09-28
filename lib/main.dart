import 'package:blocks/pages/Home.dart';
import 'package:blocks/pages/Login.dart';
import 'package:blocks/provider/auth.dart';
import 'package:provider/provider.dart';

import 'package:blocks/provider/userData.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => UserData()),
        ChangeNotifierProvider(create: (BuildContext context) => Logins()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/homes': (context) => Homes(),
          '/': (context) => Login(),
        },
      ),
    );
  }
}
