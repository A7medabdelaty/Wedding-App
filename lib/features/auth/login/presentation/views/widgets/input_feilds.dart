import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding/core/common/custom_text_feild.dart';

import '../../../../../../core/common/custom_button.dart';
import '../../../../../../core/utils/app_router.dart';
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class InputFeilds extends StatelessWidget {
  const InputFeilds({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             CustomTextFeild(hint: "Email",secure: false,icon: const Icon(Icons.person),
              type: TextInputType.emailAddress,
              validator: (value){
                if(value==null||value.isEmpty){
                  return "Email is required";
                }else{
                  return null;
                }
              },
            ),
              const SizedBox(height: 10),
              CustomTextFeild(hint: "Password",secure: true,icon: const Icon(Icons.password),
               type: TextInputType.text,
                validator: (value){
                  if(value==null||value.isEmpty){
                    return "password is required";
                  }else{
                    return null;
                  }
                },
             ),
              const SizedBox(height: 10),
              CustomButton(status: "Login",onPressed: (){
                _formKey.currentState!.validate();
                GoRouter.of(context).push(AppRouter.KUserHome);
              },)
            ],
          ),
        ),
      ),
    );
  }
}

