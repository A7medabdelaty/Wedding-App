import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding/core/common/custom_text_feild.dart';

import '../../../../../../core/common/custom_button.dart';
import '../../../../../../core/utils/app_router.dart';
class InputFeilds extends StatelessWidget {
  const InputFeilds({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        const CustomTextFeild(hint: "Email",secure: false,icon: Icon(Icons.person),),
          const SizedBox(height: 10),
         const CustomTextFeild(hint: "Password",secure: true,icon: Icon(Icons.password),),
          const SizedBox(height: 10),
          CustomButton(status: "Login",onPressed: (){
            GoRouter.of(context).push(AppRouter.KUserHome);
          },)
        ],
      ),
    );
  }
}

