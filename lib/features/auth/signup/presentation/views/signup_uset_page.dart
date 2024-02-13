import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding/core/common/custom_button.dart';
import 'package:wedding/core/common/custom_text_feild.dart';

import '../../../../../core/utils/app_router.dart';
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class SignUpUserPage extends StatelessWidget {
  const SignUpUserPage({super.key});

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
                             CustomTextFeild(
                            hint: "UserName",secure: false,icon: const Icon(Icons.person),
                            type: TextInputType.name,
                              validator: (value){
                              if(value==null||value.isEmpty){
                                return "user name is required";
                              }else{
                                return null;
                              }
                              },
                      
                          ),
                          const SizedBox(height: 8,),
                           CustomTextFeild(
                            hint: "Phone Number",
                            secure: false,icon: Icon(Icons.phone), type: TextInputType.phone,
                            validator: (value){
                              if(value==null||value.isEmpty){
                                return "phone number is required";
                              }else{
                                return null;
                              }
                            },
            
            
                          ),
                          const SizedBox(height: 8,),
                           CustomTextFeild(
                            hint: "Email",secure: false,icon: Icon(Icons.email),
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
                           CustomTextFeild(
                            hint: "Password Confirm",secure: true,icon: Icon(Icons.password),
                            type: TextInputType.text,
                             validator: (value){
                               if(value==null||value.isEmpty){
                                 return "confirm password is required";
                               }else{
                                 return null;
                               }
                             },
                          ),
                          const SizedBox(height: 16,),
                      
                          CustomButton(status:"Sign Up" , onPressed: (){
                            _formKey.currentState!.validate();
                            GoRouter.of(context).push(AppRouter.KUserHome);
                      
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
