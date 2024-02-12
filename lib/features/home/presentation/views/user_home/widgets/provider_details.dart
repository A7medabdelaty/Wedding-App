import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_provider_image.dart';

class ProviderDetails extends StatelessWidget {
  const ProviderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2, vertical: 16),
          child: const CustomProviderImage(),
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          "Ahmed Mohamed",
          style: TextStyle(
              fontSize: 30,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(
          height: 6,
        ),

        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on),
            SizedBox(width: 3,),
            Text(
              "Cairo",
              style:TextStyle(
                  fontSize: 20,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(
              width: 16,
            ),

            Text(
              "Nasr City",
              style:TextStyle(
                  fontSize: 20,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
        const SizedBox(height: 8,),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone),
            SizedBox(width:8,),
            Text(
              "01115897979",
              style:TextStyle(
                  fontSize: 20,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
        const SizedBox(height: 8,),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.poundSign),
            SizedBox(width:8,),
            Text(
              "150",
              style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
              ),
            ),
          ],
        )


      ],
    );
  }
}
