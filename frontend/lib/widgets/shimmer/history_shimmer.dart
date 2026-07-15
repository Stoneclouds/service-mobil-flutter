  import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HistoryShimmer extends StatelessWidget {
  const HistoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {

    return Shimmer.fromColors(

      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,

      child: ListView.builder(

        padding: const EdgeInsets.all(20),

        itemCount: 6,

        itemBuilder: (_, __) {

          return Card(

            margin: const EdgeInsets.only(bottom: 15),

            child: const ListTile(

              leading: CircleAvatar(),

              title: SizedBox(
                height: 18,
              ),

              subtitle: SizedBox(
                height: 35,
              ),

            ),

          );

        },

      ),

    );

  }

}