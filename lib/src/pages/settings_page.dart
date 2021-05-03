import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/pages/shared_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario_app/src/pages/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  //Definir aqui el nombre de la pagina como una propiedad estatica
  static final String routeName = 'home';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = 'Pedro';

  //Para establecer un texto por default
  TextEditingController _textController;
  //Preferencias de Usuario
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    //Setter de Preferencias de Usuario
    prefs.ultimaPagina = SettingsPage.routeName;
    //Getters de Preferencias de Usuario
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    //Texto por default
    _textController = new TextEditingController(text: prefs.nombreUsuario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          //Cambio dependiendo de las preferencias seleccionadas
          //Esta activado? Entonces Colors.teal
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
                value: _colorSecundario,
                onChanged: (value) {
                  setState(() {
                    _colorSecundario = value;
                    //Setter de Preferencias de Usuario
                    prefs.colorSecundario = value;
                  });
                },
                title: Text('Color secundario')),
            RadioListTile(
                value: 1,
                groupValue: _genero,
                onChanged: _setSelectedRadio,
                title: Text('Masculino')),
            RadioListTile(
                value: 2,
                groupValue: _genero,
                onChanged: _setSelectedRadio,
                title: Text('Femenino')),
            Divider(),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  //Asignar el controlador
                  controller: _textController,
                  onChanged: (text) {
                    //Setter de Preferencias de Usuario
                    prefs.nombreUsuario = text;
                  },
                  decoration: InputDecoration(
                      labelText: 'Nombre',
                      helperText: 'Nombre de la persona que usa el telefono'),
                ))
          ],
        ));
  }

  _setSelectedRadio(int value) {
    //Setter de Preferencias de Usuario
    prefs.genero = value;
    _genero = value;
    setState(() {});
  }
}
