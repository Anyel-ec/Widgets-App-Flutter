import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0; // para saber que item del menu esta seleccionado
  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).padding.top > 35;

    return NavigationDrawer(
        selectedIndex:
            navDrawerIndex, // para saber que item del menu esta seleccionado
        onDestinationSelected: (value) {
          setState(() => navDrawerIndex = value);

          // cerrar el menu lateral
          final menuItem = appMenuItems[value];
          context.push(menuItem.link);
          widget.scaffoldKey.currentState?.closeDrawer(); // cerrar el menu si se selecciona un item
        },
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 20, 10),
              child: const Text('Menu de Opciones')),
          ...appMenuItems
              .sublist(0, 3)
              .map((item) => NavigationDrawerDestination(
                    icon: Icon(item.icon),
                    label: Text(item.title),
                  )),
          const Padding(
              padding: EdgeInsets.fromLTRB(28, 20, 20, 10), child: Divider()),
          Padding(
              padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 20, 10),
              child: const Text('Otras opciones')),
          ...appMenuItems.sublist(3).map((item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              )),
        ]);
  }
}
