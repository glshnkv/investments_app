import 'package:flutter/material.dart';
import 'package:investments_app/router/router.dart';

class InvestmentsApp extends StatelessWidget {
  InvestmentsApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'SF Pro Display'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
