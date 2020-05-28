import 'package:flutter/material.dart';
import 'package:user_preferencesapp/src/widgets/menu_widget.dart';

class SettingsPage extends StatelessWidget {

  static final String routeName = 'settings';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 
      Text('Settings'),
      ),
      drawer: MenuWidget(),
      body: Center(
        child: Text('Settings page'),
      )
    );
  }
}