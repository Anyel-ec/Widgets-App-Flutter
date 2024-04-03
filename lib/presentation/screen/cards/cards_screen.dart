import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards
              .map((card) => _CardType1(
                    elevation: card['elevation'],
                    label: card['label'],
                  )),
              //  mapea de las tarjetas
          ...cards
              .map((card) => _CardType2(
                    elevation: card['elevation'],
                    label: card['label'],
                  )),

          ...cards
              .map((card) => _CardType3(
                    elevation: card['elevation'],
                    label: card['label'],
                  )),

          ...cards
              .map((card) => _CardType4(
                    elevation: card['elevation'],
                    label: card['label'],
                  )),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          children: [
            
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon (Icons.more_horiz_outlined),
                onPressed: (){},
              ),
            ), 
            Align(
              alignment: Alignment.bottomLeft,
              child: Text (label),
            )
          ]
        ),
      ),
    );
  }
}


class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType2({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        side: BorderSide(
          color: colors.primary
        ),
      ), 
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          children: [
            
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon (Icons.more_horiz_outlined),
                onPressed: (){},
              ),
            ), 
            Align(
              alignment: Alignment.bottomLeft,
              child: Text ('$label - outline'),
            )
          ]
        ),
      ),
    );
  }
}


class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType3({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          children: [
            
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon (Icons.more_horiz_outlined),
                onPressed: (){},
              ),
            ), 
            Align(
              alignment: Alignment.bottomLeft,
              child: Text ('label - Filled'),
            )
          ]
        ),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardType4({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: Clip.hardEdge,
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/350',
            fit: BoxFit.cover,
            height: 350  
          
      
          ), 
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12))
              
              ),
              child: IconButton(
                icon: const Icon (Icons.more_horiz_outlined),
                onPressed: (){},
              ),
            ),
          )
          
        ], 
      ),
    );
  }
}
