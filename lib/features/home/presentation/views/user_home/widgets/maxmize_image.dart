import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding/core/utils/assets.dart';
class MaxmizeImage extends StatelessWidget {
  const MaxmizeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: GestureDetector(
        onTap: () {
          GoRouter.of(context).pop(); // Go back to the previous screen when tapping on the image
        },
        child: Hero(
          tag: AssetImage(AssetsData.testImage),
          child: Center(
            child: Image.asset(
              AssetsData.testImage,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
