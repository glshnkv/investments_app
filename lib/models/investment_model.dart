import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'investment_model.g.dart';

@HiveType(typeId: 1)
class InvestmentModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final double incomeRate;
  @HiveField(2)
  final String risk;

  InvestmentModel(
      {required this.name, required this.incomeRate, required this.risk});
}
