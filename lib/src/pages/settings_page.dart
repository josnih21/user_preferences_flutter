import 'package:flutter/material.dart';
import 'package:user_preferencesapp/src/share_preferences/preferences_user.dart';
import 'package:user_preferencesapp/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor;
  int _genre;
  String _name = 'Pedro';
  TextEditingController _textController;
  final prefs = new UserPreferences();
  @override
  void initState() {
    super.initState();
    _genre = prefs.genre;
    prefs.lastOpenedPage = SettingsPage.routeName;
    _secondaryColor = prefs.secondaryColor;
    _textController = new TextEditingController(text:prefs.userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 
      Text('Settings'),
      backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings',style:TextStyle(fontSize: 45.0,fontWeight: FontWeight.bold)),
          ),
          Divider(),
          SwitchListTile(
            value: _secondaryColor,
            onChanged: (value){
              setState(() {
                _secondaryColor = value;
                prefs.secondaryColor = value;
              });
            },
            title: Text('Secondary color'),
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculine'), 
            groupValue: _genre, 
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenine'), 
            groupValue: _genre, 
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el telefono'
              ),
              onChanged: (value){
                prefs.userName = value;
              },
            )
          )
        ],
      )
    );
  }

  _setSelectedRadio(int value) {
    prefs.genre = value;
    setState(() {
      _genre = value;
    });
 }
}