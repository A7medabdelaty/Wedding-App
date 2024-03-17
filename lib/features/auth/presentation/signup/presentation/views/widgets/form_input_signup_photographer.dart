import 'package:flutter/material.dart';

import '../../../../../../../constants.dart';
import '../../../../../../../core/common/custom_button.dart';
import '../../../../../../../core/common/custom_text_feild.dart';
import '../signup_provider_page2.dart';
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class SignUpPhotographerForm extends StatefulWidget {
  const SignUpPhotographerForm({super.key});

  @override
  State<SignUpPhotographerForm> createState() => _SignUpPhotographerFormState();
}

class _SignUpPhotographerFormState extends State<SignUpPhotographerForm> {

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
                        }
                        else if(!Constant.isValidEmail(value)){
                          return "Invalid Email";
                        }
                        else{
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


                        }else if(value.length<6){
                          return "password must be greater than 6 characters";
                        }

                        else{
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
