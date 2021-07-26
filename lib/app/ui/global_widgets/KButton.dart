import 'package:flutter/material.dart';

class KButton extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final Color? color;
  const KButton(
      {Key? key, required this.child, required this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: this.onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: this.color,
            borderRadius: BorderRadius.circular(6),
          ),
          height: MediaQuery.of(context).size.height * .07,
          width: double.infinity,
          child: Center(
            child: this.child,
          ),
        ),
      ),
    );
  }
}
