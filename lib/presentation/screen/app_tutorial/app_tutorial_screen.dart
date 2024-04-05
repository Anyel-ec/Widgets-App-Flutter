import 'package:flutter/material.dart';

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Busca la comida',
      caption: 'Te gusta la comida creo que si',
      imageUrl: 'assets/images/1.png'),
  
  SlideInfo(
      title: 'Entrega rapida',
      caption: 'Las entregs son rapidas',
      imageUrl: 'assets/images/2.png'),

      SlideInfo(
      title: 'Disfruta tu comida',
      caption: 'La comida es deliciosa',
      imageUrl: 'assets/images/3.png')
];

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  const SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

class AppTutorialScreen extends StatelessWidget {
  static const String name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const BouncingScrollPhysics(),
        children: slides.map(
          (slideDate) => _Slide(
            title: slideDate.title, 
            caption: slideDate.caption, 
            imageUrl: slideDate.imageUrl)
            ).toList()
      ),
    );
  }
}



class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}