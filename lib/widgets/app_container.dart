import 'package:flutter/material.dart';
import 'package:investments_app/theme/colors.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  const AppContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: AppColors.darkPink,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: child,
    );
  }
}