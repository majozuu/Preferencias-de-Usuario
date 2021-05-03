import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/pages/home_page.dart';
import 'package:preferencias_usuario_app/src/pages/settings_page.dart';
import 'package:preferencias_usuario_app/src/pages/shared_prefs/preferencias_usuario.dart';

void main() async {
  //En toda la app para usar esto, ya van a estar listas
  //Inicializacion de las preferencias
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //Como es un Singleton, es la misma instancia aun
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Preferencias',
        //Ir a la ultima pagina, segun las preferencias
        initialRoute: prefs.ultimaPagina,
        routes: {
          HomePage.routeName: (BuildContext context) => HomePage(),
          SettingsPage.routeName: (BuildContext context) => SettingsPage()
        });
  }
}
