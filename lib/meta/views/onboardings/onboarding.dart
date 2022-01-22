import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/app/extension/navigation.ext.dart';
import 'package:sandesh/meta/views/onboardings/auth/create_user.dart';
import 'package:sandesh/meta/views/onboardings/auth/login_page.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  getHeight(double height) {
    print(height);
    return height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(builder: (context, constraints) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(logoPathSVG,
                    color: primaryColor, height: constraints.maxHeight * .2),
                SizedBox(
                  height: constraints.maxHeight * .06,
                ),
                Text(
                  "Start Conversation now",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: constraints.maxHeight * .035 < 27
                          ? constraints.maxHeight * 0.035
                          : 27),
                ),
                SizedBox(
                  height: constraints.maxHeight * .03 < 23
                      ? constraints.maxHeight * .03
                      : 23,
                ),
                LockIcon(constraints: constraints),
                SizedBox(
                  height: constraints.maxHeight * .03 < 23
                      ? constraints.maxHeight * .03
                      : 23,
                ),
                Text(
                  "with Encrption",
                  style: TextStyle(
                      color: Colors.white30,
                      fontSize: constraints.maxHeight * .03 < 23
                          ? constraints.maxHeight * .03
                          : 23),
                ),
                SizedBox(height: constraints.maxHeight * .07),
                SignUPButton(
                  constraints: constraints,
                ),
                SizedBox(
                  height: constraints.maxHeight * .035,
                ),
                GestureDetector(
                  onTap: () {
                    context.navigateTo(const CreateUser());
                  },
                  child: RichText(
                      text: TextSpan(
                          text: "New member? ",
                          style: TextStyle(
                              color: Colors.white30,
                              fontSize: getHeight(
                                  constraints.maxHeight * .022 < 17
                                      ? constraints.maxHeight * .022
                                      : 17),
                              fontFamily: GoogleFonts.nunitoSans().fontFamily),
                          children: const [
                        TextSpan(
                            text: " Create User",
                            style: TextStyle(color: Colors.white))
                      ])),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

class LockIcon extends StatelessWidget {
  const LockIcon({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          constraints.maxHeight * .07 < 54 ? constraints.maxHeight * .07 : 54,
      width:
          constraints.maxHeight * .07 < 54 ? constraints.maxHeight * .07 : 54,
      decoration:
          const BoxDecoration(color: Colors.white12, shape: BoxShape.circle),
      child: Center(
        child: Icon(
          CupertinoIcons.lock,
          color: Colors.white,
          size: constraints.maxHeight * .04 < 32
              ? constraints.maxHeight * 0.04
              : 32,
        ),
      ),
    );
  }
}

class SignUPButton extends StatelessWidget {
  const SignUPButton({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        context.navigateTo(const OnBoardingSignUpPage());
      },
      child: Container(
        height: constraints.maxHeight * .075 < 60
            ? constraints.maxHeight * .075
            : 60,
        // height: 60,
        width:
            constraints.maxWidth * .8 < 300 ? constraints.maxWidth * .8 : 300,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            "Sign up",
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: constraints.maxHeight * .03 < 23
                    ? constraints.maxHeight * .03
                    : 23),
          ),
        ),
      ),
    );
  }
}
