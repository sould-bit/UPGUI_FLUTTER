import 'package:flutter/material.dart';
import 'package:mi_first_app/screens/pagos_screen.dart'
    '';
class FormularioReservaScreen extends StatefulWidget {
  // 1. Variable para recibir la fecha seleccionada desde la pantalla anterior.
  final DateTime diaSeleccionado;

  // 2. El constructor ahora requiere que se le pase el día seleccionado.
  const FormularioReservaScreen({
    super.key,
    required this.diaSeleccionado,
  });

  @override
  State<FormularioReservaScreen> createState() => _FormularioReservaScreenState();
}

class _FormularioReservaScreenState extends State<FormularioReservaScreen> {
  // 3. Una "GlobalKey" para identificar y gestionar nuestro formulario.
  final _formKey = GlobalKey<FormState>();

  // 4. Controladores para cada campo de texto. Nos permiten leer/modificar su contenido.
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _jugadoresController = TextEditingController();
  final TextEditingController _horaController = TextEditingController();

  // 5. Es una buena práctica liberar los controladores cuando el widget se destruye.
  @override
  void dispose() {
    _nombreController.dispose();
    _telefonoController.dispose();
    _correoController.dispose();
    _jugadoresController.dispose();
    _horaController.dispose();
    super.dispose();
  }

  void _submitFormulario() {
    // 6. Esta línea ejecuta los validadores de todos los campos del formulario.
    if (_formKey.currentState!.validate()) {
      // Si todos los campos son válidos, el código aquí se ejecuta.

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PagosScreen()),
      );


      print('¡Formulario válido!');
      print('Día: ${widget.diaSeleccionado}'); // Accedemos al día desde el 'widget'
      print('Nombre: ${_nombreController.text}');
      print('Teléfono: ${_telefonoController.text}');
      print('Correo: ${_correoController.text}');
      print('Jugadores: ${_jugadoresController.text}');
      print('Hora: ${_horaController.text}');

      // ¡Aquí iría la navegación a la pasarela de pagos!



    } else {
      // Si algún campo no es válido, se mostrarán los mensajes de error.
      print('Formulario inválido. Por favor, corrige los errores.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completa tu Reserva'),
        backgroundColor: Colors.blue.shade300,
      ),
      body: SingleChildScrollView( // 7. Permite hacer scroll si el teclado tapa los campos.
        padding: const EdgeInsets.all(16.0),
        child: Form( // 8. El widget que envuelve todos nuestros campos de formulario.
          key: _formKey, // Le asignamos nuestra clave.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Estira los elementos
            children: [
              // Mostramos la fecha que recibimos
              Text(
                'Fecha seleccionada: ${widget.diaSeleccionado.day}/${widget.diaSeleccionado.month}/${widget.diaSeleccionado.year}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // --- Campo de Hora ---
              TextFormField(
                controller: _horaController,
                decoration: const InputDecoration(
                  labelText: 'Hora (ej: 14:00)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.access_time),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce una hora';
                  }
                  return null; // null significa que la validación pasó
                },
              ),
              const SizedBox(height: 16),

              // --- Campo de Número de Jugadores ---
              TextFormField(
                controller: _jugadoresController,
                decoration: const InputDecoration(
                  labelText: 'Número de Jugadores',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.people),
                ),
                keyboardType: TextInputType.number, // Muestra un teclado numérico
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce el número de jugadores';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // --- Campo de Nombre ---
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre Completo',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu nombre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // --- Campo de Teléfono ---
              TextFormField(
                controller: _telefonoController,
                decoration: const InputDecoration(
                  labelText: 'Teléfono',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu teléfono';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // --- Campo de Correo ---
              TextFormField(
                controller: _correoController,
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu correo';
                  }
                  // Opcional: validación de formato de email más estricta
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Por favor, introduce un correo válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // --- Botón de Reservar ---
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen.shade300,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: _submitFormulario,
                child: const Text('Continuar al Pago', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
