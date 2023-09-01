import 'package:flutter/material.dart';

class RegistroModel {
  final _id = UniqueKey().toString();
  String _data = '';
  String _peso = '';
  String _altura = '';

  RegistroModel(this._data, this._peso, this._altura);

  String get id => _id;

  String get dataRegistro => _data;

  set dataRegistro(String dataRegistro) => _data = dataRegistro;

  String get peso => _peso;

  set peso(String peso) => _peso = peso;

  String get altura => _altura;

  set altura(String altura) => _altura = altura;
}
