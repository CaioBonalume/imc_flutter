import 'package:flutter/material.dart';

class ObesidadeII extends StatelessWidget {
  final String peso;
  final String altura;
  final String imc;
  final String data;

  const ObesidadeII(
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
                      height: 180,
                      image: NetworkImage(
                          'https://img.freepik.com/free-photo/overweight-man-closeup-belly-side-view-put-up-shirt-pinch-clap-belly_633478-1781.jpg?w=1060&t=st=1693533539~exp=1693534139~hmac=f295a8a80919eec4effde13e34927c6f56915b6ce473f90bb6ebcc94e50c746f')),
                  Text(
                    'Registro de $data\n Baseado nos dados\n Peso: ${peso}kg e Altura: ${altura}m\n Seu IMC é ${imc}kg/m2',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Obresidade II',
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
