import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:investments_app/investments_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:investments_app/models/capital_model.dart';
import 'package:investments_app/models/investment_model.dart';
import 'package:investments_app/screens/capital/capital_bloc/capital_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(CapitalModelAdapter());
  Hive.registerAdapter(InvestmentModelAdapter());
  await Hive.openBox('capitals');

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<CapitalBloc>(
          create: (context) => CapitalBloc()),
    ],
    child: InvestmentsApp(),
  ));
}
