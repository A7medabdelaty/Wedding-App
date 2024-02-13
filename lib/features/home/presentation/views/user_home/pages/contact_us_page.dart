import 'package:flutter/material.dart';
import 'package:wedding/constants.dart';
import 'package:wedding/core/common/custom_button.dart';
class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nameController,
                decoration: Constant.paymentDecoration.copyWith(
                    labelText: "Name",
                    labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                    )
                )
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: emailController,
                decoration:  Constant.paymentDecoration.copyWith(
                    labelText: "Email",
                    labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                    )
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: subjectController,
                decoration: Constant.paymentDecoration.copyWith(
                  labelText: "Subject",
                  labelStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400
                  )
                )
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: messageController,
                decoration: Constant.paymentDecoration.copyWith(
                    labelText: "Message",
                    labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                    )
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 16.0),
              CustomButton(status: "Submit Message",
                  onPressed: (){
                    print('Name: ${nameController.text}');
                    print('Email: ${emailController.text}');
                    print('Subject: ${subjectController.text}');
                    print('Message: ${messageController.text}');
                  })

            ],
          ),
        ),
      ),
    );
  }
}