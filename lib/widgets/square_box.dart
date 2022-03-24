import 'package:flutter/material.dart';

import '../contrants/colors.dart';

class SquareBox extends StatelessWidget {
  const SquareBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
          border: Border.all(
        color: kBlackColor,
      )),
      child: Center(
        child: Container(
          height: 8,
          width: 8,
          color: kBlackColor,
        ),
      ),
    );
  }
}
