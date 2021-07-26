import 'package:flutter/material.dart';
import 'package:teste_get/app/routes/routes.dart';
import 'package:teste_get/app/ui/global_widgets/KButton.dart';
import 'package:teste_get/app/ui/global_widgets/KInput.dart';
import 'package:teste_get/app/theme/colors.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

final TextEditingController _emailEditingController =
    new TextEditingController();
final TextEditingController _passwordEditingController =
    new TextEditingController();

class _SignInScreenState extends State<SignInScreen> {
  bool showPassword = false;

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Column(
        children: [
          Center(
            child: Text(
              "  Great to have you ",
              style: TextStyle(
                color: AppColors.color_principal_2,
                fontSize: 30,
              ),
            ),
          ),
          Center(
            child: Text(
              "  back!",
              style: TextStyle(
                color: AppColors.color_principal_2,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubTitle() {
    return Column(
      children: [
        Text(
          "Sign in using Keleya",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.color_principal_5,
            fontSize: 26,
          ),
        ),
        Text(
          "account info",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.color_principal_5,
            fontSize: 26,
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Container(
      height: Get.height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: AppColors.color_principal_5,
              spreadRadius: 2,
              blurRadius: 10)
        ],
        color: AppColors.color_principal_2,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.0),
          topLeft: Radius.circular(40.0),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * .02,
          ),
          _buildSubTitle(),
          SizedBox(
            height: Get.height * .08,
          ),
          _buildFormSignIn(),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: Get.width * .90,
              child: KButton(
                color: AppColors.color_principal_1,
                child: Text(
                  "Sign in ",
                  style: TextStyle(
                      color: AppColors.color_principal_2,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Get.toNamed(
                    AppRoutes.NameScreen,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFormSignIn() {
    return Column(
      children: [
        SizedBox(
          width: Get.width * .90,
          child: KInput(
            labelText: 'Username',
            controller: _emailEditingController,
          ),
        ),
        SizedBox(
          height: Get.height * .02,
        ),
        SizedBox(
          width: Get.width * .90,
          child: KInput(
            labelText: 'Password',
            showButtonViewText: true,
            isObscureText: !this.showPassword,
            controller: _passwordEditingController,
            toggleObscureText: () {
              setState(() {
                this.showPassword = !this.showPassword;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _forgetPasswordBtn(),
          ],
        ),
      ],
    );
  }

  Widget _forgetPasswordBtn() {
    return TextButton(
      onPressed: () {},
      child: Text(
        "Forget you password?",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_principal_1,
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: _buildTitle(),
              ),
              SizedBox(
                height: Get.height * .04,
              ),
              Expanded(
                child: _buildBody(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
