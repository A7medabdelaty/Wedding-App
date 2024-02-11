import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding/core/utils/app_router.dart';
import 'package:wedding/core/utils/assets.dart';

import 'features/splash/presentation/views/splash_page.dart';

void main() {
  runApp(const WeddingApp());
}

class WeddingApp extends StatelessWidget {
  const WeddingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsData.backgroundImage),
          fit: BoxFit.cover,
        )
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent
        ),
      ),
    );
  }
}
