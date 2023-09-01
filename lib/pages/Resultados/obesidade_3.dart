import 'package:flutter/material.dart';

class ObesidadeIII extends StatelessWidget {
  final String peso;
  final String altura;
  final String imc;
  final String data;

  const ObesidadeIII(
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
                          'https://img.freepik.com/free-photo/smiling-fat-man-eats-burger-sitting-before-tv-set_8353-5511.jpg?w=1060&t=st=1693533700~exp=1693534300~hmac=04214d0adef085b97fe64a5204bee2da7d3056689c28a028dbc56804e36ce34f')),
                  Text(
                    'Registro de $data\n Baseado nos dados\n Peso: ${peso}kg e Altura: ${altura}m\n Seu IMC é ${imc}kg/m2',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Obesidade III',
                    style: TextStyle(
                        color: Colors.purple.shade600,
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
