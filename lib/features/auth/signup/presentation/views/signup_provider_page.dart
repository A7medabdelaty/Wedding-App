import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding/core/utils/app_router.dart';

import '../../../../../core/common/custom_button.dart';
import '../../../../../core/common/custom_text_feild.dart';
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class SignUpProviderPage extends StatelessWidget {
  const SignUpProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.deepOrange,
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text("SignUp" , style: TextStyle(color: Colors.white , fontSize: 24 , fontWeight: FontWeight.bold),),
                          ),
                           CustomTextFeild(hint: "Photographer Name",secure: false,icon: Icon(Icons.person),
                          type: TextInputType.name,
                            validator: (value){
                              if(value==null||value.isEmpty){
                                return "Name is required";
                              }else{
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 8,),
                           CustomTextFeild(hint: "Phone Number",secure: false,icon: Icon(Icons.phone),
                          type: TextInputType.phone,
                            validator: (value){
                              if(value==null||value.isEmpty){
                                return "phone is required";
                              }else{
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 8,),
                           CustomTextFeild(hint: "Email",secure: false,icon: Icon(Icons.email),
                          type: TextInputType.emailAddress,
                            validator: (value){
                              if(value==null||value.isEmpty){
                                return "Email is required";
                              }else{
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 8,),
                           CustomTextFeild(hint: "Password",secure: true,icon: Icon(Icons.password),
                          type: TextInputType.text,
                            validator: (value){
                              if(value==null||value.isEmpty){
                                return "password is required";
                              }else{
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 8,),
                           CustomTextFeild(hint: "Password Confirm",secure: true,icon: Icon(Icons.password),
                          type: TextInputType.text,
                            validator: (value){
                              if(value==null||value.isEmpty){
                                return "Password confirm is required";
                              }else{
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 16,),

                          CustomButton(status:"Continue" , onPressed: (){
                            _formKey.currentState!.validate();
                            GoRouter.of(context).push(AppRouter.KSignUpProvider2);
                          }),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
