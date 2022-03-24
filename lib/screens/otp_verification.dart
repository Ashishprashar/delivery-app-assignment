import 'dart:async';

import 'package:delivery_app/main.dart';
import 'package:delivery_app/screens/create_profile.dart';
import 'package:delivery_app/utils/buttons.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  const OTPVerificationScreen({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  int min = 3;
  OtpFieldController otpFieldController = OtpFieldController();
  int seconds = 0;
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (min == 2 && seconds == 54) {
        otpFieldController.set(["2", "0", "1", "3"]);
      }
      if (min == 2 && seconds == 51) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const CreateProfile()));
      }
      if (min == 0 && seconds == 0) {
        timer.cancel();
        return;
      }
      if (seconds == 0) {
        setState(() {
          seconds = 59;
          min--;
        });
      } else {
        setState(() {
          seconds--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          "OTP Verification",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.all(20),
        height: size.height,
        width: size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Please Enter the OTP",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 8),
                child: Text(
                  "Code sent to +91 ${widget.phoneNumber}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).hintColor),
                ),
              ),
              Container(
                width: size.width,
                margin: EdgeInsets.only(top: size.height * .15),
                // alignment: Alignment.center,
                height: 50,
                child: OTPTextField(
                  controller: otpFieldController,
                  fieldWidth: 50,
                  fieldStyle: FieldStyle.box,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "OTP will expire in  ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Theme.of(context).hintColor),
                    ),
                    TextSpan(
                      text: "0$min:${seconds < 10 ? "0" : ""}$seconds ",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ]))),
              Container(
                margin: const EdgeInsets.only(top: 100),
                child: Text(
                  "Resend OTP",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Theme.of(context).primaryColorDark),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * .2),
                child: CustomSubmitButton(
                  onTap: () {
                    timer!.cancel();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (ctx) => const CreateProfile()));
                  },
                  width: size.width * .7,
                  text: "Login".toUpperCase(),
                ),
              )
            ]),
      )),
    );
  }
}
