import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_preferencesapp/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor = false;
  int _genre = 1;
  String _name = 'Pedro';
  TextEditingController _textController;
  @override
  void initState() {
    super.initState();
    getPrefs();
    _textController = new TextEditingController(text:_name);
  }

  getPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _genre = prefs.getInt('genre');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 
      Text('Settings'),
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
              onChanged: (value){},
            )
          )
        ],
      )
    );
  }

  _setSelectedRadio(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('genre', value);
    setState(() {
      _genre = value;
    });
 }
}