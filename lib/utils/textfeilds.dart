import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? hint;
  const CustomTextFeild({
    Key? key,
    required this.controller,
    this.hint,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 8, top: 12),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: Theme.of(context).highlightColor.withOpacity(.15)),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.name,
          cursorColor: Theme.of(context).highlightColor,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).shadowColor.withOpacity(.5))),
          style: Theme.of(context).textTheme.headline6,
        ));
  }
}
