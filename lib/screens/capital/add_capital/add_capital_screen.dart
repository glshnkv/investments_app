import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investments_app/models/capital_model.dart';
import 'package:investments_app/router/router.dart';
import 'package:investments_app/screens/capital/capital_bloc/capital_bloc.dart';
import 'package:investments_app/theme/colors.dart';
import 'package:investments_app/widgets/action_button_widget.dart';
import 'package:investments_app/widgets/textfield_app_widget.dart';

@RoutePage()
class AddCapitalScreen extends StatefulWidget {
  const AddCapitalScreen({super.key});

  @override
  State<AddCapitalScreen> createState() => _AddCapitalScreenState();
}

class _AddCapitalScreenState extends State<AddCapitalScreen> {
  final amountController = TextEditingController();
  final periodController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    periodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBrown,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.darkBrown,
        leadingWidth: 95,
        leading: GestureDetector(
          onTap: () {
            context.router.pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios, color: AppColors.pink),
                Text(
                  'Back',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: AppColors.pink,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Adding capital',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFieldAppWidget(
                  controller: amountController,
                  title: 'How much are you planning to invest'),
              SizedBox(height: 20),
              TextFieldAppWidget(
                  controller: periodController,
                  title: 'Investment period in years'),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
          text: 'Add capital',
          width: 350,
          onTap: () {
            if (amountController.text.isNotEmpty &&
                periodController.text.isNotEmpty) {
              context.read<CapitalBloc>().add(AddCapitalEvent(
                  capital: CapitalModel(
                      amount: int.parse(amountController.text),
                      period: int.parse(periodController.text),
                      investments: [])));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.green,
                  content: Text(
                    'Capital successfully added!',
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              );
              context.router.push(CapitalListRoute());
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.red,
                  content: Text(
                    'Please, Fill out the remaining fields',
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              );
            }
          }),
    );
  }
}
