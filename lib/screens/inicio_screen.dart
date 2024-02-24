import 'dart:io';

import 'package:flutter/material.dart';

class InicioScreen extends StatelessWidget {
  final String nombre;
  final String email;
  final File imageFile; // Nuevo parámetro para recibir el imageFile
  const InicioScreen(this.nombre, this.email, this.imageFile, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                // Mostrar la imagen del imageFile
                backgroundImage: FileImage(imageFile),
              ),
              accountName: Text(nombre),
              accountEmail: Text(email),
            )
          ],
        ),
      ),
      body: Center(),
    );
  }
}
