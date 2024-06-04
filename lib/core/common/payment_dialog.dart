import 'package:flutter/material.dart';
import 'package:wedding/features/auth/data/profile.dart';
import 'package:wedding/features/home/presentation/views/user_home/pages/payment_page.dart';

class PaymentDialog extends StatelessWidget {
  const PaymentDialog({
    super.key,
    required this.userData,
    required this.photographerData,
    required this.selectedDate,
    required this.selectedTime,
  });

  final Profile userData;
  final Profile photographerData;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select Payment Method',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Cash');
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'You Selected Cash pay, Your payment is with the photographer',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16.0),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Ok'),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text('Pay with Cash'),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Visa');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PaymentPage(
                        userProfile: userData,
                        photographerProfile: photographerData,
                        date: selectedDate,
                        time: selectedTime,
                      );
                    },
                  ),
                );
              },
              child: const Text('Pay with Visa'),
            ),
          ],
        ),
      ),
    );
  }
}
