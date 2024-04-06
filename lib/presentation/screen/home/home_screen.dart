import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';



class HomeScreen extends StatelessWidget {

  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anyel EC'),
      ),
      body: const _HomeView(),
      drawer: const SideMenu()
    );
  }
}

class _HomeView extends StatelessWidget {

  static const String name = 'home_screen';
  const _HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {


    return ListView.builder(
      physics: const BouncingScrollPhysics(), // Efecto de rebote
      itemCount: appMenuItems.length,  // Cantidad de elementos
      itemBuilder: (context, index){ // Funcion que se ejecuta por cada elemento
      
      final menuItem = appMenuItems[index];

      return _CustomListTile(menuItem: menuItem);
    });
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    super.key,
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),
      leading: Icon(menuItem.icon, color: colors.primary,),
      trailing: Icon(Icons.chevron_right, color: colors.primary,),
      onTap: () {
      //       Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => const ButtonsScreen(),
      //   ),
      // );
      // context.pushNamed(CardsScreen.name);
      context.push(menuItem.link);
      },

     
    );
  }
}