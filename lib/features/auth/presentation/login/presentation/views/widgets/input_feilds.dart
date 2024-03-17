import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:wedding/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:wedding/features/auth/manager/auth_cubit/auth_state.dart';

import '../../../../../../../core/utils/app_router.dart';
import 'form_input_login.dart';


class InputFeilds extends StatelessWidget {
  const InputFeilds({Key? key});

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: BlocConsumer<AuthenticationCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthenticationSuccessPhotographer) {

              GoRouter.of(context).pushReplacement(AppRouter.KProviderHomePage);
            } else if(state is AuthenticationSuccessUser){
              GoRouter.of(context).pushReplacement(AppRouter.KUserHome);

            }

            else if (state is AuthenticationFailure) {
              // Show error dialog for authentication failure
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Warning"),
                    content: const Text("Invalid email or password"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Try again"),
                      ),
                    ],
                  );
                },
              );
            }
          },
          builder: (BuildContext context, AuthState state) {
            if(state is AuthenticationLoading){
              return const Center(child: CircularProgressIndicator(),);
            }else{
              return const FormInput();
            }
          },
        ),
      ),
    );
  }
}