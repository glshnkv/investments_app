import 'package:auto_route/auto_route.dart';
import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:investments_app/router/router.dart';
import 'package:investments_app/theme/colors.dart';
import 'package:investments_app/widgets/action_button_widget.dart';
import 'package:investments_app/widgets/textfield_app_widget.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();

  final nameController = TextEditingController();

  List<String> chipList = ['Very often', 'Often', 'Rarely', 'Never'];
  String priority = 'Very often';
  int _currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBrown,
      body: Container(
        child: SafeArea(
          child: SizedBox(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/onboarding/image-1.png'),
                      Column(
                        children: [
                          SizedBox(
                            width: 250,
                            child: Text(
                              'Compare investment paths',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 32,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: 310,
                            child: Text(
                              'Add investment paths for your capital and choose better based on profitability and risk',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.white50,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Terms of use',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.white50,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '|',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: AppColors.white50,
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Privacy Policy',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.white50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          ActionButtonWidget(
                              text: 'Next',
                              width: 350,
                              onTap: () {
                                pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut);
                              }),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Let’s start',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 32,
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFieldAppWidget(
                              controller: nameController, title: 'Your name'),
                          SizedBox(height: 20),
                          Text(
                            'How often do you invest?',
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
                            listOfChipIndicesCurrentlySeclected: [
                              _currentIndex
                            ],
                            shouldWrap: true,
                            checkmarkColor: AppColors.pink,
                            extraOnToggle: (val) {
                              _currentIndex = val;
                              setState(() {
                                priority = chipList[_currentIndex];
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          ActionButtonWidget(
                              text: 'Start', width: 350, onTap: () {
                            context.router.push(CapitalListRoute());
                          }),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              context.router.push(CapitalListRoute());
                            },
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.white50,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
