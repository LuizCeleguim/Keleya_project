import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:teste_get/app/routes/routes.dart';
import 'package:teste_get/app/ui/Widgets/KButton.dart';
import 'package:teste_get/app/ui/Widgets/Kinput.dart';

import 'package:teste_get/app/theme/colors.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool showPassword = false;
  bool acceptPrivacyPolicy = false;
  bool acceptTerms = false;

  Widget _buildTitle() {
    return Column(
      children: [
        Center(
          child: Text(
            "Welcome to",
            style: TextStyle(
              color: AppColors.color_principal_2,
              fontSize: 30,
            ),
          ),
        ),
        Center(
          child: Text(
            "Keleya Mama",
            style: TextStyle(
              color: AppColors.color_principal_2,
              fontSize: 30,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSubTitle() {
    return Container(
      child: Text(
        "Create an account",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.color_principal_5,
          fontSize: 25,
        ),
      ),
    );
  }

  Widget _buildFormSignIn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: Get.width * .90,
          child: KInput(
            labelText: 'Your Email',
            controller: _emailController,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: Get.width * .90,
          child: KInput(
            labelText: 'Password',
            showButtonViewText: true,
            isObscureText: !this.showPassword,
            controller: _passwordController,
            toggleObscureText: () {
              setState(() {
                this.showPassword = !this.showPassword;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _confirmPassword() {
    return SizedBox(
      width: Get.width * .90,
      child: KInput(
        labelText: 'Confirm your Password',
        showButtonViewText: true,
        isObscureText: !this.showPassword,
        controller: _confirmPasswordController,
        toggleObscureText: () {
          setState(() {
            this.showPassword = !this.showPassword;
          });
        },
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        width: Get.width * 100,
        height: Get.height * .76,
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
            )),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: _buildSubTitle(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: _buildFormSignIn(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: _confirmPassword(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: SizedBox(
                width: Get.width * .90,
                child: KButton(
                    color: AppColors.color_principal_1,
                    child: Text(
                      "Create an account",
                      style: TextStyle(
                          fontSize: 19,
                          color: AppColors.color_principal_2,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final _password = _passwordController.text.trim();
                        final _confirmPassword =
                            _confirmPasswordController.text.trim();

                        if (_password != _confirmPassword) {
                          Get.snackbar(
                            'Sign up',
                            'First password and second does not match',
                            backgroundColor: Colors.white,
                          );
                        } else if (!acceptPrivacyPolicy || !acceptTerms) {
                          Get.snackbar(
                            'Sign up',
                            'You need accept our policy terms',
                            backgroundColor: Colors.white,
                          );
                        } else
                          Get.toNamed(AppRoutes.NameScreen);
                      }
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: Get.height * .03,
                    child: _buildCheckList(
                      checked: acceptPrivacyPolicy,
                      label: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'I accept the ',
                              style: TextStyle(
                                  color: AppColors.color_principal_5,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'privacy policy',
                              style: TextStyle(
                                  color: AppColors.color_principal_1,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // open desired screen
                                }),
                        ]),
                      ),
                      onToggle: (value) {
                        setState(() {
                          acceptPrivacyPolicy = value!;
                        });
                      },
                    ),
                  ),
                  Container(
                    height: Get.height * .03,
                    margin: EdgeInsets.only(bottom: 15),
                    child: _buildCheckList(
                      checked: acceptTerms,
                      label: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'I accept the ',
                              style: TextStyle(
                                  color: AppColors.color_principal_5,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'terms & conditions',
                              style: TextStyle(
                                  color: AppColors.color_principal_1,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // open desired screen
                                }),
                          TextSpan(
                              text: ' & ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'Keleya´s advice',
                              style: TextStyle(
                                  color: AppColors.color_principal_1,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // open desired screen
                                }),
                        ]),
                      ),
                      onToggle: (value) {
                        setState(() {
                          acceptTerms = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_principal_1,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: _buildTitle(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: _buildBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckList(
      {required bool checked,
      required Widget label,
      void Function(bool?)? onToggle}) {
    return Row(
      children: [
        Checkbox(
          value: checked,
          onChanged: onToggle,
        ),
        Expanded(
          child: label,
        )
      ],
    );
  }
}
