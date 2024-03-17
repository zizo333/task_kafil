import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:task/core/extensions/context_extension.dart';
import 'package:task/core/responsive/responsive_helper.dart';

class SubmitLoading extends StatelessWidget {
  const SubmitLoading({
    super.key,
    this.size,
  });
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size ??
            getValueForScreenType(context, mobile: 100.r, tablet: 130.r),
        height: size ??
            getValueForScreenType(context, mobile: 100.r, tablet: 130.r),
        child: const LoadingIndicator(
          indicatorType: Indicator.orbit,
          colors: [Colors.white],
        ),
      ),
    );
  }
}

class FetchLoading extends StatelessWidget {
  const FetchLoading({
    super.key,
    this.size,
  });
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size ??
            getValueForScreenType(context, mobile: 100.r, tablet: 130.r),
        height: size ??
            getValueForScreenType(context, mobile: 100.r, tablet: 130.r),
        child: LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,
          colors: [
            context.colorScheme.primary,
            context.colorScheme.secondary,
          ],
        ),
      ),
    );
  }
}

class InlineLoading extends StatelessWidget {
  const InlineLoading({
    super.key,
    this.color,
    this.size,
  });
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width:
            size ?? getValueForScreenType(context, mobile: 25.r, tablet: 35.r),
        height:
            size ?? getValueForScreenType(context, mobile: 25.r, tablet: 35.r),
        child: LoadingIndicator(
          indicatorType: Indicator.circleStrokeSpin,
          colors: [
            color ?? context.colorScheme.secondary,
          ],
        ),
      ),
    );
  }
}

class ImageLoading extends StatelessWidget {
  const ImageLoading({
    super.key,
    this.color,
    this.size,
  });
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: SizedBox(
          width: size ??
              getValueForScreenType(context, mobile: 60.r, tablet: 75.r),
          height: size ??
              getValueForScreenType(context, mobile: 60.r, tablet: 75.r),
          child: LoadingIndicator(
            indicatorType: Indicator.ballScale,
            colors: [
              color ?? context.colorScheme.primary,
            ],
          ),
        ),
      ),
    );
  }
}
