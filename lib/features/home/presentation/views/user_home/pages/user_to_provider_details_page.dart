import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding/core/utils/app_router.dart';
import 'package:wedding/features/home/presentation/views/provider_home/widgets/videos_list_view.dart';
import 'package:wedding/features/home/presentation/views/user_home/widgets/images_list_view.dart';
import 'package:wedding/features/home/presentation/views/user_home/widgets/provider_details.dart';



class UserToProviderDetailsPage extends StatelessWidget {
  const UserToProviderDetailsPage({super.key});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Photographer Details" ),
        backgroundColor: Colors.orangeAccent,
        actions:  [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(icon: const Icon(FontAwesomeIcons.calendarCheck,),
              onPressed: (){
              GoRouter.of(context).push(AppRouter.KReservationPage);
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white.withOpacity(0.7),
      body: const SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    //BooksDetailsSection(),
                    ProviderDetails(),
                    Expanded(
                        child: SizedBox(
                          height: 40,
                        )),
                    Padding(
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
                    ImageListView(),
                    SizedBox(
                      height: 30,
                    ),
                     Padding(
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
                    VideoListView(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

