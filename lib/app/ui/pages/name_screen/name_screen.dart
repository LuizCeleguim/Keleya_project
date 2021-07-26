import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_get/app/routes/routes.dart';
import 'package:teste_get/app/theme/colors.dart';
import 'package:teste_get/app/ui/global_widgets/KButton.dart';
import 'package:teste_get/app/ui/global_widgets/KInput.dart';

class NameScreen extends StatefulWidget {
  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final _nameController = new TextEditingController();
  static final _formKey = GlobalKey<FormState>();
  Widget _buildTitle() {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 10),
              child: _buildArrowBack(),
            )
          ],
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 57.0, left: 10),
            child: Container(
              child: Text(
                "  What should we call you? ",
                style: TextStyle(
                    color: AppColors.color_principal_5,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  IconButton _buildArrowBack() {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: AppColors.color_principal_1,
      ),
      onPressed: () => Get.back(),
    );
  }

  Widget _buildBody() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 170.0, bottom: 0),
            child: SizedBox(
              height: Get.height * .07,
              width: Get.width * .90,
              child: KInput(
                labelText: 'Your name',
                controller: _nameController,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: SizedBox(
              width: Get.width * .90,
              child: KButton(
                  color: AppColors.color_principal_1,
                  child: Text(
                    "Next question",
                    style: TextStyle(
                        color: AppColors.color_principal_2,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true)
                      Get.toNamed(AppRoutes.BirthScreen);
                  }),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.color_principal_2,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildTitle(),
              _buildBody(),
            ],
          ),
        ));
  }
}
