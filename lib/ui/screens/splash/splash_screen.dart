import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/di/di_imports.dart';
import 'package:task/core/extensions/context_extension.dart';
import 'package:task/core/res/app_media.dart';
import 'package:task/core/res/app_sizes.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/cubit/splash/splash_cubit.dart';
import 'package:task/data/models/user_type_model.dart';
import 'package:task/ui/widgets/custom_loading.dart';
import 'package:task/ui/widgets/error_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: SvgPicture.asset(
              AppSvgs.logo,
              width: 200.r,
              height: 200.r,
            ),
          ),
          BlocConsumer<SplashCubit, SplashState>(
            listener: (context, state) {
              state.whenOrNull(
                loaded: (userTypes) {
                  sl<UserTypes>().userTpes = userTypes;
                  context.pushReplacementNamed(Routes.loginScreen);
                },
                error: (message) {
                  _showSnackBar(context, message);
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => Positioned(
                  bottom: AppSizes.vScreenPadding.h,
                  left: 0,
                  right: 0,
                  child: FetchLoading(
                    size: 40.r,
                  ),
                ),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        duration: const Duration(days: 356),
        padding: EdgeInsets.symmetric(
          horizontal: 20.87.w,
          vertical: 7.87.h,
        ),
        backgroundColor: context.colorScheme.error,
        content: ErrorText(
          message: message,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            context.read<SplashCubit>().fetchUserTypes();
          },
        ),
        dismissDirection: DismissDirection.none,
      ),
    );
  }
}
