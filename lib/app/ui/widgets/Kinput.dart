import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class KInput extends StatelessWidget {
  final String? labelText;
  final bool isObscureText;
  final bool showButtonViewText;
  final bool isvalidated;
  final TextEditingController controller;
  final Function()? validated;

  final Function()? toggleObscureText;

  final double _sizeIcon = 16;

  const KInput({
    Key? key,
    required this.controller,
    this.labelText,
    this.isObscureText = false,
    this.showButtonViewText = false,
    this.toggleObscureText,
    this.validated,
    this.isvalidated = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.3,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            8,
          ),
        ),
      ),
      child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: this.labelText,
            suffix: this.showButtonViewText
                ? this.isObscureText
                    ? _buildIcon(Icons.visibility_off)
                    : _buildIcon(Icons.visibility)
                : null,
          ),
          controller: this.controller,
          obscureText: this.isObscureText,
          validator: (value) {
            if (value?.isEmpty == true)
              return 'Fill $labelText field';
            else if (labelText == 'Username' || labelText == 'Your Email') {
              if (!value.toString().isEmail) return 'Insert a valid email';
            }
          }),
    );
  }

  Widget _buildIcon(IconData icon) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Icon(
          icon,
          size: this._sizeIcon,
        ),
        onTap: this.toggleObscureText,
      ),
    );
  }
}
