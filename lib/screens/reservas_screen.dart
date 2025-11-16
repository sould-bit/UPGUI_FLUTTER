import 'package:flutter/material.dart';
import 'package:mi_first_app/screens/formulario_reservar_canchas.dart';
import 'package:table_calendar/table_calendar.dart';

class ReservasScreen extends StatefulWidget {
  const ReservasScreen({super.key});

  @override
  State<ReservasScreen> createState() => _ReservasScrenState();


}


class _ReservasScrenState extends State<ReservasScreen> {
  // ESTADO

  //formato inicial del calendario
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectDay;


  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Calendario de Reservas'),
        backgroundColor: Colors.blue.shade400,
      ),

      body: Column(
        children: [
          TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2025,1,1),
              lastDay: DateTime(2030,1,1),
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                // Esta función determina si un día está "seleccionado".
                // isSameDay es una función de ayuda del paquete para comparar días sin la hora.
                return isSameDay(_selectDay, day);
              },
              onDaySelected: (selectDay, focusedDay){
                if(!isSameDay(_selectDay, selectDay)){

                  setState(() {
                    _selectDay = selectDay;
                    _focusedDay = focusedDay; //actualizamos el dia al foco selecionado
                  });
                }
              },
            onFormatChanged: (format){
                //permite al usuario cambiar del formato
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }

          },
          onPageChanged: (focusedDay){
                // se llama cuando el usuario cambia de mes o semana
            _focusedDay =focusedDay;
          },

            //----------------APOARIENCIA-----------------------
            calendarStyle: const CalendarStyle(
              outsideDaysVisible: false,
              todayDecoration: BoxDecoration(
                color: Colors.blue,
                shape:  BoxShape.circle,
              ),
              // estilo seleccion del usuario

              selectedDecoration: BoxDecoration(
                color: Colors.lightGreen,
                shape: BoxShape.circle,
              ),
            ),

          headerStyle: const HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false //ocultamos boton para cambiar formato para look mas clean
          ),
          ),
          const Spacer(),

          Padding(
              padding: const EdgeInsets.all(16.0),
              child:  SizedBox(
                width: double.infinity, //boton ocupa todo el ancho
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen.shade100,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                    ),
                  ),



                onPressed: _selectDay == null ? null : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FormularioReservaScreen(diaSeleccionado: _selectDay!,
                        ),
                        ),
                      );


                },

                child: const Text(
                  'RESERVAR', style: TextStyle(fontSize: 20),
                ),
                ),


              ),
          )
        ],
      ),

    );
  }


}