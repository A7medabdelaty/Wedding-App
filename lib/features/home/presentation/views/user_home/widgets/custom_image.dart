import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding/core/utils/app_router.dart';



class CustomImagesWedding extends StatelessWidget {
  const CustomImagesWedding({super.key, required this.url,});
  final String url;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.KMaximizeImage);
      },
      child: SizedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
              aspectRatio: 3.8 / 4,
              child:CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: url,
                errorWidget:(context,url,error)=> const Icon(Icons.error , color: Colors.red,),
              )

          ),
        )
      ),
    );
  }
}
