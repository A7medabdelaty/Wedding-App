import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding/core/common/custom_button.dart';
import 'package:wedding/core/utils/app_router.dart';
import 'package:wedding/features/auth/data/profile.dart';
import 'package:wedding/features/home/manager/DataFetchCubit.dart';
import 'package:wedding/features/home/presentation/views/provider_home/widgets/videos_list_view.dart';

import '../user_home/widgets/images_list_view.dart';
import '../user_home/widgets/provider_details.dart';

class ProviderHomePage extends StatelessWidget {
  const ProviderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orangeAccent,
        title: const Text("Photographer Details"),
        actions:  [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Icon(Icons.edit),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.home_repair_service),
          ),

          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut();
            GoRouter.of(context).pushReplacement(AppRouter.KLoginPage);
          }, icon: const Icon(Icons.logout )),
        ],
      ),
      backgroundColor: Colors.white.withOpacity(0.7),
      body:  SafeArea(
        child:BlocBuilder<DataFetchingCubit,Profile?>(
          builder: (context,profile){
            if(profile!=null){
              return  CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          //BooksDetailsSection(),
                           ProviderDetails(name: '${profile.name}',
                           gover: '${profile.governorate}',
                             address: '${profile.address}',
                             phone: '${profile.phoneNumber}',
                             price: "${profile.price}",
                             imageUrl: '${profile.profilePic}',

                           ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(status: "Upload Images", onPressed: (){
                                }),
                                CustomButton(status: "Upload Videos", onPressed: (){
                                }),
                              ],
                            ),
                          ),

                          const Expanded(
                              child: SizedBox(
                                height: 30,
                              )
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Images" , style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500
                              ),

                              ),
                            ),
                          ),
                          const ImageListView(),
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Videos" , style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500
                              ),

                              ),
                            ),
                          ),

                          const VideoListView(),

                          const SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            }else{
              return const CircularProgressIndicator();
            }
          },
        )
      ),
    );
  }
}

