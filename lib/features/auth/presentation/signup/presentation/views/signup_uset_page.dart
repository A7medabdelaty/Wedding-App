import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wedding/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:wedding/features/auth/manager/auth_cubit/auth_state.dart';
import 'package:wedding/features/auth/presentation/signup/presentation/views/widgets/form_input_signup_user.dart';

import '../../../../../../core/utils/app_router.dart';

class SignUpUserPage extends StatelessWidget {
  const SignUpUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: BlocBuilder<AuthenticationCubit,AuthState>(
            builder:(context,state){
              if(state is AuthenticationLoading){
                return const Center(child: CircularProgressIndicator(),);
              }else if(state is AuthenticationFailure){
                Future.delayed(Duration.zero,(){
                  AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      title: "Login failed",
                      desc: "Check data please",
                      btnCancelOnPress: (){

                      }
                  ).show();
                });

                return const FormInputSignup();
              }else if(state is AuthenticationSuccess){
                return const FormInputSignup();
              }else{
                return const FormInputSignup();
              }
            },
          ),
        ),
      ),
    );
  }
}
