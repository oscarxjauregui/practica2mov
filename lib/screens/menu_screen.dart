import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Container(
                height: 400,
                width: MediaQuery.of(context).size.width * .9,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isLoading = !isLoading;
                        });
                        Future.delayed(new Duration(microseconds: 5000), () {
                          Navigator.pushNamed(context, '/registro')
                              .then((value) {
                            setState(() {
                              isLoading = !isLoading;
                            });
                          });
                        });
                      },
                      child: Text('Registrarse'),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Iniciar Sesion'),
                    ),
                  ],
                ),
              ),
            ),
            isLoading
                ? const Positioned(
                    top: 260,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ))
                : Container()
          ],
        ),
      ),
    );
  }
}
