part of 'capital_bloc.dart';

@immutable
abstract class CapitalState {}

class CapitalInitial extends CapitalState {}

class LoadedAllCapitalsState extends CapitalState {
  final List<CapitalModel> capitals;
  final int totalCapitalAmount;

  LoadedAllCapitalsState(
      {required this.capitals, required this.totalCapitalAmount});
}

class EmptyCapitalsListState extends CapitalState {}
