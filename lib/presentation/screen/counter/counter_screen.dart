import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';


class CounterScreen extends ConsumerWidget  {
  static const String name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterValue = ref.watch(counterProvider);
    final themeValue = ref.watch(isDarkmodeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
        actions: [
          IconButton(
            // icon: const Icon(Icons.light_mode_outlined),
            // si el tema es oscuro, se muestra el icono de light mode
            icon: themeValue ? const Icon(Icons.light_mode_outlined) 
            : const Icon(Icons.dark_mode_outlined),
            onPressed: () {
              ref.read(isDarkmodeProvider.notifier).state = !themeValue;
            },
            
          ),
        ],
      ),
      body: Center(
        child: Text ('Contador de clicks: $counterValue', style: Theme.of(context).textTheme.titleLarge),
      ),
      // floatingActionButton con un icono de add sin el label
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;

          // se puede hacer tambien asi: 
          // ref.read(counterProvider.notifier).update((state) => state + 1);
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
