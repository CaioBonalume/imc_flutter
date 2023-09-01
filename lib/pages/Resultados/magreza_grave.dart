import 'package:flutter/material.dart';

class MagrezaGrave extends StatelessWidget {
  final String peso;
  final String altura;
  final String imc;
  final String data;

  const MagrezaGrave({
    super.key,
    required this.peso,
    required this.altura,
    required this.imc,
    required this.data,
  });

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
                          'https://e7.pngegg.com/pngimages/418/176/png-clipart-handsome-man-cartoon-simple-pen-thumbnail.png')),
                  Text(
                    'Registro de $data\n Baseado nos dados\n Peso: ${peso}kg e Altura: ${altura}m\n Seu IMC é ${imc}kg/m2',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Magreza Grave',
                    style: TextStyle(
                        color: Colors.red.shade900,
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
