import 'package:flutter/material.dart';

import 'package:wedding/features/auth/presentation/signup/presentation/views/signup_provider_page2.dart';

import '../../../../../../core/common/custom_button.dart';
import '../../../../../../core/common/custom_text_feild.dart';


final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class SignUpProviderPage extends StatelessWidget {
  const SignUpProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: SignUpPhotographer(),
        ),
      ),
    );
  }
}

class SignUpPhotographer extends StatefulWidget {
  const SignUpPhotographer({super.key});

  @override
  State<SignUpPhotographer> createState() => _SignUpPhotographerState();
}

class _SignUpPhotographerState extends State<SignUpPhotographer> {

  String email = '';
  String password = '';
  String name='';
  String phoneNumber='';
  String confirmPassword='';



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

                      hint: "Photographer Name",
                      secure: false,
                      icon: Icon(Icons.person),
                      type: TextInputType.name,
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return "Name is required";
                        }else{
                          name = value;
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
                          phoneNumber=value;
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
                          email=value;
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
                          password=value;
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
                          confirmPassword=value;
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 16,),

                    CustomButton(status:"Continue" , onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        if(confirmPassword==password){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpProviderPage2(
                                name: name,
                                phoneNumber: phoneNumber,
                                email: email,
                                password:password,
                              ),
                            ),
                          );
                        }
                        // Navigate to the ProfilePage and pass the data

                      }

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
