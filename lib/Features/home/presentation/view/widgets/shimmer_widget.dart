import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidgetLoading extends StatelessWidget {
  const ShimmerWidgetLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300] ?? Colors.white,
        highlightColor: Colors.grey[200] ?? Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    height: 20,
                    width: MediaQuery.sizeOf(context).width - 165,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                    height: 20,
                    width: MediaQuery.sizeOf(context).width - 165,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                    height: 20,
                    width: MediaQuery.sizeOf(context).width * .1,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey,
              ),
              height: 80,
              width: 120,
            )
          ],
        ));
  }
}
