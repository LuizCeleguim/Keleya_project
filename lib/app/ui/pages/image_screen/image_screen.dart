import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_get/app/theme/colors.dart';

class ImageScreen extends StatelessWidget {
  Widget _buildTitle() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Text(
          "Congratulations on the new arrival!",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.color_principal_5,
            fontSize: 33,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: Get.height * .22),
                _buildTitle(),
                SizedBox(height: Get.height * .10),
                Image.asset("assets/keleya_picture.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
