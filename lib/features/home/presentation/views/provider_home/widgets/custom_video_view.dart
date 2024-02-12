import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/assets.dart';


class CustomVideoView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.KVideoDisplayPage);
      },
      child: SizedBox(
        child: AspectRatio(
          aspectRatio: 3.8 / 4,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                image:  DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(AssetsData.testImage))),
          ),
        ),
      ),
    );
  }
}
