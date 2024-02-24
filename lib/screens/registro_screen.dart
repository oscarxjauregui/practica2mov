import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practica2/screens/inicio_screen.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({Key? key}) : super(key: key);

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

TextEditingController conUser = TextEditingController(text: "");
TextEditingController conEmail = TextEditingController(text: "");
TextEditingController conPwd = TextEditingController(text: "");

class _RegistroScreenState extends State<RegistroScreen> {
  bool isLoading = false;
  File? _imageFile;
  final _formKey = GlobalKey<FormState>();

  final txtUser = TextFormField(
    keyboardType: TextInputType.text,
    controller: conUser,
    decoration: const InputDecoration(border: OutlineInputBorder()),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Ingresa el nombre';
      }
      return null;
    },
  );

  final txtEmail = TextFormField(
    keyboardType: TextInputType.emailAddress,
    controller: conEmail,
    decoration: const InputDecoration(border: OutlineInputBorder()),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Ingresa el email';
      }
      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
        return 'Email invalido';
      }
      return null;
    },
  );

  final pwdUser = TextFormField(
    keyboardType: TextInputType.text,
    controller: conPwd,
    obscureText: true,
    decoration: const InputDecoration(border: OutlineInputBorder()),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Ingresa la contraseña';
      }
      return null;
    },
  );

  Future<void> imgAvatar(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile!.path);
        });
      }
    } catch (e) {
      print("Error al seleccionar la imagen: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Container(
                height: 500,
                width: MediaQuery.of(context).size.width * .9,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: 30,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text('Nombre'),
                        ),
                      ),
                      txtUser,
                      SizedBox(
                        height: 30,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text('Email'),
                        ),
                      ),
                      txtEmail,
                      SizedBox(
                        height: 30,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text('Contraseña'),
                        ),
                      ),
                      pwdUser,
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ListView(
                                padding: EdgeInsets.all(10),
                                children: [
                                  SizedBox(
                                    height: 50,
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Text('Seleccionar imagen'),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      imgAvatar(ImageSource.gallery);
                                    },
                                    child: Text('Desde la galeria'),
                                  ),
                                  SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      imgAvatar(ImageSource.camera);
                                    },
                                    child: Text('Desde la camara'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text('Seleccionar avatar'),
                      ),
                      SizedBox(height: 20),
                      _imageFile != null
                          ? Image.file(_imageFile!)
                          : const Text(''),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (_imageFile == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Selecciona un avatar.'),
                                ),
                              );
                            } else {
                              setState(() {
                                isLoading = !isLoading;
                              });
                              Future.delayed(
                                const Duration(microseconds: 3000),
                                () {
                                  //Navigator.pushNamed(context, '/menu')
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => InicioScreen(
                                              conUser.text,
                                              conEmail.text))).then((value) {
                                    setState(() {
                                      isLoading = !isLoading;
                                    });
                                  });
                                },
                              );
                            }
                          }
                        },
                        child: Text('Registrarse'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            isLoading
                ? Positioned(
                    top: 260,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
