import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controles de UI'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportations { car, bike, boat, plane }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDevelopmentMode = true;
  Transportations selectTransportation = Transportations.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Modo de desarrollo'),
          subtitle: const Text('Activa o desactiva el modo de desarrollo'),
          value: isDevelopmentMode,
          onChanged: (value) => setState(() {
            isDevelopmentMode = !isDevelopmentMode;
          }),
        ),

        /////////////////////////////////////////// RadioListTile ///////////////////////////////////////////
        
        RadioListTile(
            title: const Text('Carro'),
            subtitle: const Text('Vehiculo terrestre'),
            value: Transportations.car,
            groupValue: selectTransportation,
            onChanged: (value) {
              setState(() {
                selectTransportation = value as Transportations;
              });
            }),
        //////////////////////////////////////////// RadioListTile ///////////////////////////////////////////
        RadioListTile(
            title: const Text('Bicicleta'),
            subtitle: const Text('Vehiculo terrestre'),
            value: Transportations.bike,
            groupValue: selectTransportation,
            onChanged: (value) {
              setState(() {
                selectTransportation = value as Transportations;
              });
            }),

        RadioListTile(
            title: const Text('Barco'),
            subtitle: const Text('Vehiculo acuatico'),
            value: Transportations.boat,
            groupValue: selectTransportation,
            onChanged: (value) {
              setState(() {
                selectTransportation = value as Transportations;
              });
            }),

        RadioListTile(
            title: const Text('Avión'),
            subtitle: const Text('Vehiculo aereo'),
            value: Transportations.plane,
            groupValue: selectTransportation,
            onChanged: (value) {
              setState(() {
                selectTransportation = value as Transportations;
              });
            }),
      ],
    );
  }
}
