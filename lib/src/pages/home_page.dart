import 'package:flutter/material.dart';
import 'package:preferencias_usuario_app/src/pages/shared_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario_app/src/pages/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  //Definir aqui el nombre de la pagina como una propiedad estatica
  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    //Setter de Preferencias de Usuario
    prefs.ultimaPagina = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        //Cambio dependiendo de las preferencias seleccionadas
        //Esta activado? Entonces Colors.teal
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      //Navegacion con un menu lateral
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario: $prefs.colorSecundario} '),
          Divider(),
          Text('Genero: ${prefs.genero}'),
          Divider(),
          Text('Nombre de usuario: ${prefs.nombreUsuario}'),
          Divider()
        ],
      ),
    );
  }
}
