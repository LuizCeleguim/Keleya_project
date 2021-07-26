import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_get/app/routes/routes.dart';

import 'package:teste_get/app/theme/colors.dart';

import 'app/ui/pages/birth_screen/birth_screen.dart';
import 'app/ui/pages/image_screen/image_screen.dart';
import 'app/ui/pages/initial_screen/initial_screen.dart';
import 'app/ui/pages/name_screen/name_screen.dart';
import 'app/ui/pages/sign_in_screen/sign_in_screen.dart';
import 'app/ui/pages/sing_up_screen/sign_up_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: AppColors.color_principal_1,
        accentColor: AppColors.color_principal_1,
      ),
      getPages: [
        GetPage(
          name: AppRoutes.initial,
          page: () => InitialScreen(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: AppRoutes.signUp,
          page: () => SignUpScreen(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: AppRoutes.signIn,
          page: () => SignInScreen(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: AppRoutes.NameScreen,
          page: () => NameScreen(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: AppRoutes.BirthScreen,
          page: () => BirthScreen(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: AppRoutes.ImageScreen,
          page: () => ImageScreen(),
          transition: Transition.cupertino,
        ),
      ],
    ),
  );
}
