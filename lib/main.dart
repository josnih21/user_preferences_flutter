import 'package:flutter/material.dart';
import 'package:user_preferencesapp/src/pages/home_page.dart';
import 'package:user_preferencesapp/src/pages/settings_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User preferences',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName : (BuildContext context) => HomePage(),
        SettingsPage.routeName : (BuildContext context) => SettingsPage(),
      },
    );
  }
}