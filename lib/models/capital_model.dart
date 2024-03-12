import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:investments_app/models/investment_model.dart';

part 'capital_model.g.dart';

@HiveType(typeId: 0)
class CapitalModel {
  @HiveField(0)
  final int amount;
  @HiveField(1)
  final int period;
  @HiveField(2)
  List<InvestmentModel> investments;

  CapitalModel(
      {required this.amount, required this.period, required this.investments});
}
