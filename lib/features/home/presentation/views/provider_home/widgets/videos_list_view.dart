import 'package:flutter/material.dart';
import 'package:wedding/features/home/presentation/views/provider_home/widgets/custom_video_view.dart';
class VideoListView extends StatelessWidget {
  const VideoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomVideoView(),
            );
          }),
    );
  }
}
