import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/data/models/service_model.dart';
import 'package:task/ui/widgets/cached_image.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({required this.service, super.key});

  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 157.w,
      height: 192.h,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          children: [
            Expanded(
              child: CachedImage(
                imageUrl: service.mainImage,
                width: double.maxFinite,
                height: double.maxFinite,
              ),
            ),
            const Expanded(child: Column()),
          ],
        ),
      ),
    );
  }
}
