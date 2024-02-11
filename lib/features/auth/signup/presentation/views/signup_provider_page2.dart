import 'package:flutter/material.dart';
import 'package:wedding/core/utils/styles.dart';
import 'package:wedding/features/auth/signup/presentation/views/widgets/custom_drop_down.dart';

import '../../../../../core/common/custom_button.dart';
import '../../../../../core/common/custom_text_feild.dart';

class SignUpProviderPage2 extends StatelessWidget {
  const SignUpProviderPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.deepOrange,
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text("SignUp" , style: TextStyle(color: Colors.white , fontSize: 24 , fontWeight: FontWeight.bold),),
                          ),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Governorate" , style: Styles.kTextStyle18),
                              ),
                              DropDownButtonAuth(list: const ["Giza","Cairo","Alexandria"],
                                onChanged: (value){
                                print(value);
                                },
                                icon: Icon(Icons.location_on),
                              ),
                              SizedBox(height: 8,),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Your address" , style: Styles.kTextStyle18),
                              ),
                              const CustomTextFeild(hint: "address",secure: false,icon: Icon(Icons.location_city),),
                              const SizedBox(height: 8,),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("BirthDate" , style: Styles.kTextStyle18),
                              ),
                              CustomTextFeild(hint: "mm/dd/yyyy",secure: true,icon: Icon(Icons.date_range),),
                              const SizedBox(height: 8,),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Gender" , style: Styles.kTextStyle18),
                              ),
                              DropDownButtonAuth(list: const ["Male","Female"],
                                onChanged: (value){
                                  print(value);
                                },
                                icon: Icon(Icons.person_2),
                              ),
                              const SizedBox(height: 16,),
                            ],
                          ),
                    
                    
                          CustomButton(status:"Sign Up" , onPressed: (){}),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
