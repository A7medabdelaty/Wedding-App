import 'package:flutter/material.dart';
import 'package:wedding/features/home/presentation/views/user_home/widgets/images_list_view.dart';
import 'package:wedding/features/home/presentation/views/user_home/widgets/provider_details.dart';


import '../../../../../core/utils/assets.dart';

class UserToProviderDetailsPage extends StatelessWidget {
  const UserToProviderDetailsPage({super.key});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Provider Details" ),
        backgroundColor: Colors.orangeAccent,
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
                    ImageListView(),
                    SizedBox(
                      height: 40,
                    )
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

