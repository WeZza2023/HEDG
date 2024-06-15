import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/signup_screen/signup_cubit.dart';
import 'package:hedg/screens/signup_screen/signup_state.dart';

import '../../components/components.dart';
import '../../components/custom_texts.dart';
import '../../components/default_formfield.dart';
import '../../constants/constant_colors.dart';
import '../../constants/constant_sizes.dart';
import '../verify_screen/verify_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  static String id = "SignupScreen";
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SignupCubit>(context);
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) => Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        "assets/images/loginBackground.png",
                        fit: BoxFit.cover,
                        width: AppSizes.getScreenWidth(context),
                      ),
                      PositionedDirectional(
                          top: AppSizes.getScreenHeight(context) * 0.12,
                          start: 0,
                          end: 0,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/whiteLogo.png",
                                scale: 3,
                              ).bP25,
                              const BodyLargeText(
                                "Create An Account",
                                color: Colors.white,
                              )
                            ],
                          ))
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                width: AppSizes.getScreenWidth(context) * 0.9,
                height: AppSizes.getScreenHeight(context) * 0.6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff098AD3).withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: const Offset(0, 3),
                      ),
                    ]),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        DefaultFormField(
                          controller: fullNameController,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "please enter your full name";
                            }
                            return null;
                          },
                          label: 'Full Name',
                        ).tp(60),
                        DefaultFormField(
                          controller: emailController,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "please enter your email";
                            }
                            return null;
                          },
                          label: 'Email',
                        ).tP16,
                        DefaultFormField(
                          controller: passwordController,
                          type: TextInputType.emailAddress,
                          isPassword: cubit.isPassShow,
                          suffix: IconButton(
                            onPressed: () {
                              cubit.changePassState();
                            },
                            icon: Icon(
                              cubit.isPassShow
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: KMainTextColor.withOpacity(0.4),
                            ),
                          ),
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "please enter your password";
                            }
                            return null;
                          },
                          label: 'Password',
                        ).tP16,
                        DefaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (value) {
                            if (cubit.countryCode == "-  -") {
                              return "please select country code";
                            }
                            if (value!.isEmpty) {
                              return "please enter your phone number";
                            }
                            return null;
                          },
                          label: 'Phone Number',
                          prefix: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                useSafeArea: true,
                                enableDrag: true,
                                showDragHandle: true,
                                context: context,
                                builder: (context) => CountryCodesSheet(
                                    context: context, cubit: cubit),
                              );
                            },
                            child: SizedBox(
                              width: 60,
                              child: BodyMediumText(
                                cubit.countryCode,
                                color: KMainTextColor.withOpacity(0.7),
                              ).hP8,
                            ),
                          ),
                        ).bP25.tP16,
                        DefaultTextButton(
                          context: context,
                          function: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, VerifyScreen.id);
                            }
                          },
                          text: "Sign Up",
                          textColor: Colors.white,
                          color: KMainTextColor,
                        ).tP16,
                        const BodySmallText("Or", color: KMainTextColor).vP16,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffE6F3FB),
                              ),
                              child: Image.asset(
                                "assets/images/google.png",
                                scale: 1.5,
                              ).p16,
                            ),
                            const SizedBox(
                              width: 26,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffE6F3FB),
                              ),
                              child: Image.asset(
                                "assets/images/apple.png",
                                scale: 1.5,
                              ).p16,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const BodySmallText(
                              "Have an account? ",
                              color: KMainTextColor,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const BodySmallText(
                                "Sign In",
                                color: KHeadTextColor,
                                weight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ).vP16
                      ],
                    ),
                  ).hp(20),
                ),
              ).bp(50),
            )
          ],
        ),
      ),
    );
  }
}
