import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:sandesh/app/api/auth_api_calls.dart';
import 'package:sandesh/app/contants.dart';
import 'package:sandesh/app/database/userdata/userData.db.dart';
import 'package:sandesh/app/extension/details.ext.dart';
import 'package:sandesh/app/extension/navigation.ext.dart';
import 'package:sandesh/meta/views/home/home_page.dart';
import 'package:sandesh/meta/views/onboardings/auth/login_page.dart';
import 'package:sandesh/meta/views/onboardings/auth/widgets/auth_text_field.dart';
import 'package:sandesh/model/auth/auth_response_model.dart';
import 'package:sandesh/model/auth/user_push_model.dart';
import 'package:sandesh/model/core/auth%20proviser/sign_up.provider.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _fullNameController.dispose();
    _passwordController.dispose();
    _phoneNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: context.screenHeight * 0.14,
                    ),
                    SvgPicture.asset(logoPathSVG,
                        color: primaryColor,
                        height: context.screenHeight * .15),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Create New Account",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    LoginTextField(
                      controller: _usernameController,
                      icon: Iconsax.user,
                      label: "Username",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginTextField(
                      icon: CupertinoIcons.person_fill,
                      label: "Full name",
                      controller: _fullNameController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginTextField(
                      icon: CupertinoIcons.padlock,
                      label: "Password",
                      controller: _passwordController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginTextField(
                      icon: Iconsax.call,
                      label: "Phone no.",
                      controller: _phoneNoController,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () async {
                        if (!context.read<SignUpProvider>().loading) {
                          var provder = context.read<SignUpProvider>();
                          UserPushModel model = UserPushModel(
                              username: _usernameController.text,
                              password: _passwordController.text,
                              fullname: _fullNameController.text,
                              phNumber: _phoneNoController.text);
                          provder.changeLoadingState();
                          AuthResponseModel data =
                              await compute(AuthApi.createUser, model);

                          provder.changeLoadingState();

                          if (data.err) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                data.feedback,
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.redAccent,
                              behavior: SnackBarBehavior.floating,
                            ));
                          } else {
                            UserDataDB.putAllFields(
                                uid: data.data!.uid!,
                                username: data.data!.username!,
                                name: data.data!.name!);

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                                (route) => route.isFirst);
                          }
                        }
                      },
                      child: Container(
                        height: 60,
                        // height: 60,
                        width: context.screenWidth * 0.8 < 315
                            ? context.screenWidth * .8
                            : 315,

                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: !context.watch<SignUpProvider>().loading
                              ? const Text(
                                  "Create account",
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20),
                                )
                              : const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.replaceContext(const OnBoardingSignUpPage());
                      },
                      child: RichText(
                          text: TextSpan(
                              text: "Already a member? ",
                              style: TextStyle(
                                  color: Colors.white30,
                                  fontSize: 16,
                                  fontFamily:
                                      GoogleFonts.nunitoSans().fontFamily),
                              children: const [
                            TextSpan(
                                text: " Sign up",
                                style: TextStyle(color: Colors.white))
                          ])),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ))),
    );
  }
}
