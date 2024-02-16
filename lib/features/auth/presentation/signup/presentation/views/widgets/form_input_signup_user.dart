import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/common/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/common/custom_text_feild.dart';
import '../../../../../../../core/utils/app_router.dart';
import '../../../../../manager/auth_cubit/auth_cubit.dart';
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class FormInputSignup extends StatefulWidget {
  const FormInputSignup({super.key});

  @override
  State<FormInputSignup> createState() => _FormInputSignupState();
}

class _FormInputSignupState extends State<FormInputSignup> {

  String email = '';
  String password = '';
  String name='';
  String phoneNumber='';
  String confirmPassword='';

  Future<void> addUserToFirestore(String name, String email , String phoneNumber,String userId) async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'name': name,
        'email': email,
        'phoneNumber':phoneNumber,
        'userId':userId,
        'authorization':"user"
        // Add other fields as needed
      });
      print('User added to Firestore successfully.');
    } catch (e) {
      print('Error adding user to Firestore: $e');
    }
  }
  void navigate(BuildContext context){
    _signUp(context);
    GoRouter.of(context).pushReplacement(AppRouter.KUserHome);
  }
  void _signUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (confirmPassword == password) {
        try {
          // Create user in Firebase Authentication
          User? user = await context.read<AuthenticationCubit>().signUpWithEmailAndPassword(email, password);

          if (user != null) {
            // Use the user's ID to store additional information in Firestore
            final userId = user.uid;
            addUserToFirestore(name, email, phoneNumber, userId);

            // Navigate to the home page after successful signup

          }


        } catch (e) {
          print('Error during signup: $e');
          // Handle signup errors here
        }
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: "Wrong password",
          desc: "Password and Confirm password are different",
          btnCancelOnPress: () {},
        ).show();
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                          name=value;
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
                          phoneNumber=value;
                          return null;
                        }
                      },


                    ),
                    const SizedBox(height: 8,),
                    CustomTextFeild(
                      hint: "Email",secure: false,icon: const Icon(Icons.email),
                      type: TextInputType.emailAddress,
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return "Email is required";
                        }else{
                          email=value;
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 8,),
                    CustomTextFeild(hint: "Password",secure: true,icon: const Icon(Icons.password),
                      type: TextInputType.text,
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return "password is required";
                        }else{
                          password=value;
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 8,),
                    CustomTextFeild(
                      hint: "Password Confirm",secure: true,icon: const Icon(Icons.password),
                      type: TextInputType.text,
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return "confirm password is required";
                        }else{
                          confirmPassword=value;
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 16,),

                    CustomButton(status:"Sign Up" , onPressed: (){
                      navigate(context);

                    }),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
