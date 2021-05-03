import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  //Singleton
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }
  PreferenciasUsuario._internal();

  //SharedPreferences
  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //GET Y SET
  //Genero
  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  //GET Y SET
  //Color secundario
  get colorSecundario {
    //Si la propiedad no existe, es falso
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  //GET Y SET
  //Nombre de usuario
  get nombreUsuario {
    //Si la propiedad no existe, regreso un caracter vacío
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario(String value) {
    _prefs.setString('nombreUsuario', value);
  }

  //GET Y SET
  //Ultima pagina
  get ultimaPagina {
    //Si la propiedad no existe, me lleva al homepage
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
}
