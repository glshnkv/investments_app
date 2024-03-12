import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:investments_app/router/router.dart';
import 'package:investments_app/screens/capital/capital_bloc/capital_bloc.dart';
import 'package:investments_app/theme/colors.dart';
import 'package:investments_app/widgets/action_button_widget.dart';
import 'package:investments_app/widgets/app_container.dart';

@RoutePage()
class CapitalListScreen extends StatefulWidget {
  const CapitalListScreen({super.key});

  @override
  State<CapitalListScreen> createState() => _CapitalListScreenState();
}

class _CapitalListScreenState extends State<CapitalListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBrown,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      context.router.push(SettingsRoute());
                    },
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: AppColors.pink,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Capitalize',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                      color: AppColors.white,
                    ),
                  ),
                ),
                BlocProvider(
                  create: (context) =>
                      CapitalBloc()..add(GetAllCapitalsEvent()),
                  child: BlocConsumer<CapitalBloc, CapitalState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is EmptyCapitalsListState) {
                        return Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.3),
                            Text(
                              'No capital yet',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: AppColors.pink,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'You don\'t have any capital added',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.white50,
                              ),
                            ),
                          ],
                        );
                      } else if (state is LoadedAllCapitalsState) {
                        return Container(
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              AppContainer(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total capital',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            color: AppColors.white,
                                          ),
                                        ),
                                        Text(
                                          '${state.totalCapitalAmount}\$',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 32,
                                            color: AppColors.pink,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 1),
                                  ],
                                ),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(vertical: 16),
                                itemCount: state.capitals.length,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const SizedBox(height: 15),
                                itemBuilder: (BuildContext context, int index) {
                                  final capital = state.capitals[index];
                                  if (capital.investments.isNotEmpty) {
                                    return Container(
                                      padding: EdgeInsets.all(14),
                                      decoration: BoxDecoration(
                                          color: AppColors.blackPink,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0))),
                                      child: Column(
                                        children: [
                                          AppContainer(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${capital.amount}\$',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                    color: AppColors.pink,
                                                  ),
                                                ),
                                                Text(
                                                  capital.period > 1
                                                      ? 'For ${capital.period} years'
                                                      : 'For ${capital.period} year',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                    color: AppColors.white50,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    context.router.push(
                                                        AddInvestRoute(
                                                            capital: capital));
                                                  },
                                                  child: Text(
                                                    'Invest',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                      color: AppColors.pink,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Investments',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ),
                                          ListView.separated(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10),
                                            itemCount:
                                                capital.investments.length,
                                            separatorBuilder:
                                                (BuildContext context,
                                                        int index) =>
                                                    const SizedBox(height: 10),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              final investment =
                                                  capital.investments[index];
                                              return Container(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Slidable(
                                                    endActionPane: ActionPane(
                                                      motion: StretchMotion(),
                                                      children: [
                                                        SlidableAction(
                                                          flex: 1,
                                                          backgroundColor:
                                                              Colors.red,
                                                          icon: Icons.delete,
                                                          label: 'Delete',
                                                          onPressed: (context) {
                                                            context
                                                                .read<
                                                                    CapitalBloc>()
                                                                .add(DeleteInvestmentPathEvent(
                                                                    investment:
                                                                        investment,
                                                                    capital:
                                                                        capital));
                                                            setState(() {});
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    child: AppContainer(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            investment.name,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 16,
                                                              color: AppColors
                                                                  .white50,
                                                            ),
                                                          ),
                                                          SizedBox(height: 3),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                '${investment.risk} risk',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 16,
                                                                  color: investment
                                                                              .risk ==
                                                                          'Low'
                                                                      ? AppColors
                                                                          .green
                                                                      : investment.risk ==
                                                                              'Average'
                                                                          ? AppColors
                                                                              .yellow
                                                                          : AppColors
                                                                              .red,
                                                                ),
                                                              ),
                                                              Text(
                                                                '${investment.incomeRate.toStringAsFixed(0)}%',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 16,
                                                                  color:
                                                                      AppColors
                                                                          .pink,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return AppContainer(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${capital.amount}\$',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: AppColors.pink,
                                            ),
                                          ),
                                          Text(
                                            capital.period > 1
                                                ? 'For ${capital.period} years'
                                                : 'For ${capital.period} year',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: AppColors.white50,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context.router.push(
                                                  AddInvestRoute(
                                                      capital: capital));
                                            },
                                            child: Text(
                                              'Invest',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: AppColors.pink,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
                SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
          text: 'Add capital',
          width: 350,
          onTap: () {
            context.router.push(AddCapitalRoute());
          }),
    );
  }
}
