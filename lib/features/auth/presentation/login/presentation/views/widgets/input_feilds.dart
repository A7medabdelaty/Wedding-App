import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wedding/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:wedding/features/auth/manager/auth_cubit/auth_state.dart';

import 'form_input_login.dart';


class InputFeilds extends StatelessWidget {
  const InputFeilds({Key? key});

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: BlocBuilder<AuthenticationCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthenticationLoading) {
              return const CircularProgressIndicator();
            } else if (state is AuthenticationFailure) {
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

              return const FormInput();
            } else if (state is AuthenticationSuccess) {

              return const FormInput();
            } else {
              // Handle other states if needed
              return const FormInput();
            }
          },
        ),
      ),
    );
  }
}
