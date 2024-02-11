import 'package:flutter/material.dart';
import 'package:wedding/features/home/presentation/views/user_home/widgets/provider_list_view_item.dart';

class ProviderListView extends StatelessWidget {
  const ProviderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.orangeAccent.withOpacity(0.3),

      ),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ProviderListViewItem(),
            );
          }),
    );
  }
}



