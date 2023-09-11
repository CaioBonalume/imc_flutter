class ResultadoModel {
  int _id = 0;
  String _dataRegistro = '';
  double _altura = 0;
  double _peso = 0;
  String _resultadoIMC = '';

  ResultadoModel(this._id, this._dataRegistro, this._peso, this._resultadoIMC);
  int get id => _id;
  String get dataRegistro => _dataRegistro;
  double get altura => _altura;
  double get peso => _peso;
  String get resultadoIMC => _resultadoIMC;

  set id(int id) {
    _dataRegistro = dataRegistro;
  }

  set dataRegistro(String dataRegistro) {
    _dataRegistro = dataRegistro;
  }

  set altura(double altura) {
    _altura = altura;
  }

  set peso(double peso) {
    _peso = peso;
  }

  set resultadoIMC(String resultadoIMC) {
    _resultadoIMC = resultadoIMC;
  }
}
