import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/extensions/context_extension.dart';
import 'package:task/core/extensions/num_extenison.dart';
import 'package:task/core/res/app_media.dart';
import 'package:task/core/theming/app_colors.dart';
import 'package:task/core/theming/text_styles.dart';
import 'package:task/data/models/service_model.dart';
import 'package:task/ui/widgets/cached_image.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({required this.service, super.key});

  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157.w,
      padding: EdgeInsets.only(
        left: 3.w,
        right: 3.w,
        top: 2.h,
        bottom: 18.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.containerShadow,
            blurRadius: 8.r,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                CachedImage(
                  imageUrl: service.mainImage,
                  width: double.maxFinite,
                  height: double.maxFinite,
                  radius: 8.r,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 6.w,
                  bottom: 7.h,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Text(
                      '\$${service.discount}',
                      style: TextStyles.font12Medium(Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(
                left: 6.w,
                right: 6.w,
                top: 8.h,
              ),
              child: Column(
                children: [
                  Text(
                    service.title,
                    style: TextStyles.font11Medium(AppColors.black),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  10.vSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppSvgs.star,
                        height: 14.r,
                        width: 14.r,
                      ),
                      4.hSpace,
                      Text(
                        '(${service.averageRating})',
                        style: TextStyles.font11Regular(
                          context.colorScheme.secondary,
                        ),
                      ),
                      6.hSpace,
                      Container(
                        width: 1.w,
                        height: 10.h,
                        color: AppColors.gray300,
                      ),
                      6.hSpace,
                      SvgPicture.asset(
                        AppSvgs.delete,
                        height: 13.r,
                        width: 16.28.r,
                      ),
                      4.hSpace,
                      Text(
                        service.completedSalesCount.toString(),
                        style: TextStyles.font10Regular(
                          AppColors.gray600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
