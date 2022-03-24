import 'package:flutter/material.dart';

import '../contrants/colors.dart';

class NotificationWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final Color color;

  const NotificationWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      padding: const EdgeInsets.all(4),
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).highlightColor.withOpacity(.5)),
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Container(
                  // margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 16, color: color),
                  )),
            ),
            CircleAvatar(
              radius: 12,
              child: Text(
                "1",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: kBlueColor),
              ),
              backgroundColor: kBlueColor.withOpacity(.2),
            )
          ],
        ),
        Container(
            margin: const EdgeInsets.only(left: 30),
            alignment: Alignment.centerLeft,
            child: Text(
              subTitle,
              style: Theme.of(context).textTheme.bodySmall,
            )),
      ]),
    );
  }
}
