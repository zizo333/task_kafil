import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/res/app_sizes.dart';
import 'package:task/data/models/service_model.dart';
import 'package:task/ui/screens/services/widgets/service_widget.dart';

class HorizontalServicesWidget extends StatelessWidget {
  const HorizontalServicesWidget({required this.services, super.key});

  final List<ServiceModel> services;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 202.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.hScreenPadding.w,
          vertical: 6.h,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ServiceWidget(
            service: services[index],
          );
        },
        separatorBuilder: (_, __) {
          return 8.hSpace;
        },
        itemCount: services.length,
      ),
    );
  }
}
