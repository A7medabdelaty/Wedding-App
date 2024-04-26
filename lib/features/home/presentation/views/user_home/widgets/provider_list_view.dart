
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding/features/auth/data/profile.dart';
import 'package:wedding/features/home/manager/PhotographersFetchCubit.dart';
import 'package:wedding/features/home/presentation/views/user_home/widgets/provider_list_view_item.dart';

class ProviderListView extends StatelessWidget {
  const ProviderListView({super.key, required this.userData});
  final Profile userData;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataFetchingPhotographersCubit,List<Profile>>(
        builder:(context,profiles){
          if(profiles.isNotEmpty){
            return Container(

              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.orangeAccent.withOpacity(0.3),

              ),
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: profiles.length,
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: ProviderListViewItem(profile: profiles[index],
                        userData: userData,
                      ),
                    );
                  }),
            );
          }else{
            return const Center(child: CircularProgressIndicator());
          }
        }
    );
  }
}



