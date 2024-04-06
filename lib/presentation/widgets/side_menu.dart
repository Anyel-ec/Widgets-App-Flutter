import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0; // para saber que item del menu esta seleccionado
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex ,
      onDestinationSelected: (value) => setState(() => navDrawerIndex = value),
      children: const [
      NavigationDrawerDestination(
        icon:  Icon(Icons.add), 
        label:  Text ('Add'),
      ), 

       NavigationDrawerDestination(
        icon:  Icon(Icons.add_shopping_cart), 
        label:  Text ('Add'),
      ),
    ]);
  }
}
