import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TrackingShimmer extends StatelessWidget {
  const TrackingShimmer({super.key});

  Widget box({
    double height = 20,
    double width = double.infinity,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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

            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [

                    box(height: 24, width: 180),

                    const SizedBox(height: 15),

                    box(width: 140),

                    const SizedBox(height: 10),

                    box(width: 200),

                    const SizedBox(height: 20),

                    box(width: 90),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [

                      const CircleAvatar(radius: 22),

                      const SizedBox(width: 15),

                      Expanded(
                        child: box(height: 55),
                      ),

                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}