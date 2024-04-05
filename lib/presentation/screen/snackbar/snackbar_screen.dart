import 'package:flutter/material.dart';


class SnackBarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackBarScreen ({super.key});

  void showCustomSnackbar (BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackback = SnackBar(
      action: SnackBarAction(
        label: 'Cerrar',
        onPressed: (){
          ('SnackBar cerrado');
        }),
      content: const Text('Hola mundo'));
    ScaffoldMessenger.of(context).showSnackBar(snackback);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar y Dialogos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          showCustomSnackbar(context);
        }, 
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text('Mostrar Snackbar')
      ),
    );
    
  }
} 