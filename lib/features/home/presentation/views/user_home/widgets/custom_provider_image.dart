import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets.dart';


class CustomProviderImage extends StatelessWidget {
  const CustomProviderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AspectRatio(
        aspectRatio: 3.8 / 4,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              image:  DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(AssetsData.photographerImage))),
        ),
      ),
    );
  }
}
