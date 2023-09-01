import 'package:flutter/material.dart';
import 'package:imc_flutter/home_page.dart';
import 'package:imc_flutter/pages/registros_page.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 80,
        ),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.calculate),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Fazer cáculo de IMC',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              )),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        InkWell(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.app_registration),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Registros',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              )),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const RegistroPage()));
          },
        ),
      ]),
    );
  }
}
