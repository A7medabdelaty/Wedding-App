import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/common/custom_button.dart';
import '../../../../../../../core/common/custom_text_feild.dart';
import '../../../../../../../core/utils/app_router.dart';
import '../../../../../manager/auth_cubit/auth_cubit.dart';
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  String email = '';
  String password = '';

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthenticationCubit>().signInWithEmailAndPassword(
        email,
        password,
      );
      GoRouter.of(context).pushReplacement(AppRouter.KUserHome);
    }

  }
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextFeild(
            hint: "Email",
            secure: false,
            icon: const Icon(Icons.person),
            type: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email is required";
              } else {
                email = value;
                return null;
              }
            },
          ),
          const SizedBox(height: 10),
          CustomTextFeild(
            hint: "Password",
            secure: true,
            icon: const Icon(Icons.password),
            type: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password is required";
              } else {
                password = value;
                return null;
              }
            },
          ),
          const SizedBox(height: 10),
          CustomButton(status: "Login", onPressed: () {
            _login(context);
          }),
        ],
      ),
    );
  }
}
