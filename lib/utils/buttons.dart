import 'package:flutter/material.dart';

class CustomSubmitButton extends StatelessWidget {
  final double width;
  final Color? color;
  final String? text;
  final Function()? onTap;
  const CustomSubmitButton({
    Key? key,
    required this.width,
    this.text = "Continue",
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            color: color ?? Theme.of(context).primaryColor.withOpacity(.7),
            borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: Text(text!,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Theme.of(context).scaffoldBackgroundColor)),
        ),
      ),
    );
  }
}
