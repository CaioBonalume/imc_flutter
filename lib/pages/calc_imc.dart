import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imc_flutter/model/registro_model.dart';
import 'package:imc_flutter/repositories/registros_repository.dart';
import 'package:imc_flutter/shared/widgets/logica_imc.dart';
import 'package:imc_flutter/shared/widgets/resultados_imc.dart';
import 'package:imc_flutter/shared/widgets/titulo_categoria.dart';

class CalculadoraIMC extends StatefulWidget {
  const CalculadoraIMC({super.key});

  @override
  State<CalculadoraIMC> createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  var registroRepository = RegistroRepository();

  String dataRegistro = '';
  String result = '';
  String analise = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: ListView(
        children: [
          const TituloCategoria(text: 'Data do Registro'),
          TextField(
            readOnly: true,
            onTap: () async {
              var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1960, 5, 20),
                  lastDate: DateTime(2024, 10, 23));
              if (date != null) {
                dataController.text =
                    '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
                dataRegistro = dataController.text;
              }
            },
            controller: dataController,
          ),
          const TituloCategoria(text: 'Altura'),
          TextField(
            keyboardType: TextInputType.number,
            controller: alturaController,
            decoration: const InputDecoration(hintText: '1.86'),
          ),
          const SizedBox(height: 20),
          const TituloCategoria(text: 'Peso'),
          TextField(
            keyboardType: const TextInputType.numberWithOptions(
                decimal: true, signed: false),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
            ],
            maxLength: 5,
            decoration:
                const InputDecoration(counterText: '', hintText: '72.6'),
            controller: pesoController,
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 30),
          TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 3,
                padding: const EdgeInsets.all(16),
              ),
              onPressed: () async {
                alturaController.text =
                    alturaController.text.replaceAll(',', '.');
                pesoController.text = pesoController.text.replaceAll(',', '.');
                if (dataRegistro.trim() == '') {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Escolha uma data')));
                }

                if (alturaController.text.trim() == '') {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Digite uma altura')));
                }
                if (pesoController.text.trim() == '') {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Digite uma peso')));
                }
                await registroRepository
                    .add(RegistroModel(dataRegistro, pesoController.text,
                        alturaController.text))
                    .then((value) => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Registro salvo com sucesso'),
                          ),
                        ))
                    .catchError(
                        (error) => ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Ocorreu um erro ao salvar o registro: $error'),
                              ),
                            ));
                setState(() {
                  if (alturaController.text.trim() != '' &&
                      pesoController.text.trim() != '' &&
                      dataRegistro != '') {
                    LogicaIMC imc = LogicaIMC(double.parse(pesoController.text),
                        double.parse(alturaController.text));
                    result = imc.calcularIMC().toStringAsFixed(2);
                    ResultadosIMC resultados = ResultadosIMC(
                        imc.calcularIMC(),
                        pesoController.text,
                        alturaController.text,
                        dataRegistro);
                    resultados.analiseIMC(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Insira os dados')));
                  }
                });
              },
              child: const TextoBotao(
                text: 'Calcular e Registrar',
              )),
        ],
      ),
    ));
  }
}
