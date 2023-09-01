import 'package:imc_flutter/model/registro_model.dart';

class RegistroRepository {
  final List<RegistroModel> _registroSCalc = [];

    Future<void> add(RegistroModel registroCalc) async {
    await Future.delayed(const Duration(milliseconds: 20));
    _registroSCalc.add(registroCalc);
  }

  Future<void> alterar(String id) async {
    await Future.delayed(const Duration(milliseconds: 20));
  }

  Future<List<RegistroModel>> listar() async {
    await Future.delayed(const Duration(milliseconds: 20));
    return _registroSCalc;
  }
}
