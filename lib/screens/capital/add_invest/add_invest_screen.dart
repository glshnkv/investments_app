import 'package:auto_route/auto_route.dart';
import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investments_app/models/capital_model.dart';
import 'package:investments_app/models/investment_model.dart';
import 'package:investments_app/router/router.dart';
import 'package:investments_app/screens/capital/capital_bloc/capital_bloc.dart';
import 'package:investments_app/theme/colors.dart';
import 'package:investments_app/widgets/action_button_widget.dart';
import 'package:investments_app/widgets/textfield_app_widget.dart';

@RoutePage()
class AddInvestScreen extends StatefulWidget {
  final CapitalModel capital;

  const AddInvestScreen({super.key, required this.capital});

  @override
  State<AddInvestScreen> createState() => _AddInvestScreenState();
}

class _AddInvestScreenState extends State<AddInvestScreen> {
  final pageController = PageController();

  final nameController = TextEditingController();
  final incomeRateController = TextEditingController();

  bool isLastPage = false;

  List<String> chipList = ['Low', 'Average', 'High'];
  String risk = 'Low';
  int _currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    nameController.dispose();
    incomeRateController.dispose();

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
      body: Container(
        child: SafeArea(
          child: SizedBox(
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  isLastPage = index == 1;
                });
              },
              controller: pageController,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Investment path',
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
                          controller: nameController, title: 'Investment name'),
                      SizedBox(height: 20),
                      TextFieldAppWidget(
                          controller: incomeRateController,
                          title: 'What percentage of income'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Investment path',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 32,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'What is the risk of an investement?',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.white50,
                        ),
                      ),
                      SizedBox(height: 5),
                      ChipList(
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        spacing: 10,
                        listOfChipNames: chipList,
                        activeBorderColorList: [AppColors.pink],
                        inactiveBorderColorList: [AppColors.darkBrown],
                        activeBgColorList: [AppColors.darkPink],
                        inactiveBgColorList: [AppColors.darkPink],
                        activeTextColorList: [AppColors.white],
                        inactiveTextColorList: [AppColors.white],
                        listOfChipIndicesCurrentlySeclected: [_currentIndex],
                        shouldWrap: true,
                        checkmarkColor: AppColors.pink,
                        extraOnToggle: (val) {
                          _currentIndex = val;
                          setState(() {
                            risk = chipList[_currentIndex];
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
          text: isLastPage ? 'Done' : 'Continue',
          width: 350,
          onTap: () {
            if (isLastPage) {
              if (nameController.text.isNotEmpty &&
                  incomeRateController.text.isNotEmpty) {
                context.read<CapitalBloc>().add(AddInvestmentPathEvent(
                    investment: InvestmentModel(
                        name: nameController.text,
                        incomeRate: double.parse(incomeRateController.text),
                        risk: risk),
                    capital: widget.capital));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.green,
                    content: Text(
                      'Investment path successfully added!',
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
            } else {
              pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            }
          }),
    );
  }
}
