import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_provider_image.dart';

class ProviderDetails extends StatelessWidget {
  const ProviderDetails({super.key, required this.name, required this.gover, required this.address, required this.phone, required this.price, required this.imageUrl});
  final String name,gover,address,phone,price,imageUrl;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2, vertical: 16),
          child:  CustomProviderImage(imageUrl: imageUrl,),
        ),
        const SizedBox(
          height: 40,
        ),
         Text(
          name,
          style: const TextStyle(
              fontSize: 30,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(
          height: 6,
        ),

         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on),
            const SizedBox(width: 3,),
            Text(
              gover,
              style:const TextStyle(
                  fontSize: 20,
                fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(
              width: 16,
            ),

            Text(
              address,
              style:const TextStyle(
                  fontSize: 20,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
        const SizedBox(height: 8,),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.phone),
            const SizedBox(width:8,),
            Text(
              phone,
              style:const TextStyle(
                  fontSize: 20,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
        const SizedBox(height: 8,),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(FontAwesomeIcons.poundSign),
            const SizedBox(width:8,),
            Text(
              price,
              style:const TextStyle(
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
