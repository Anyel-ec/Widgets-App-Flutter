import 'dart:math';

import 'package:flutter/material.dart';



class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen ';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.blue;
  double borderRadius = 10.0;

  // cambiar forma de la caja

  void changeShape(){
    final random = Random();

    width = random.nextInt(300) + 150;
    height = random.nextInt(300) + 110;
    color = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1
    );
    borderRadius = random.nextInt(100).toDouble() + 10;

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animaciones'),
      ),

      body: Padding(
        padding:const EdgeInsets.all(20),
        
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInCubic,
            width: width < 0 ? 0 : width,
            height: height < 0 ? 0 : height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: changeShape,
          child: const Icon(Icons.play_arrow),
      )
      
    );
  }
}