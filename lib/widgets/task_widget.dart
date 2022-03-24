import 'package:delivery_app/widgets/square_box.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../contrants/colors.dart';

class TaskWidget extends StatelessWidget {
  final int orderNumber;
  const TaskWidget({
    Key? key,
    required this.orderNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size;
    return Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        padding: const EdgeInsets.all(15),
        height: size.height * .2,
        decoration: BoxDecoration(
            color: Theme.of(context).highlightColor.withOpacity(.2),
            border: Border.all(
                color: Theme.of(context).highlightColor.withOpacity(.5)),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat("dd-MM-yyyy EEEE").format(DateTime.now()),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Order $orderNumber",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: kBlueColor),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.pin_drop),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text: "Banglore ",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  TextSpan(
                                    text: "560064",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ])),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                    "3891 Ranchview Dr.\nRichardson,California 62639",
                                    style:
                                        Theme.of(context).textTheme.bodySmall)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Start",
                              style: Theme.of(context).textTheme.bodyLarge),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                              text: "10",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 20,
                                      color: kGreenColor,
                                      fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: "km",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      // fontSize: 20,
                                      color: kGreenColor,
                                      fontWeight: FontWeight.bold),
                            ),
                          ])),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                              text: "30",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 20,
                                      color: kGreenColor,
                                      fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: "min",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      // fontSize: 20,
                                      color: kGreenColor,
                                      fontWeight: FontWeight.bold),
                            ),
                          ])),
                          Text("End",
                              style: Theme.of(context).textTheme.bodyLarge)
                        ],
                      ),
                      Column(
                        children: [
                          const SquareBox(),
                          Container(
                            height: 90,
                            child: DottedLine(
                              direction: Axis.vertical,
                            ),
                          ),
                          const SquareBox(),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: 4,
              width: 50,
              margin: const EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.circular(2)),
            )
          ],
        ));
  }
}
