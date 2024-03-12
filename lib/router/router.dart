import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:investments_app/models/capital_model.dart';
import 'package:investments_app/screens/capital/add_capital/add_capital_screen.dart';
import 'package:investments_app/screens/capital/add_invest/add_invest_screen.dart';
import 'package:investments_app/screens/capital/capital_list/capital_list_screen.dart';
import 'package:investments_app/screens/onboarding/onboarding_screen.dart';
import 'package:investments_app/screens/settings/settings_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, initial: true),
    AutoRoute(page: CapitalListRoute.page),
    AutoRoute(page: AddCapitalRoute.page),
    AutoRoute(page: AddInvestRoute.page),
    AutoRoute(page: SettingsRoute.page),
  ];
}