import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding/features/home/presentation/views/user_home/widgets/custom_app_bar.dart';
import 'package:wedding/features/home/presentation/views/user_home/widgets/provider_list_view.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/assets.dart';


class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orangeAccent,
        title:  const Text("Wedding" , style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: AssetsData.Dancing,
          color: Colors.white

        ),
        ),
        actions:  [
          IconButton(
              icon: const Icon(FontAwesomeIcons.circleInfo, color: Colors.white,
              ),
            onPressed: (){
                GoRouter.of(context).push(AppRouter.KAboutUs);
            },
          ),
          IconButton(
              icon: const Icon(FontAwesomeIcons.contactCard,color: Colors.white,
              ),
            onPressed: (){
                GoRouter.of(context).push(AppRouter.kContactUs);
            },
          ),
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut();
            GoRouter.of(context).pushReplacement(AppRouter.KLoginPage);
          }, icon: const Icon(Icons.logout, color: Colors.white,)),
        ],
      ),
      body: const Column(
        children: [
          CustomAppBar(),
          SizedBox(height: 18,),
          Expanded(
              child: ProviderListView(),
          ),
        ],
      ),
    );
  }
}



