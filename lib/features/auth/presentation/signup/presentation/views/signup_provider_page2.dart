import 'dart:async';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wedding/constants.dart';
import 'package:wedding/core/utils/app_router.dart';
import 'package:wedding/core/utils/styles.dart';
import 'package:wedding/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:wedding/features/auth/manager/auth_cubit/auth_state.dart';
import 'package:wedding/features/auth/presentation/signup/presentation/views/widgets/custom_drop_down.dart';

import '../../../../../../core/common/custom_button.dart';
import '../../../../../../core/common/custom_text_feild.dart';
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class SignUpProviderPage2 extends StatefulWidget {
  const SignUpProviderPage2({super.key, required this.email, required this.password, required this.name, required this.phoneNumber});
  final String email ;
  final String password ;
  final String name;
  final String phoneNumber;

  @override
  State<SignUpProviderPage2> createState() => _SignUpProviderPage2State();
}

class _SignUpProviderPage2State extends State<SignUpProviderPage2> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
              margin: const EdgeInsets.all(16),
              child: BlocBuilder<AuthenticationCubit,AuthState>(
                builder: (context,state){
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
                    return SignUpPhotographerForm(name: widget.name,email: widget.email,password: widget.password,phoneNumber: widget.phoneNumber,);
                  }else if(state is AuthenticationSuccess){
                    return SignUpPhotographerForm(email: widget.email, password: widget.password, name: widget.name, phoneNumber: widget.phoneNumber);
                  }else{
                    return SignUpPhotographerForm(name: widget.name,email: widget.email,password: widget.password,phoneNumber: widget.phoneNumber,);
                  }
                },
              )
          ),
        ),
      ),
    );
  }
}


class SignUpPhotographerForm extends StatefulWidget {
   SignUpPhotographerForm({super.key, required this.email, required this.password, required this.name, required this.phoneNumber});
  final String email ;
  final String password ;
  final String name;
  final String phoneNumber;
  late String imageUrl;

  @override
  State<SignUpPhotographerForm> createState() => _SignUpPhotographerFormState();
}

class _SignUpPhotographerFormState extends State<SignUpPhotographerForm> {
  String address="";
  String governement="";
  String gender="";
  String date="";

  DateTime selectedDate = DateTime.now();
  String? selectedImagePath;
  final TextEditingController dateController = TextEditingController(text: "mm/dd/yyyy");
  File? _image;
  String _imageUrl = "";

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() async {
        _image = File(pickedFile.path);
       _imageUrl= await _uploadImage();
      });
      print('Image picked: ${_image!.path}');
    } else {
      print("No image selected");
    }
  }

  Future<String> _uploadImage() async {
    if (_image == null) {
      print('No image selected');
      return ''; // or throw an exception based on your requirements
    }

    try {
      String fileExtension = _image!.path.split('.').last;
      String fileName = '${widget.name}.$fileExtension';

      Reference storageReference = FirebaseStorage.instance.ref('profilePics/').child(fileName);
      UploadTask uploadTask = storageReference.putFile(_image!);

      Completer<String> completer = Completer<String>();

      uploadTask.snapshotEvents.listen(
            (TaskSnapshot snapshot) {
          print('Upload progress: ${snapshot.bytesTransferred}/${snapshot.totalBytes}');
        },
        onError: (Object e) {
          print('Error during upload: $e');
          completer.completeError(e.toString());
        },
        onDone: () async {
          try {
            String imageUrl = await storageReference.getDownloadURL();
            print('Image uploaded. URL: $imageUrl');
            completer.complete(imageUrl);
          } catch (e) {
            print('Error getting download URL: $e');
            completer.completeError(e.toString());
          }
        },
      );

      return completer.future;
    } catch (e) {
      print('Error uploading image: $e');
      throw e; // Propagate the exception
    }
  }
  Future<void> addUserToFirestore(String name, String email , String phoneNumber,String photographerId,String gover,String address, String date, String gender,String imageUrl) async {
    try {
      await FirebaseFirestore.instance.collection('photographers').add({
        'name': name,
        'email': email,
        'phoneNumber':phoneNumber,
        'photographerId':photographerId,
        'gender':gender,
        'address':address,
        'governorate':gover,
        'birthDate':date,
        'profilePic':imageUrl,
        'authorization':'photographer'
        // Add other fields as needed
      });
      print('User added to Firestore successfully.');
    } catch (e) {
      print('Error adding user to Firestore: $e');
    }
  }
  void navigate(BuildContext context){
    _signUp(context);
    GoRouter.of(context).pushReplacement(AppRouter.KProviderHomePage);
  }
  void _signUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        // Create user in Firebase Authentication
        User? user = await context.read<AuthenticationCubit>().signUpWithEmailAndPassword(widget.email, widget.password);

        if (user != null) {
          // Use the user's ID to store additional information in Firestore
          final userId = user.uid;

          await  addUserToFirestore(widget.name, widget.email, widget.phoneNumber, userId,governement,address,dateController.text,gender,_imageUrl);

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

  Widget buildAvatar() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey,
            child: _image != null
                ? ClipOval(
              child: Image.file(
                _image!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            )
                : Icon(
              Icons.person,
              size: 50,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              icon: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              onPressed: () {
                _pickImage();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         buildAvatar(),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(8.0,4,8,8),
                          child: Text("Governorate" , style: Styles.kTextStyle18),
                        ),
                        DropDownButtonAuth(list: const ["Giza","Cairo","Alexandria"],
                          onChanged: (value){
                            governement=value;

                          },
                          icon: const Icon(Icons.location_on),
                        ),
                        const SizedBox(height: 8,),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Your address" , style: Styles.kTextStyle18),
                        ),
                        CustomTextFeild(
                          hint: "address"
                          ,secure: false
                          ,icon: const Icon(Icons.location_city)
                          , type: TextInputType.multiline,
                          validator: (value){
                            if(value==null||value.isEmpty){
                              return "address is required";
                            }else{
                              address=value;
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 8,),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("BirthDate" , style: Styles.kTextStyle18),
                        ),
                        GestureDetector(
                            onTap: ()async{
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: selectedDate,
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              );

                              if (pickedDate != null && pickedDate != selectedDate) {
                                setState(() {
                                  selectedDate = pickedDate;
                                  // You can format the date as needed
                                  dateController.text = "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
                                });
                              }
                            },
                            child:  Container(
                              color: Colors.white70,
                              child: Row(
                                children: [
                                  const Icon(Icons.date_range),
                                  const SizedBox(width: 8), // Adjust the spacing as needed
                                  Expanded(
                                    child: TextFormField(
                                      decoration: Constant.paymentDecoration.copyWith(fillColor: Colors.transparent),
                                      controller: dateController,
                                      enabled: false,
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                        const SizedBox(height: 8,),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Gender" , style: Styles.kTextStyle18),
                        ),
                        DropDownButtonAuth(list: const ["Male","Female"],
                          onChanged: (value){
                            gender=value;
                          },
                          icon: const Icon(Icons.person_2),
                        ),
                        const SizedBox(height: 16,),
                      ],
                    ),
                    // InkWell(
                    //   onTap: () async {
                    //     // Open gallery to select an image
                    //     _pickImage();
                    //   },
                    //   child: Container(
                    //     margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    //     color: Colors.white70,
                    //     child: const Row(
                    //       children: [
                    //         Icon(Icons.image),
                    //         SizedBox(width: 8),
                    //         Text("Select Image from Gallery"),
                    //       ],
                    //     ),
                    //   ),
                    // ),

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