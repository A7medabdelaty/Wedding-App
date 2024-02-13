import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 0, bottom: 10),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(16) , bottomRight: Radius.circular(16))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                },
                icon: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 24,
                  color: Colors.white,
                )),

            IconButton(
                onPressed: () {

                },
                icon: const Icon(
                  Icons.filter_list,
                  size: 30,
                  color: Colors.white,
                )),

          ],
        ),
      ),
    );
  }
}