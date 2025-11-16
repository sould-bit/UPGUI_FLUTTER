import 'package:flutter/material.dart';

// Usamos un enum para representar las opciones de pago de forma segura y clara.
enum MetodoPago { tarjeta, efectivo }

class PagosScreen extends StatefulWidget {
  const PagosScreen({super.key});

  @override
  State<PagosScreen> createState() => _PagosScreenState();
}

class _PagosScreenState extends State<PagosScreen> {
  // --- ESTADO ---
  // Variable para guardar el método de pago seleccionado. Puede ser nulo al inicio.
  MetodoPago? _metodoSeleccionado;

  void _seleccionarMetodo(MetodoPago metodo) {
    setState(() {
      _metodoSeleccionado = metodo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elige tu Método de Pago'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Empuja el botón al fondo
          children: [
            Column(
              children: [
                const Text(
                  'Selecciona cómo quieres pagar:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),

                // --- Opción Tarjeta de Crédito ---
                _buildOpcionPago(
                  titulo: 'Tarjeta de Crédito/Débito',
                  icono: Icons.credit_card,
                  metodo: MetodoPago.tarjeta,
                ),
                const SizedBox(height: 16),

                // --- Opción Efectivo ---
                _buildOpcionPago(
                  titulo: 'Pagar en Efectivo',
                  icono: Icons.money,
                  metodo: MetodoPago.efectivo,
                ),
              ],
            ),

            // --- Botón de Continuar ---
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                // El botón está deshabilitado si no se ha seleccionado un método.
                onPressed: _metodoSeleccionado == null ? null : () {
                  print('Método seleccionado: $_metodoSeleccionado');
                  // Aquí iría la lógica final de pago y la navegación
                  // a una pantalla de "Reserva Confirmada".
                },
                child: const Text('Confirmar y Pagar', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Método de construcción reutilizable para las opciones de pago ---
  Widget _buildOpcionPago({
    required String titulo,
    required IconData icono,
    required MetodoPago metodo,
  }) {
    final bool estaSeleccionado = _metodoSeleccionado == metodo;

    return GestureDetector(
      onTap: () => _seleccionarMetodo(metodo),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: estaSeleccionado ? Colors.blue.shade50 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: estaSeleccionado ? Colors.blue : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(icono, size: 40, color: estaSeleccionado ? Colors.blue : Colors.black54),
            const SizedBox(width: 16),
            Text(titulo, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}