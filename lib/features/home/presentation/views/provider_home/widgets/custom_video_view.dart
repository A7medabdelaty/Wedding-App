import 'package:flutter/material.dart';
import 'package:wedding/features/home/presentation/views/provider_home/video_dispaly_page.dart';

import '../../../../../../core/utils/assets.dart';


class CustomVideoView extends StatelessWidget {
final String url;

  const CustomVideoView({super.key, required this.url});
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return DisplayVideo(url: url,);
        }));

      },
      child: SizedBox(
        child: AspectRatio(
          aspectRatio: 3.8 / 4,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                image:  DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(AssetsData.testImage))),
          ),
        ),
      ),
    );
  }
}
