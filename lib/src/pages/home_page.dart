import 'package:flutter/material.dart';
import 'package:user_preferencesapp/src/share_preferences/preferences_user.dart';
import 'package:user_preferencesapp/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    prefs.lastOpenedPage = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
      title: Text('User preferences'),
      backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Secondary color:${prefs.secondaryColor}'),
          Divider(),
          Text('Genre: ${prefs.genre}'),
          Divider(),
          Text('User name:${prefs.userName}'),
          Divider()
        ],
      ),

    );
  }

}