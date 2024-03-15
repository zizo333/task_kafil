import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumExtension on num {
  SizedBox get vSpace => SizedBox(height: toDouble().h);
  SizedBox get hSpace => SizedBox(width: toDouble().w);
}
