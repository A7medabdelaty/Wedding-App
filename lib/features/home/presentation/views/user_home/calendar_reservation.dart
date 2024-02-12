import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wedding/core/common/custom_button.dart';
import 'package:wedding/core/utils/app_router.dart';

class ReservationScreen extends StatefulWidget {
  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  Map<DateTime, List<String>> reservations = {};

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      appBar: AppBar(
        title: const Text('Reservation Calendar'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.now().subtract(const Duration(days: 30)),
            lastDay: DateTime.now().add(const Duration(days: 30)),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: (day) {
              return reservations[day] ?? [];
            },
          ),
          const SizedBox(height: 20),
          CustomButton(status: "Make Reservation", onPressed: (){
            _showReservationDialog(context);

          })

        ],
      ),
    );
  }

  void _showReservationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Make Reservation'),
          content: TextField(
            decoration: const InputDecoration(labelText: 'Reservation details'),
            onChanged: (value) {
              // You can handle the reservation details input
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // Save the reservation for the selected day
                  reservations[_selectedDay] =
                      reservations[_selectedDay] ?? [];
                  reservations[_selectedDay]!.add('Reservation details');
                });
                GoRouter.of(context).push(AppRouter.KpaymentPage);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}