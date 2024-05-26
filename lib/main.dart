import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/consts/constant.dart';
import 'package:flutter_application_1/cubit/observer.dart';
import 'package:flutter_application_1/cubit/on_boarding_cubit.dart';
import 'package:flutter_application_1/cubit/on_boarding_state.dart';
import 'package:flutter_application_1/dio/dio_helper.dart';
import 'package:flutter_application_1/pages/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_langdetect/flutter_langdetect.dart' as langdetect;
import 'dart:io' show Platform;

void main() async {
  DioHelper.init();
  runApp(ProviderScope(child: const MyApp()));
  WidgetsFlutterBinding.ensureInitialized();

  languageCode = Platform.localeName.split('_')[0];
  String countryCode = Platform.localeName.split('_')[1];
  print(languageCode! + " " + countryCode);
/*
  await langdetect
      .initLangDetect(); // This is needed once in your application after ensureInitialized()

  String text = 'Hello, world!';
  language = langdetect.detect(text);
  print('Detected language: $language'); // -> "en"

  final probs = langdetect.detectLangs(text);
  for (final p in probs) {
    print("Language: ${p.lang}"); // -> "en"
    print("Probability: ${p.prob}"); // -> 0.9999964132193504
  }
  */
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => OnBoardingCubit()),
      ],
      child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // TRY THIS: Try running your application with "flutter run". You'll see
              // the application has a purple toolbar. Then, without quitting the app,
              // try changing the seedColor in the colorScheme below to Colors.green
              // and then invoke "hot reload" (save your changes or press the "hot
              // reload" button in a Flutter-supported IDE, or press "r" if you used
              // the command line to start the app).
              //
              // Notice that the counter didn't reset back to zero; the application
              // state is not lost during the reload. To reset the state, use hot
              // restart instead.
              //
              // This works for code too, not just values: Most code changes can be
              // tested with just a hot reload.
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
              useMaterial3: true,
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
