part of 'capital_bloc.dart';

@immutable
abstract class CapitalEvent {}

class GetAllCapitalsEvent extends CapitalEvent {}

class AddCapitalEvent extends CapitalEvent {
  final CapitalModel capital;

  AddCapitalEvent({required this.capital});
}

class AddInvestmentPathEvent extends CapitalEvent {
  final CapitalModel capital;
  final InvestmentModel investment;

  AddInvestmentPathEvent({required this.investment, required this.capital});
}

class DeleteInvestmentPathEvent extends CapitalEvent {
  final CapitalModel capital;
  final InvestmentModel investment;

  DeleteInvestmentPathEvent({required this.investment, required this.capital});
}
