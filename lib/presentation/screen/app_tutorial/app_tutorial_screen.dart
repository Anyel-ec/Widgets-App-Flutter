import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final PageController pageviewController = PageController();
  bool isLastPage = false;


  @override
  void initState() {
    super.initState();

    pageviewController.addListener(() { // 
    final page = pageviewController.page ?? 0;
    if (page >= slides.length - 1 && !isLastPage) {
      isLastPage = true;
      setState(() {});
    } else if (isLastPage && page < slides.length - 1) {
      isLastPage = false;
      setState(() {});
    }
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
              controller: pageviewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideDate) => _Slide(
                      title: slideDate.title,
                      caption: slideDate.caption,
                      imageUrl: slideDate.imageUrl))
                  .toList()),

          ////////////////////////////////////////////////////////////////
          Positioned(
            right: 20,
            top: 20,
            child: TextButton(
              child: const Text('Saltar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ), 



          ////////////////////////////////////////////////////////////////
          isLastPage ? Positioned(
            bottom: 20,
            right: 30,
            child: FadeInRight(
              from: 15,
              duration: const Duration(milliseconds: 500),
              child: FilledButton(
                onPressed: () => context.pop(),
                child: const Text('Comenzar'),
              ),
            ),
          ): const SizedBox(),
          
        ],
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
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 20),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
