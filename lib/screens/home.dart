import 'package:delivery_app/contrants/colors.dart';
import 'package:delivery_app/main.dart';
import 'package:delivery_app/utils/buttons.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/notification_widget.dart';
import '../widgets/square_box.dart';
import '../widgets/task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(children: [
          Expanded(
              // flex: ,
              child: getSreen()),
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Theme.of(context).highlightColor,
                  spreadRadius: 6,
                  blurRadius: 8,
                  // blurStyle: BlurStyle.solid,
                  offset: const Offset(-10, -8))
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      page = 0;
                    });
                  },
                  child: Icon(
                    Icons.home_filled,
                    color: page == 0
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).highlightColor,
                    size: 36,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      page = 1;
                    });
                  },
                  child: Icon(
                    Icons.task,
                    color: page == 1
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).highlightColor,
                    size: 36,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      page = 2;
                    });
                  },
                  child: Icon(
                    Icons.notifications,
                    color: page == 2
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).highlightColor,
                    size: 36,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  getSreen() {
    switch (page) {
      case 0:
        return homePage(context);
      case 1:
        return myTaskPage(context);
      case 2:
        return notificationPage(context);

      default:
    }
  }

  Stack homePage(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          child: Image.network(
            "https://www.google.com/maps/d/u/0/thumbnail?mid=1zdZHNEEqAQHvUCXonR7vI71VkqM&hl=en",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: padding.top + 20,
          left: 0,
          right: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        page = 0;
                      });
                    },
                    child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).hintColor,
                        ))),
                // Container(
                //   // margin: const EdgeInsets.only(top: 20),
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     "Notifications",
                //     style: Theme.of(context).textTheme.headline6,
                //   ),
                // ),
                CircleAvatar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Icon(
                      Icons.settings,
                      color: Theme.of(context).hintColor,
                    ))
              ],
            ),
          ),
        ),
        Positioned(
            left: 20,
            right: 20,
            bottom: 10,
            child: Container(
              height: 200,
              width: size.width * .8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).scaffoldBackgroundColor),
              child: Column(children: [
                Container(
                  height: 60,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor.withOpacity(.1)),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.check_box_rounded,
                          size: 50,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Expanded(
                          child: Text(
                        "Order Recieved",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ))
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.pin_drop),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: "Banglore ",
                                style: Theme.of(context).textTheme.bodyLarge,
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
                            Text("10 km - 40min",
                                style: Theme.of(context).textTheme.bodyLarge)
                          ],
                        ),
                      ),
                      CircleAvatar(
                          backgroundColor: kBlueColor.withOpacity(.1),
                          child: const Icon(
                            Icons.call,
                            color: kBlueColor,
                          ))
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomSubmitButton(
                        width: size.width * .35,
                        color: kGreenColor,
                        text: "Accept",
                      ),
                      CustomSubmitButton(
                        width: size.width * .35,
                        color: Theme.of(context).errorColor,
                        text: "Cancel",
                      ),
                    ],
                  ),
                )
              ]),
            ))
      ],
    );
  }

  Container notificationPage(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: padding.top + 10),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          page = 0;
                        });
                      },
                      child: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: Icon(
                            Icons.arrow_back,
                            color: Theme.of(context).hintColor,
                          ))),
                  Container(
                    // margin: const EdgeInsets.only(top: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Notifications",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  CircleAvatar(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: Icon(
                        Icons.settings,
                        color: Theme.of(context).hintColor,
                      ))
                ],
              ),
            ),
            NotificationWidget(
              color: Theme.of(context).primaryColor,
              icon: Icons.check_box_rounded,
              subTitle: "You have recieved on Order from ...",
              title: 'Order Recieved',
            ),
            const NotificationWidget(
              color: kBlueColor,
              icon: Icons.pin_drop,
              subTitle: "You have reached the delivery location ...",
              title: 'Reached Location',
            ),
            const NotificationWidget(
              color: kGreenColor,
              icon: Icons.check_box_rounded,
              subTitle: "The order has been deliverd to ...",
              title: 'Order Delivered',
            ),
          ],
        )));
  }

  Container myTaskPage(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: padding.top + 10),
      child: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        page = 0;
                      });
                    },
                    child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).hintColor,
                        ))),
                Container(
                  // margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "My Tasks",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                CircleAvatar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Icon(
                      Icons.settings,
                      color: Theme.of(context).hintColor,
                    ))
              ],
            ),
          ),
          const TaskWidget(
            orderNumber: 1,
          ),
          const TaskWidget(
            orderNumber: 2,
          ),
          const TaskWidget(
            orderNumber: 3,
          )
        ],
      )),
    );
  }
}
