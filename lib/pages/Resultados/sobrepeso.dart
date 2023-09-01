import 'package:flutter/material.dart';

class Sobrepeso extends StatelessWidget {
  final String peso;
  final String altura;
  final String imc;
  final String data;

  const Sobrepeso(
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
                          'https://img.freepik.com/free-photo/bearded-adult-man-got-sweaty-during-his-training-session_273609-48072.jpg?w=1060&t=st=1693533632~exp=1693534232~hmac=61cecc410d2da20aeff5b2c2bb2c250b0212b63f98022541cf0565ca49083317')),
                  Text(
                    'Registro de $data\n Baseado nos dados\n Peso: ${peso}kg e Altura: ${altura}m\n Seu IMC é ${imc}kg/m2',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Sobrepeso',
                    style: TextStyle(
                        color: Colors.red.shade100,
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
