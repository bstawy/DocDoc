import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RectShimmerEffect extends StatelessWidget {
  final double width, height, borderRadius;

  const RectShimmerEffect({
    super.key,
    this.width = 100,
    this.height = 100,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
    );
  }
}
