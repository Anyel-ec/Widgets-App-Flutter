import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackback = SnackBar(
        action: SnackBarAction(
            label: 'Cerrar',
            onPressed: () {
              ('SnackBar cerrado');
            }),
        content: const Text('Hola mundo'));
    ScaffoldMessenger.of(context).showSnackBar(snackback);
  }

  void openDialog (BuildContext context){
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Estas seguro de cerrar?'),
          content: const Text('Este es un dialogo de alerta'),
          actions: [
            TextButton(
              onPressed: () {
                 Navigator.of(context).pop();
              }, 
              child: const Text('Cancelar')
            ), 

            FilledButton(onPressed: ()=> context.pop(), child: const Text('Aceptar'))
          ],
        );
      }
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('SnackBar y Dialogos'),
      ),

      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showCustomSnackbar(context);
          },
          icon: const Icon(Icons.remove_red_eye_outlined),
          label: const Text('Mostrar Snackbar')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, 
                  children: [
                    const Text('Aplicación de Widgets'),
                    const Text('Versión 1.0.0'),
                    const Text('Desarrollado por:'),
                    const Text('Anyel EC')
                  
                  ]);
                }, 
                child: const Text('Licencias usadas')),


            FilledButton.tonal(
                onPressed: () {
                  openDialog(context);

                }, child: const Text('Mostrar dialogo'))
          ],
        ),
      ),
    );
  }
}
