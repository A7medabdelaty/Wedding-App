import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding/core/utils/app_router.dart';

import '../../../../../../core/utils/assets.dart';

class ProviderListViewItem extends StatelessWidget {
  const ProviderListViewItem({super.key, required this.imageUrl, required this.name, required this.gover});
  final String imageUrl,name,gover;
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.KProviderDetailsPage);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,

        ),
        child: SizedBox(
          height: 125,
          child: Row(
            children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
              aspectRatio: 3.1 / 4,
              child:CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: imageUrl,
                errorWidget:(context,url,error)=> const Icon(Icons.error , color: Colors.red,),
              )

          ),
        ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child:  Text(
                          name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 25
                          )
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                     Text(
                      gover,
                      style: const TextStyle(
                          fontSize: 20
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
