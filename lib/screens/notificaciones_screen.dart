import 'package:flutter/material.dart';

// Modelo simple para representar una notificación.
class Notificacion {
  final String mensaje;
  final bool esExito;
  final DateTime fecha;

  Notificacion({required this.mensaje, required this.esExito, required this.fecha});
}

class NotificacionesScreen extends StatelessWidget {
   NotificacionesScreen({super.key});

  // Lista de datos de ejemplo. En una app real, esto vendría de una base de datos.
  final List<Notificacion> _listaNotificaciones = [
    Notificacion(mensaje: 'Tu reserva ha sido confirmada', esExito: true, fecha: DateTime(2023,10,27,10,00)),
    Notificacion(mensaje: 'Pago exitoso por \$15.00', esExito: true, fecha: DateTime(2023,10,27, 09,59)),
    Notificacion(mensaje: 'No pudimos efectuar tu reserva', esExito: false, fecha: DateTime(2023,10,26 ,15,30)),
    Notificacion(mensaje: 'Tu reserva ha sido confirmada', esExito: true, fecha: DateTime(2023,10,25 ,18,00)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // El AppBar se gestiona desde HomeScreen, así que aquí no es necesario.
        // Si esta pantalla se abriera de forma independiente, sí lo necesitaría.
        title: const Text('Notificaciones'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: _listaNotificaciones.length,
        itemBuilder: (context, index) {
          final notificacion = _listaNotificaciones[index];
          final icono = notificacion.esExito ? Icons.check : Icons.close;
          final colorIcono = notificacion.esExito ? Colors.green.shade700 : Colors.red.shade700;
          final colorFondoIcono = notificacion.esExito ? Colors.green.shade100 : Colors.red.shade100;

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
            elevation: 2.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  // --- Círculo con el Icono ---
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: colorFondoIcono,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icono, color: colorIcono, size: 24),
                  ),
                  const SizedBox(width: 16),

                  // --- Texto de la Notificación ---
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notificacion.mensaje,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Hace 2 horas', // En una app real, calcularíamos esto desde la fecha.
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}