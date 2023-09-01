import 'package:flutter/material.dart';

class ObesidadeI extends StatelessWidget {
  final String peso;
  final String altura;
  final String imc;
  final String data;

  const ObesidadeI(
      {super.key,
      required this.peso,
      required this.altura,
      required this.imc,
      required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Seu Resultado',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 2,
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Image(
                      height: 250,
                      image: NetworkImage(
                          'https://img.freepik.com/free-photo/woman-body-fat-belly-obese-woman-hands-holding-excessive-tummy-fat-change-diet-lifestyle-concept-shape-up-healthy-stomach-muscle-studio-anonymous-shot-photo-body-parts_633478-553.jpg?w=1060&t=st=1693533610~exp=1693534210~hmac=7fe86e5cb2dbd13611927ca0fbd4c21f45f90250ad202bc7a8e48c802bc9472b')),
                  Text(
                    'Registro de $data\n Baseado nos dados\n Peso: ${peso}kg e Altura: ${altura}m\n Seu IMC é ${imc}kg/m2',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Obresidade I',
                    style: TextStyle(
                        color: Colors.red.shade400,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
