import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider.select((value) => value.isDarkMode) );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiador de Tema'),
        actions: [
          IconButton(
            // icon: const Icon(Icons.light_mode_outlined),
            // si el tema es oscuro, se muestra el icono de light mode
            icon: isDarkMode ? const Icon(Icons.light_mode_outlined) 
            : const Icon(Icons.dark_mode_outlined),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier)
              .toggleTheme();
            },
          )
        ],
      ),

      body: _ThemeChangedView(),
      
    );
  }
}

class _ThemeChangedView extends ConsumerWidget {
  const _ThemeChangedView();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);


    final int selectedColor = ref.watch(
      themeNotifierProvider.select((value) => value.selectedColor));
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors [index];

        return RadioListTile(
          title: Text('Color $index', style: TextStyle(color: color)),
          activeColor: color,
          subtitle: Text('Color ${color.value}'),
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {

            ref.read(themeNotifierProvider.notifier)
            .changeColor(value!);
            
          }
          
        );
      }
    );
  }
}