import 'package:flutter/material.dart';
import 'package:user_preferencesapp/src/pages/home_page.dart';
import 'package:user_preferencesapp/src/pages/settings_page.dart';
import 'package:user_preferencesapp/src/share_preferences/preferences_user.dart';
 
void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPref();
  runApp(MyApp());
  
}
 
class MyApp extends StatelessWidget {
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User preferences',
      initialRoute: prefs.lastOpenedPage,
      routes: {
        HomePage.routeName : (BuildContext context) => HomePage(),
        SettingsPage.routeName : (BuildContext context) => SettingsPage(),
      },
    );
  }
}