import 'package:imc_flutter/model/resultado_model.dart';
import 'package:imc_flutter/repositories/sqlite_database.dart';

class RegistroSQLiteRepo {
  Future<ResultadoModel> getData() async {
    ResultadoModel dados;
    var db = await SQLiteDataBase().getDatabase();
    var data = await db.rawQuery('''SELECT id, dataRegistro, altura, peso,
    resultadoIMC FROM tarefas''');
    for (var element in data) {
      //dados.add
    }
    return dados;
  }

  Future<void> salvar(ResultadoModel resultadoModel) async {
    var db = await SQLiteDataBase().getDatabase();
    db.rawInsert(
        'INSERT INTO registros (dataRegistro, altura, peso, resultadoIMC) values(?,?,?,?)',
        [
          resultadoModel.dataRegistro,
          resultadoModel.altura,
          resultadoModel.peso,
          resultadoModel.resultadoIMC
        ]);
  }

  Future<void> atualizar(ResultadoModel resultadoModel) async {
    var db = await SQLiteDataBase().getDatabase();
    db.rawInsert('''UPDATE registros SET dataRegistro = ?, altura = ?, peso = ?,
      resultadoIMC = ? WHERE id = ?''', [
      resultadoModel.dataRegistro,
      resultadoModel.altura,
      resultadoModel.peso,
      resultadoModel.resultadoIMC,
      resultadoModel.id
    ]);
  }

  Future<void> delete(int id) async {
    var db = await SQLiteDataBase().getDatabase();
    db.rawInsert('DELETE FROM registros WHERE id = ?');
  }
}
