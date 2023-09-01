import 'package:flutter/material.dart';
import 'package:imc_flutter/pages/Resultados/magreza_grave.dart';
import 'package:imc_flutter/pages/Resultados/magreza_leve.dart';
import 'package:imc_flutter/pages/Resultados/magreza_moderada.dart';
import 'package:imc_flutter/pages/Resultados/obesidade_1.dart';
import 'package:imc_flutter/pages/Resultados/obesidade_2.dart';
import 'package:imc_flutter/pages/Resultados/obesidade_3.dart';
import 'package:imc_flutter/pages/Resultados/saudavel.dart';
import 'package:imc_flutter/pages/Resultados/sobrepeso.dart';

class ResultadosIMC {
  double result;
  String peso;
  String altura;
  String data;

  ResultadosIMC(this.result, this.peso, this.altura, this.data);
  void analiseIMC(BuildContext context) {
    switch (result) {
      case < 16:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MagrezaGrave(
                    data: data,
                    peso: peso,
                    altura: altura,
                    imc: result.toStringAsFixed(2))));
        break;
      case 16 || < 17:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MagrezaModerada(
                    data: data,
                    peso: peso,
                    altura: altura,
                    imc: result.toStringAsFixed(2))));
        break;
      case 17 || < 18.5:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MagrezaLeve(
                    data: data,
                    peso: peso,
                    altura: altura,
                    imc: result.toStringAsFixed(2))));
        break;
      case 18.5 || < 25:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Saudavel(
                    data: data,
                    peso: peso,
                    altura: altura,
                    imc: result.toStringAsFixed(2))));
        break;
      case 25 || < 30:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Sobrepeso(
                    data: data,
                    peso: peso,
                    altura: altura,
                    imc: result.toStringAsFixed(2))));
        break;
      case 30 || < 35:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ObesidadeI(
                    data: data,
                    peso: peso,
                    altura: altura,
                    imc: result.toStringAsFixed(2))));
        break;
      case 35 || < 40:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ObesidadeII(
                    data: data,
                    peso: peso,
                    altura: altura,
                    imc: result.toStringAsFixed(2))));
        break;
      case >= 40:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ObesidadeIII(
                    data: data,
                    peso: peso,
                    altura: altura,
                    imc: result.toStringAsFixed(2))));
        break;

      default:
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Erro'),
            content: const Text('Valor inválido'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
    }
  }
}
