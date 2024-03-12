import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:investments_app/models/capital_model.dart';
import 'package:investments_app/models/investment_model.dart';
import 'package:meta/meta.dart';

part 'capital_event.dart';

part 'capital_state.dart';

class CapitalBloc extends Bloc<CapitalEvent, CapitalState> {
  CapitalBloc() : super(CapitalInitial()) {
    on<GetAllCapitalsEvent>(_getAllCapitalsHandler);
    on<AddCapitalEvent>(_addCapitalHandler);
    on<AddInvestmentPathEvent>(_addInvestmentPathHandler);
    on<DeleteInvestmentPathEvent>(_deleteInvestmentPathHandler);

  }

  void _getAllCapitalsHandler(
      GetAllCapitalsEvent event, Emitter<CapitalState> emit) async {
    List<CapitalModel> capitals = [];
    int totalCapitalAmount = 0;

    final capitalBox = Hive.box('capitals');

    if (capitalBox.isNotEmpty) {
      for (int i = 0; i < capitalBox.length; i++) {
        capitals.add(capitalBox.getAt(i));
      }

      for (int i = 0; i < capitals.length; i++) {
        totalCapitalAmount += capitals[i].amount;
      }

      emit(LoadedAllCapitalsState(
          capitals: capitals.reversed.toList(),
          totalCapitalAmount: totalCapitalAmount));
    } else {
      emit(EmptyCapitalsListState());
    }
  }

  void _addCapitalHandler(
      AddCapitalEvent event, Emitter<CapitalState> emit) async {
    final capitalBox = Hive.box('capitals');
    capitalBox.add(event.capital);
  }

  void _addInvestmentPathHandler(
      AddInvestmentPathEvent event, Emitter<CapitalState> emit) async {
    List<CapitalModel> capitals = [];
    final capitalBox = Hive.box('capitals');
    if (capitalBox.isNotEmpty) {
      for (int i = 0; i < capitalBox.length; i++) {
        capitals.add(capitalBox.getAt(i));
      }
      final int replaceIndex = capitals.indexOf(event.capital);
      event.capital.investments.add(event.investment);
      capitalBox.putAt(replaceIndex, event.capital);
    }
  }

  void _deleteInvestmentPathHandler(
      DeleteInvestmentPathEvent event, Emitter<CapitalState> emit) async {
    List<CapitalModel> capitals = [];
    final capitalBox = Hive.box('capitals');
    if (capitalBox.isNotEmpty) {
      for (int i = 0; i < capitalBox.length; i++) {
        capitals.add(capitalBox.getAt(i));
      }
      final int replaceIndex = capitals.indexOf(event.capital);
      event.capital.investments.removeAt(event.capital.investments.indexOf(event.investment));
      capitalBox.putAt(replaceIndex, event.capital);
    }
  }
}
