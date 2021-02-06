import 'package:fleming_expense_tracker/controllers/onboarding_controller.dart';
import 'package:fleming_expense_tracker/screens/2.authenitication/login_screen.dart';
import 'package:fleming_expense_tracker/widgets/custom_raised_button.dart';
import 'package:fleming_expense_tracker/widgets/onboarding_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingController obController = Get.put(OnboardingController());

  List<Map<String, String>> splashData = [
    {
      "content": "Organise your next trip..",
      "image": "assets/images/onboarding_1.png"
    },
    {
      "content": "Enter your expenses",
      "image": "assets/images/onboarding_2.png"
    },
    {
      "content": "Submit reports on the go..",
      "image": "assets/images/onboarding_3.png"
    },
    {"content": "Stay connected..", "image": "assets/images/onboarding_4.png"},
  ];

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: obController.currentPage.value == index ? 20 : 6,
      decoration: BoxDecoration(
        color: obController.currentPage.value == index
            ? Color(0xFF393838)
            : Color(0xFFC7C7C7),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      obController.currentPage.value = value;
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => OnboardingContent(
                        content: splashData[index]["content"],
                        image: splashData[index]["image"]),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              splashData.length,
                              (index) => buildDot(index: index),
                            ),
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Obx(
                              () => CustomRaisedButtton(
                                onPressed: () => Get.to(LoginScreen()),
                                buttonText: obController.currentPage.value == 3
                                    ? "Login"
                                    : "Skip",
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
