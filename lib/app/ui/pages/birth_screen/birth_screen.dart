import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_get/app/routes/routes.dart';
import 'package:teste_get/app/theme/colors.dart';
import 'package:teste_get/app/ui/global_widgets/KButton.dart';

class BirthScreen extends StatefulWidget {
  @override
  _BirthScreenState createState() => _BirthScreenState();
}

class _BirthScreenState extends State<BirthScreen> {
  final TextEditingController _getName = new TextEditingController();
  DateTime selectedDate = DateTime.now();
  Widget _buildTitle() {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 10),
              child: _buildArrowBack(),
            ),
          ],
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 10),
            child: Container(
              child: Text(
                "When was your baby due? ",
                style: TextStyle(
                    color: AppColors.color_principal_5,
                    fontSize: 29,
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

  _buildSubtitle() {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 120.0,
            ),
            child: Text(
              "We can give you more relevant tips if we",
              style: TextStyle(
                color: AppColors.color_principal_5,
                fontSize: 19,
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 1.0, left: 0),
            child: Text(
              " know whether your baby was ",
              style: TextStyle(
                color: AppColors.color_principal_5,
                fontSize: 19,
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 1.0, left: 0),
            child: Text(
              "premature, oerdue or right on time.",
              style: TextStyle(
                color: AppColors.color_principal_5,
                fontSize: 19,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Widget _buildBody() {
    return Container(
      child: Column(
        children: [
          _buildSubtitle(),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildDataPicker(),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 55.0),
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
                    Get.toNamed(AppRoutes.ImageScreen);
                  }),
            ),
          )
        ],
      ),
    );
  }

  Container _buildDataPicker() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 0.1),
          borderRadius: BorderRadius.circular(5)),
      height: Get.height * .07,
      width: Get.width * .90,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          child: InkWell(
            onTap: () => _selectDate(context), // Refer step 3
            child: Padding(
              padding: const EdgeInsets.only(top: 9.0, left: 20),
              child: Text(
                "${selectedDate.toLocal()}".split(' ')[0],
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.color_principal_2,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                _buildTitle(),
                _buildBody(),
              ],
            ),
          ),
        ));
  }
}
