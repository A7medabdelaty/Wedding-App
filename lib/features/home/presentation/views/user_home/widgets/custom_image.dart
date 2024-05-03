import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wedding/features/home/presentation/views/user_home/widgets/maxmize_image.dart';



class CustomImagesWedding extends StatelessWidget {
  const CustomImagesWedding({super.key, required this.url,});
  final String url;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return MaxmizeImage(url: url,);
        }));
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
