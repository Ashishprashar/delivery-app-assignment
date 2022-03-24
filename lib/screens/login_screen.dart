import 'package:delivery_app/main.dart';
import 'package:delivery_app/screens/otp_verification.dart';
import 'package:flutter/material.dart';

import '../utils/buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    padding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: Theme.of(context).highlightColor.withOpacity(.5),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: size.width * .5,
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor),
                  child: Center(
                      child: Text(
                    "Logo",
                    style: Theme.of(context).textTheme.headline6,
                  )),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * .2),
                  height: size.height * .4,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login With Phone Number",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Theme.of(context).highlightColor),
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 40, horizontal: 50),
                            child: TextField(
                              controller: phoneNumber,
                              cursorColor: Theme.of(context).highlightColor,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.headline6,
                            )),
                        CustomSubmitButton(
                            width: size.width * .7,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => OTPVerificationScreen(
                                        phoneNumber: phoneNumber.text,
                                      ))));
                            }),
                      ]),
                )
              ]),
        ),
      ),
    );
  }
}
