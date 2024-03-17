import 'package:flutter/material.dart';
import 'package:task/core/res/app_media.dart';
import 'package:task/core/res/app_strings.dart';
import 'package:task/ui/screens/countries/countries_screen.dart';
import 'package:task/ui/screens/services/services_screen.dart';
import 'package:task/ui/screens/who_am_i/who_am_i_screen.dart';

class NavItem {
  NavItem({
    required this.index,
    required this.label,
    required this.activeIcon,
    required this.unactiveIcon,
    required this.screen,
  });

  final int index;
  final String label;
  final String activeIcon;
  final String unactiveIcon;
  final Widget screen;

  static final items = [
    NavItem(
      index: 0,
      label: AppStrings.whoAmI,
      activeIcon: AppSvgs.activeProfile,
      unactiveIcon: AppSvgs.unactiveProfile,
      screen: const WhoAmIScreen(),
    ),
    NavItem(
      index: 1,
      label: AppStrings.countries,
      activeIcon: AppSvgs.activeCountries,
      unactiveIcon: AppSvgs.unactiveCountries,
      screen: const CountriesScreen(),
    ),
    NavItem(
      index: 2,
      label: AppStrings.services,
      activeIcon: AppSvgs.activeServices,
      unactiveIcon: AppSvgs.unactiveServices,
      screen: const ServicesScreen(),
    ),
  ];
}
