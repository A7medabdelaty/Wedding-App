import 'package:flutter/material.dart';
import 'package:wedding/features/home/presentation/views/user_home/widgets/custom_app_bar.dart';
import 'package:wedding/features/home/presentation/views/user_home/widgets/provider_list_view.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
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



