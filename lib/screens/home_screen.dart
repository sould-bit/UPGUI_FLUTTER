import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mi_first_app/screens/Home_Content.dart';
import 'package:mi_first_app/screens/notificaciones_screen.dart';
import 'package:mi_first_app/screens/pagosscreen.dart';
import 'package:mi_first_app/screens/reservas_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends  State<HomeScreen> {
  int _selectdIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeContent(),
    const ReservasScreen(),
    const NotificacionesScreen(),
    const Pagosscreen(),
  ];

  void _onItemTapped(int index){

    setState(() {
      _selectdIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //------------------------------app bar---------------------------------
      appBar: AppBar(
        elevation: 0,
        backgroundColor:  Colors.white,
        title: Row(
          children: [
            //----logo----
            Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,

                ),
                child: const Text('U', style: TextStyle(
                    color : Colors.white , fontSize: 20
                ),)
            ),
            const SizedBox(width: 10,),
            //---texto---
            const Text(
              'UPGUI',
              style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ],
        ),//fondo blanco
      ),
      //-----------------------------body-----------------------------------
      body: _widgetOptions.elementAt(_selectdIndex),

    // ------------------------BUTTONNAVITATIONBAR_DOWN-------------

    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem> [
        BottomNavigationBarItem(icon: Icon(Icons.home),
            label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today),
            label: 'Reservas' ),
        BottomNavigationBarItem(icon: Icon(Icons.notifications),
            label: 'Notificacion'),
        BottomNavigationBarItem(icon: Icon(Icons.payment) ,
          label: 'Pagos',  ),
      ],
      currentIndex: _selectdIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
      type:  BottomNavigationBarType.fixed,
    ),
    );



  }


}

