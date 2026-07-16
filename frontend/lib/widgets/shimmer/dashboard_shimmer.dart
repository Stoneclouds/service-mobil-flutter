import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DashboardShimmer extends StatelessWidget {
  const DashboardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: [

          Container(
            height: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          const SizedBox(height:20),

          Row(
            children: [

              Expanded(
                child: Container(
                  height:80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(width:15),

              Expanded(
                child: Container(
                  height:80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

            ],
          ),

          const SizedBox(height:20),

          Container(
            height:250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),

        ],
      ),
    );
  }
}