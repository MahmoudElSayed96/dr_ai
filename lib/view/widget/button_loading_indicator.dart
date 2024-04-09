import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/color.dart';

class ButtonLoadingIndicator extends StatelessWidget {
  const ButtonLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.w,
      width: 20.w,
      child: const CircularProgressIndicator(
        color: ColorManager.white,
        strokeCap: StrokeCap.round,
        strokeWidth: 2.5,
      ),
    );
  }
}
