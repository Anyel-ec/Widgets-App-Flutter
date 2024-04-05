import 'package:flutter/material.dart' ;

class MenuItem{
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({required this.title,
   required this.subtitle, 
   required this.link, 
   required this.icon});
}

const appMenuItems = [
  MenuItem(
    title: 'Botones',
    subtitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined
  ),
  MenuItem(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card
  ),
  // para progressIndications 
  MenuItem(
    title: 'ProgressIndicators',
    subtitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.hourglass_empty
  ), 

  MenuItem(
    title: 'SnackBar y dialogos',
    subtitle: 'Mensajes emergentes',
    link: '/snackbar',
    icon: Icons.notifications
  ),

  MenuItem(
    title: 'Animacion de Contenedores',
    subtitle: 'Animaciones en Flutter',
    link: '/animated',
    icon: Icons.animation
  ),


  // MenuItem(
  //   title: 'Contact',
  //   subtitle: 'Contact page',
  //   link: '/contact',
  //   icon: Icons.contact_mail
  // ),
  // MenuItem(
  //   title: 'Settings',
  //   subtitle: 'Settings page',
  //   link: '/settings',
  //   icon: Icons.settings
  // ),
];