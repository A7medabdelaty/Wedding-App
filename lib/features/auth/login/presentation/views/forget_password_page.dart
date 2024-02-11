import 'package:flutter/material.dart';
import 'package:wedding/core/common/custom_text_feild.dart';

import '../../../../../core/common/custom_button.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.deepOrange,
                child:  Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("Forget Password" , style: TextStyle(color: Colors.white , fontSize: 24 , fontWeight: FontWeight.bold),),
                    ),
                    const SizedBox(height: 16,),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomTextFeild(hint: "enter Email", secure: false, icon: Icon(Icons.email)),

                    ),
                    const SizedBox(height: 16,),

                    CustomButton(status: "Continue",onPressed: (){

                    },),
                    const SizedBox(height: 16,),

                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

