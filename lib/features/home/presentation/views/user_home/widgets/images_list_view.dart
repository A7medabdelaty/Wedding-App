import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding/features/home/manager/image_fetch_cubit.dart';

import 'custom_image.dart';
class ImageListView extends StatelessWidget {
  const ImageListView({Key? key, required this.profileId}) : super(key: key);

  final String profileId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: BlocBuilder<ImageVideoCubit, List<String>>(
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomImagesWedding(url: state[index]),
              );
            },
          );
        },
      ),
    );
  }
}