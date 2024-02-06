import 'package:flutter/material.dart';
import 'package:video_downloading/core/constant/routes.dart';
import 'package:video_downloading/view/screen/home.dart';
import 'package:video_downloading/view/screen/onboarding.dart';
import 'view/screen/auth/login.dart';

Map<String,Widget Function(BuildContext)> routes = {
  AppRoute.login:(context) => const Login(),
  AppRoute.homePage:(context) => const HomePage(),

  AppRoute.onBoarding:(context) => const OnBoarding() ,
  // AppRoute.onBoarding:(context) => const OnBoarding() ,


};