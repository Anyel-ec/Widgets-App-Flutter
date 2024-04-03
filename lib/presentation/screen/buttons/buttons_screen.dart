import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.arrow_back),
      )
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10, // spacing es para el espacio entre los botones
          crossAxisAlignment: WrapCrossAlignment.center,
      
          children: [
            ElevatedButton(onPressed: (){}, child: const Text ('Eveteled')), // primer boton 
            
            const ElevatedButton(onPressed: null, child: const Text ('Disable')), // segundo boton 
      
            ElevatedButton.icon(
            onPressed: (){}, 
            icon: const Icon(Icons.access_alarm_rounded), 
            label: const Text ('Elevated Alarm')), 

            FilledButton(onPressed: (){}, child: const Text ('Filled')), // cuarto boton

            FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.credit_card), label: const Text ('Filled')), 


            OutlinedButton(onPressed: (){}, child: const Text ('Boton Outlined')), // sexto boton


            OutlinedButton.icon(onPressed: (){}, icon: const Icon(Icons.terminal), label: const Text ('Outlined')), // septimo boton


            TextButton(onPressed: (){}, child: const Text ('Text Button')), // octavo boton

            TextButton.icon(onPressed: (){}, icon: const Icon(Icons.text_fields), label: const Text ('Text')), // noveno boton


            IconButton(onPressed: (){}, icon:const Icon (Icons.add),), // decimo boton
            IconButton(onPressed: (){}, style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red),
            iconColor: MaterialStateColor.resolveWith((states) => Colors.white)
            )
            , icon:const Icon (Icons.add),), // decimo boton


            // CustomsButtons 
            const CustomButton()
          ],
        )
      ),
    );
  }
}

// boton personalizado


class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child:  Text('Hola Mundo', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}