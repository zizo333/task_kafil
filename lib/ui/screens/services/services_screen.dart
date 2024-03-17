import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/res/app_sizes.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/core/theming/app_colors.dart';
import 'package:task/core/theming/text_styles.dart';
import 'package:task/data/models/service_model.dart';
import 'package:task/ui/screens/services/widgets/horizontal_services_widget.dart';
import 'package:task/ui/screens/services/widgets/service_widget.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: 52.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HorizontalServicesWidget(
            services: [
              ServiceModel(
                id: 1,
                mainImage:
                    'https://kafiil.com//storage/images/products/d1bbf83a-b810-485b-878c-2a80093e307b.jpg',
                price: 35,
                discount: 10,
                priceAfterDiscount: 25,
                title:
                    'سأقوم بكتابة مقالة عن موقعك أو مدونتك ونشرها علي موقعي دومين اثورتي 45',
                averageRating: 5,
                completedSalesCount: 3,
                recommended: false,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: AppSizes.hScreenPadding.w,
              right: AppSizes.hScreenPadding.w,
              top: 40.h,
              bottom: 32.h,
            ),
            child: Text(
              AppStrings.popularServices,
              style: TextStyles.font18SemiBold(AppColors.black),
            ),
          ),
          const HorizontalServicesWidget(
            services: [
              ServiceModel(
                id: 1,
                mainImage:
                    'https://kafiil.com//storage/images/products/d1bbf83a-b810-485b-878c-2a80093e307b.jpg',
                price: 35,
                discount: 10,
                priceAfterDiscount: 25,
                title:
                    'سأقوم بكتابة مقالة عن موقعك أو مدونتك ونشرها علي موقعي دومين اثورتي 45',
                averageRating: 5,
                completedSalesCount: 3,
                recommended: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
