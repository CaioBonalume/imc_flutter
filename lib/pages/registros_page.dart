import 'package:flutter/material.dart';
import 'package:imc_flutter/model/registro_model.dart';
import 'package:imc_flutter/repositories/registros_repository.dart';
import 'package:imc_flutter/shared/widgets/custom_drawer.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  var _registroSCalc = const <RegistroModel>[];
  var registroRepository = RegistroRepository();

  @override
  void initState() {
    super.initState();
    atualizarRegistros();
  }

  void atualizarRegistros() async {
    _registroSCalc = await registroRepository.listar();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Registros',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      drawer: const CustomDrawer(),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListView.builder(
              itemCount: _registroSCalc.length,
              itemBuilder: (BuildContext bc, int index) {
                atualizarRegistros();
                var registroCalc = _registroSCalc[index];
                return Card(
                  color: Colors.red,
                  key: Key(registroCalc.id),
                  child: ListTile(
                    title: Text(
                      registroCalc.dataRegistro,
                      style: const TextStyle(color: Colors.red, fontSize: 24),
                    ),
                    subtitle: Text(
                        'Peso: ${registroCalc.peso} kg \nAltura:${registroCalc.altura} m'),
                    trailing: Text('IMC: ${registroCalc.altura} '),
                  ),
                );
              })),
    );
  }
}
