import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/on_boarding_controller.dart';
import 'package:flutter_application_1/models/on_boarding_model.dart';
import 'package:flutter_application_1/styles/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<String?> getDeviceLanguage() async {
      final String defaultLocale = Platform.localeName;
      return (defaultLocale);
    }

    final viewModel = ref.watch(getOnBoarding);
    final size = MediaQuery.of(context).size;
    var boardController = PageController();

    bool isLast = false;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ConditionalBuilder(
                condition: viewModel.onBoardingModel != null,
                builder: (context) => PageView.builder(
                  controller: boardController,
                  onPageChanged: (int index) {
                    if (index == viewModel.onBoardingModel!.data.length - 1) {
                      getDeviceLanguage();
                    }
                  },
                  itemCount: viewModel.onBoardingModel!.data.length,
                  itemBuilder: (context, index) {
                    return buildBoardingItem(
                        viewModel.onBoardingModel!.data[index],
                        boardController,
                        viewModel.onBoardingModel!.data.length,
                        isLast);
                  },
                ),
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 5,
            ),

            /*
                DarkButton(
                  txt: 'متابعــــــة',
                  buttonWidth: size.height / 3,
                  buttonHeight: 40,
                  onPress: () {
                    if (isLast) {
                      Get.offAll(SignInScreen());
                      print(isLast);
                    } else {
                      boardController.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                ),
                */
          ],
        ),
      ),
    );
  }
}

Widget buildBoardingItem(
    OnBoardingData model, var boardController, int length, bool isLast) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: SvgPicture.network(
          '${model.image}',
        ),
      ),
      Row(children: [
        SmoothPageIndicator(
          controller: boardController,
          count: length,
          effect: const WormEffect(
            activeDotColor: Colors.black,
            dotColor: SemiLightGrey,
            dotHeight: 10,
            dotWidth: 10,
          ),
        ),
      ]),
      const SizedBox(height: 20),
      Text(
        '${model.title}',
        style: const TextStyle(
          color: DarkGrey,
          fontSize: 18,
          fontFamily: 'Almarai-Regular',
          fontWeight: FontWeight.w700,
          height: 1.10,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Text(
        '${model.subtitle}',
        style: const TextStyle(
          color: Grey,
          fontSize: 17,
          fontFamily: 'Almarai-Regular',
          fontWeight: FontWeight.w400,
          height: 1.10,
        ),
      ),
      isLast == false
          ? ElevatedButton(onPressed: () {}, child: Text('lolo'))
          : ElevatedButton(onPressed: () {}, child: Text('salma'))
    ],
  );
}
