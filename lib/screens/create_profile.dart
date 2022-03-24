import 'dart:io';

import 'package:delivery_app/main.dart';
import 'package:delivery_app/screens/home.dart';
import 'package:delivery_app/utils/buttons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController confirmEmailController = TextEditingController();
  int page = 0;
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        image = null;
        switch (page) {
          case 0:
            return Future.value(true);
          case 1:
            setState(() {
              page = 0;
            });
            return Future.value(false);
          case 2:
            setState(() {
              page = 1;
            });
            return Future.value(false);
          default:
            return Future.value(true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: Text(
            "Create Profile",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.all(20),
          child: getScreen(),
        )),
      ),
    );
  }

  Column uploadPictureScreen(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(top: 20),
        alignment: Alignment.centerLeft,
        child: Text(
          "Upload Picture",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      GestureDetector(
        onTap: () async {
          final ImagePicker _picker = ImagePicker();
          final tempImage =
              await _picker.pickImage(source: ImageSource.gallery);
          setState(() {
            image = tempImage;
          });
        },
        child: Container(
          height: 100,
          width: size.width * .5,
          margin: const EdgeInsets.only(top: 100),
          decoration: BoxDecoration(
              color: Theme.of(context).highlightColor.withOpacity(.2),
              border: Border.all(color: Theme.of(context).highlightColor),
              borderRadius: BorderRadius.circular(10)),
          child: image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(File(image!.path)))
              : const Center(
                  child: Icon(
                  Icons.cloud_upload_outlined,
                  color: Colors.blue,
                )),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 8),
        alignment: Alignment.center,
        child: Text(
          "Choose File",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: size.height * .4),
        child: CustomSubmitButton(
          width: size.width * .7,
          text: "Next",
          onTap: () {
            setState(() {
              image = null;
              page = 1;
            });
          },
        ),
      )
    ]);
  }

  Column documentsPage(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(top: 20),
        alignment: Alignment.centerLeft,
        child: Text(
          "Documents",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      documentWidget(
        icon: Icons.person,
        docName: 'Profile Picture',
      ),
      documentWidget(
        icon: Icons.file_present_rounded,
        docName: 'Adhar/PAN Card',
      ),
      documentWidget(
        icon: Icons.file_present_rounded,
        docName: 'Driving Licence',
      ),
      Container(
        margin: EdgeInsets.only(top: size.height * .5),
        child: CustomSubmitButton(
          width: size.width * .7,
          text: "Next",
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const HomeScreen()));
          },
        ),
      )
    ]);
  }

  getScreen() {
    switch (page) {
      case 0:
        return profileDetails(context);
      case 1:
        return documentsPage(context);
      case 2:
        return uploadPictureScreen(context);

      default:
        return profileDetails(context);
    }
  }

  Column profileDetails(BuildContext context) {
    return Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Profile Details",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8, top: 30),
            alignment: Alignment.centerLeft,
            child: Text(
              "First Name",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          CustomTextFeild(
            controller: firstNameController,
            hint: 'Enter First Name',
          ),
          Container(
            margin: const EdgeInsets.only(left: 8, top: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Last Name",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          CustomTextFeild(
            controller: lastNameController,
            hint: 'Enter Last Name',
          ),
          Container(
            margin: const EdgeInsets.only(left: 8, top: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Email id",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          CustomTextFeild(
            controller: emailIdController,
            hint: 'Enter Email id',
            keyboardType: TextInputType.emailAddress,
          ),
          Container(
            margin: const EdgeInsets.only(left: 8, top: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Confirm Email id",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          CustomTextFeild(
            controller: confirmEmailController,
            keyboardType: TextInputType.emailAddress,
            hint: 'Enter Email id',
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.centerRight,
              child: Text(
                "Verify Email",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 100),
            child: CustomSubmitButton(
              onTap: () {
                if (firstNameController.text.isEmpty ||
                    lastNameController.text.isEmpty ||
                    emailIdController.text.isEmpty ||
                    confirmEmailController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      "All fields are required.",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ));
                  return;
                }
                if (confirmEmailController.text != emailIdController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      "Email is not matching.",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ));
                  return;
                }
                setState(() {
                  page = 1;
                });
              },
              width: size.width * .6,
              text: "Next",
            ),
          )
        ]);
  }

  documentWidget({required IconData icon, required String docName}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          page = 2;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20, right: 8),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Icon(
                icon,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                docName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Icon(
              Icons.cloud_upload_outlined,
              color: Theme.of(context).highlightColor,
            ),
          ],
        ),
      ),
    );
  }
}

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
