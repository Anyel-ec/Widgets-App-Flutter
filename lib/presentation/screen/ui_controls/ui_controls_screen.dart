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
  bool acceptTerms = false;
  bool lunes = false;
  bool martes = false;
  bool miercoles = false;

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
        ExpansionTile(
            title: const Text('Medios de transporte'),
            subtitle: Text('$selectTransportation'),
            children: [
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
            ]),


        /////////////////////////////////////////// CheckboxListTile ///////////////////////////////////////////
        CheckboxListTile(
          title: const Text('Acepto los términos y condiciones'),
          subtitle: const Text('Acepta los términos y condiciones'),
          value: acceptTerms,
          onChanged: (value) => setState(() {
            acceptTerms = !acceptTerms;
          }),
        ),

        ///////////////////////////////////////////// segundo checkbox ///////////////////////////////////////////
        CheckboxListTile(
          value: lunes, onChanged: (value) {
          setState(() {
            lunes = !lunes;
          });
        }, title: const Text('Lunes')),

        CheckboxListTile(value: martes, onChanged: (value) {
          setState(() {
            martes = !martes;
          });
        }, title: const Text('Martes')),

        CheckboxListTile(value: miercoles, onChanged: (value) {
          setState(() {
            miercoles = !miercoles;
          });
        }, title: const Text('Miercoles')),

        
      ],
    );
  }
}
