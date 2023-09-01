import 'package:flutter/material.dart';
import 'package:imc_flutter/pages/calc_imc.dart';
import 'package:imc_flutter/shared/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controllerPageView = PageController(initialPage: 0);
  int posicaoPag = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Calculadora IMC',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const CustomDrawer(),
      body: Column(children: [
        Expanded(
          child: PageView(
              controller: controllerPageView,
              onPageChanged: (value) {
                setState(() {
                  posicaoPag = value;
                });
              },
              scrollDirection: Axis.vertical,
              children: const [CalculadoraIMC()]),
        ),
      ]),
    );
  }
}
