import 'package:flutter/material.dart';

class InicioScreen extends StatelessWidget {
  final String nombre;
  final String email;
  //String pwd;
  const InicioScreen(this.nombre, this.email, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bienvenido'),
        ),
        drawer: Drawer(
            child: ListView(children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(''),
            ),
            accountName: Text(nombre),
            accountEmail: Text(email),
          )
        ])),
        body: Center());
  }
}
