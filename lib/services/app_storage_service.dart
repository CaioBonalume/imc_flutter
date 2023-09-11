import 'package:shared_preferences/shared_preferences.dart';

enum STORAGEKEYS { keyAltura }

class AppStorageService {
  //Set
  Future<void> setDadosCadastraisAltura(double altura) async {
    _setDouble(STORAGEKEYS.keyAltura.toString(), altura);
  }

  _setDouble(String chave, double altura) async {
    var storage = await SharedPreferences.getInstance();
    storage.setDouble(chave, altura);
  }

  //Get
  Future<double?> getDadosCadastraisAltura() async {
    return _getDouble(STORAGEKEYS.keyAltura.toString());
  }

  Future<double> _getDouble(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0;
  }
}
