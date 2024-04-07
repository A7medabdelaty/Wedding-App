import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 0, bottom: 10),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                // Implement search functionality
              },
              icon: const Icon(
                FontAwesomeIcons.search,
                size: 24,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Filter by Governorate'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: [
                            ListTile(
                              title: const Text('Cairo'),
                              onTap: () {
                                Navigator.pop(context, 'Cairo');
                              },
                            ),
                            ListTile(
                              title: const Text('Giza'),
                              onTap: () {
                                Navigator.pop(context, 'Giza');
                              },
                            ),
                            ListTile(
                              title: const Text('Alexandria'),
                              onTap: () {
                                Navigator.pop(context, 'Alexandria');
                              },
                            ),
                            ListTile(
                              title: Text('Other'),
                              onTap: () {
                                Navigator.pop(context, 'Other');
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ).then((selectedGovernorate) {
                  if (selectedGovernorate != null) {
                    // Call a function to filter the list based on the selected governorate
                  }
                });
              },
              icon: const Icon(
                Icons.filter_list,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
