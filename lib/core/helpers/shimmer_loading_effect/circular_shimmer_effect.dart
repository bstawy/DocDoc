import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularShimmerEffect extends StatelessWidget {
  final double size;

  const CircularShimmerEffect({super.key, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey[300],
      radius: size.r,
    );
  }
}
