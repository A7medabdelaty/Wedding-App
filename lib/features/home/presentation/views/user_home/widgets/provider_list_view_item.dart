import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding/core/utils/app_router.dart';

import '../../../../../../core/utils/assets.dart';

class ProviderListViewItem extends StatelessWidget {
  const ProviderListViewItem({super.key});

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
              AspectRatio(
                aspectRatio: 3.1 / 4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    image:  DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AssetsData.photographerImage
                      ),
                    ),
                  ),
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
                      child: const Text(
                          "Ahmed Mohamed",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 25
                          )
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      "Cairo",
                      style: TextStyle(
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
