import 'package:flutter/material.dart';
import 'package:teste_get/app/routes/routes.dart';
import 'package:teste_get/app/theme/colors.dart';
import 'package:teste_get/app/ui/global_widgets/KButton.dart';

import 'package:get/get.dart';

class InitialScreen extends StatelessWidget {
  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        "Are you already a Keleya user?",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.color_principal_2,
          fontSize: 30,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.color_principal_5,
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
        color: AppColors.color_principal_2,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.0),
          topLeft: Radius.circular(40.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: Get.width * .90,
            child: KButton(
              color: AppColors.color_principal_1,
              onPressed: () {
                Get.toNamed(
                  AppRoutes.signIn,
                );
              },
              child: Text(
                "Yes, log in with my Keleya details",
                style: TextStyle(
                  color: AppColors.color_principal_2,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: Get.height * .03),
          SizedBox(
            width: Get.width * .90,
            child: KButton(
              color: AppColors.color_principal_3,
              onPressed: () {
                Get.toNamed(
                  AppRoutes.signUp,
                );
              },
              child: Text(
                "No, create new account",
                style: TextStyle(
                  color: AppColors.color_principal_4,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_principal_1,
      body: Container(
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 54,
              ),
              child: _buildTitle(),
            ),
            Expanded(
              child: _buildBody(
                context,
              ),
            )
          ],
        ),
      ),
    );
  }
}
