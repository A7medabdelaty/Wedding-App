import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';



class CustomProviderImage extends StatelessWidget {
  const CustomProviderImage({super.key, required this.imageUrl});
 final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          aspectRatio: 3.8 / 4,
          child:CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: imageUrl,
            errorWidget:(context,url,error)=> const Icon(Icons.error , color: Colors.red,),
          )

      ),
    );
  }
}