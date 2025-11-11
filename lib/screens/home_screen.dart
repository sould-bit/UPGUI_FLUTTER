import 'package:flutter/material.dart';

class HomeScreen extends  StatelessWidget {
  const HomeScreen({super.key});

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
      body: Column(
        children: [
          //--------------boton---------------
          Padding(
              padding: const EdgeInsets.all(16.0), // margen alrededor del boton

              child:  Container(
                padding:  const EdgeInsets.symmetric(vertical: 20.0),
                 decoration:  BoxDecoration(
                   color:  Colors.blue.shade100, //azul tenue
                   borderRadius: BorderRadius.circular(12.0) // bordes redondeados
                 ),
                child: const Center(
                  child: Text('RESERVAR CANCHA',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),),
                ),
              ),
          ),

          //--------------------- y Galeria----------------------
          Expanded(
              child: ListView(
                children: [
                  //----------titulo de la seccion---------------
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                      child: Text('NUESTRAS CANCHAS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20 ),
                       ),
                  ),

                  SizedBox(
                    height: 400, // altura fija
                    child:  ListView(
                      scrollDirection: Axis.horizontal, // la clave para el scroll horizontal
                      children: [
                        // imagenes  por ahora van contenedores decolores
                        _buildGaleriaItem('Cancha A', Colors.green.shade300),
                        _buildGaleriaItem('Cancha b', Colors.green.shade400),
                        _buildGaleriaItem('Cancha c', Colors.green.shade500),
                      ],
                    ),
                  ),


                  //------------titulo-----------

                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0,
                      vertical: 25.0),
                    child:  Text('INSTALACIONES',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight:  FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        // imagenes  por ahora van contenedores decolores
                        _buildGaleriaItem('TIENDA', Colors.orange.shade300),
                        _buildGaleriaItem('TIENDA', Colors.orange.shade400),
                        _buildGaleriaItem('TIENDA', Colors.orange.shade500),
                      ],
                    ),
                  )
                ],
              ) )

          //margen  alrededor del boton
        ],
      ),
      // ------------------------BUTTONNAVITATIONBAR_DOWN-------------
      //boton navigator
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),
            label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today),
              label: 'Reservas' ),
          BottomNavigationBarItem(icon: Icon(Icons.notifications),
              label: 'Notificacion'),
          BottomNavigationBarItem(icon: Icon(Icons.payment) ,
              label: 'Pagos',  )
      ]
        ),
    );



  }
  Widget _buildGaleriaItem(String texto, Color color) {
    return Container(
      width: 250,
      margin: const EdgeInsets.all(8.0),
      decoration:  BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),

      child:  Center(
        child: Text(texto, style: const
        TextStyle(
          color:  Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
    );

  }

}
