import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/dark_button.dart';
import 'package:flutter_application_1/cubit/on_boarding_cubit.dart';
import 'package:flutter_application_1/cubit/on_boarding_state.dart';
import 'package:flutter_application_1/models/on_boarding_model.dart';
import 'package:flutter_application_1/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var boardController = PageController();

    bool isLast = false;
    return BlocProvider(
      create: (BuildContext context) => OnBoardingCubit()..getOnBoarding(),
      child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = OnBoardingCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: ConditionalBuilder(
                      condition: cubit.onBoardingModel != null,
                      builder: (context) => PageView.builder(
                        controller: boardController,
                        onPageChanged: (int index) {
                          if (index == cubit.onBoardingModel!.data.length - 1) {
                            setState(() {
                              isLast = true;
                              print('isLast');
                            });
                          } else {
                            setState(() {
                              isLast = false;
                              print('notLast');
                            });
                          }
                        },
                        itemCount: cubit.onBoardingModel!.data.length,
                        itemBuilder: (context, index) {
                          return
                           buildBoardingItem(
                            cubit.onBoardingModel!.data[index],
                            boardController,
                            cubit.onBoardingModel!.data.length,
                            isLast
                          );
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
        },
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
                      ? ElevatedButton(onPressed: () {}, child: Text('hagar'))
                      : ElevatedButton(onPressed: () {}, child: Text('salma'))
    ],
  );
}
