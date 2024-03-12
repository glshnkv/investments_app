// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddCapitalRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddCapitalScreen(),
      );
    },
    AddInvestRoute.name: (routeData) {
      final args = routeData.argsAs<AddInvestRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddInvestScreen(
          key: args.key,
          capital: args.capital,
        ),
      );
    },
    CapitalListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CapitalListScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [AddCapitalScreen]
class AddCapitalRoute extends PageRouteInfo<void> {
  const AddCapitalRoute({List<PageRouteInfo>? children})
      : super(
          AddCapitalRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCapitalRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddInvestScreen]
class AddInvestRoute extends PageRouteInfo<AddInvestRouteArgs> {
  AddInvestRoute({
    Key? key,
    required CapitalModel capital,
    List<PageRouteInfo>? children,
  }) : super(
          AddInvestRoute.name,
          args: AddInvestRouteArgs(
            key: key,
            capital: capital,
          ),
          initialChildren: children,
        );

  static const String name = 'AddInvestRoute';

  static const PageInfo<AddInvestRouteArgs> page =
      PageInfo<AddInvestRouteArgs>(name);
}

class AddInvestRouteArgs {
  const AddInvestRouteArgs({
    this.key,
    required this.capital,
  });

  final Key? key;

  final CapitalModel capital;

  @override
  String toString() {
    return 'AddInvestRouteArgs{key: $key, capital: $capital}';
  }
}

/// generated route for
/// [CapitalListScreen]
class CapitalListRoute extends PageRouteInfo<void> {
  const CapitalListRoute({List<PageRouteInfo>? children})
      : super(
          CapitalListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CapitalListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
