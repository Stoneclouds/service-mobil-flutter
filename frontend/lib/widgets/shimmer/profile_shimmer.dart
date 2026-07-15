import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  Widget box({
    double height = 18,
    double width = double.infinity,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Shimmer.fromColors(

      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,

      child: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            const CircleAvatar(
              radius: 50,
            ),

            const SizedBox(height: 20),

            box(width: 180, height: 24),

            const SizedBox(height: 12),

            box(width: 120),

            const SizedBox(height: 40),

            box(height: 70),

            const SizedBox(height: 20),

            box(height: 70),

          ],

        ),

      ),

    );

  }

}