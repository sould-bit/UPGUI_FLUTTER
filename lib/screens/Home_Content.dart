import 'package:flutter/material.dart';
import 'package:mi_first_app/screens/reservas_screen.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
    //--------------boton---------------
    Padding(
    padding: const EdgeInsets.all(16.0), // margen alrededor del boton
    child: GestureDetector(
    onTap: (){
      Navigator.push(
      context, MaterialPageRoute(builder: (context) => const ReservasScreen()),
    );
    },
    child:  Container(
    padding:  const EdgeInsets.symmetric(vertical: 30.0),
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
    _buildGaleriaItem(texto: 'Cancha A' ,imagePath: 'assets/images/cancha.jpg',),
    _buildGaleriaItem(texto: 'Cancha b', imagePath: 'assets/images/cancha3.png',),
    _buildGaleriaItem(texto: 'Cancha c',imagePath:  'assets/images/padel.jpg',),
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
    _buildGaleriaItem(texto: 'TIENDA', imagePath:
         'assets/images/instalacionesjpg.jpg'),
    _buildGaleriaItem(texto: 'TIENDA', imagePath: 'assets/images/instalac.webp' ),
    _buildGaleriaItem(texto: 'TIENDA', imagePath: 'assets/images/insta2.jpeg'),
    ],
    ),
    )
    ],
    ) )

    //margen  alrededor del boton
    ],
    );
  }

  Widget _buildGaleriaItem({required String texto, required String imagePath}) {
    return Container(
      width: 250,
      margin: const EdgeInsets.all(8.0),
      clipBehavior: Clip.antiAlias,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(image: AssetImage(imagePath),
        fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
                BlendMode.darken
          ),
        ),
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