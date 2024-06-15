import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/components/components.dart';
import 'package:hedg/components/custom_texts.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/constants/constant_sizes.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/home_screen/home_screen.dart';
import 'package:hedg/screens/id_confirmation_screen/id_confirmation_cubit.dart';
import 'id_confirmation_state.dart';

class IdConfirmationScreen extends StatelessWidget {
  const IdConfirmationScreen({super.key});

  static String id = "IdConfirmationScreen";

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<IdConfirmationCubit>(context);
    return BlocBuilder<IdConfirmationCubit, IdConfirmationState>(
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                title: Center(
                    child: Image.asset(
                  "assets/images/darkLogo.png",
                  scale: 1.5,
                )),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    EasyStepper(
                        activeStep: cubit.activeStep,
                        onStepReached: (index) {
                          cubit.changeActiveStep(index);
                        },
                        showStepBorder: true,
                        stepAnimationCurve: Curves.easeInOut,
                        stepAnimationDuration:
                            const Duration(milliseconds: 300),
                        unreachedStepTextColor: Colors.red,
                        activeStepTextColor: Colors.white,
                        activeStepBackgroundColor: KHeadTextColor,
                        finishedStepBackgroundColor: KHeadTextColor,
                        unreachedStepBackgroundColor: Colors.white,
                        lineStyle: LineStyle(
                          lineThickness: 5,
                          defaultLineColor: KUnselectedColor,
                          progress: cubit.linePercent,
                          progressColor: KHeadTextColor,
                          finishedLineColor: KHeadTextColor,
                          lineType: LineType.normal,
                          lineLength: 30,
                        ),
                        stepRadius: 20,
                        activeStepBorderColor: Colors.transparent,
                        unreachedStepBorderColor: KUnselectedColor,
                        finishedStepBorderColor: Colors.transparent,
                        borderThickness: 2,
                        showLoadingAnimation: false,
                        activeStepBorderType: BorderType.normal,
                        unreachedStepBorderType: BorderType.normal,
                        finishedStepBorderType: BorderType.normal,
                        steps: [
                          StepItem(
                              title: "ID Front",
                              activeStep: cubit.activeStep,
                              stepIndex: 1),
                          StepItem(
                              title: "ID Back",
                              activeStep: cubit.activeStep,
                              stepIndex: 2),
                          StepItem(
                              title: "Face",
                              activeStep: cubit.activeStep,
                              stepIndex: 3),
                          StepItem(
                              title: "Face Right",
                              activeStep: cubit.activeStep,
                              stepIndex: 4),
                          StepItem(
                              title: "Face Left",
                              activeStep: cubit.activeStep,
                              stepIndex: 5),
                          StepItem(
                              title: "Confirmation",
                              activeStep: cubit.activeStep,
                              stepIndex: 6),
                        ]),
                    const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: BodyMediumText(
                        "Add Your Personal Details",
                        weight: FontWeight.bold,
                      ),
                    ).hP16.bP16,
                    Container(
                      height: AppSizes.getScreenHeight(context) * 0.55,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: const Offset(0, 1),
                            ),
                          ]),
                      child: PageView(
                        controller: cubit.pageController,
                        onPageChanged: (value) {
                          cubit.changePage(value);
                        },
                        children: [
                          AddIdBody(
                              context: context,
                              title: "ID Card (Front)",
                              subTitle:
                                  "Please take a photo to your ID Front, Make sure it’s clear",
                              image: cubit.iDFront,
                              cubit: cubit),
                          AddIdBody(
                              context: context,
                              title: "ID Card (Back)",
                              subTitle:
                                  "Please take a photo to your ID Back, Make sure it’s clear",
                              image: cubit.iDBack,
                              cubit: cubit),
                          AddIdBody(
                              context: context,
                              title: "Take a Selfie of your face",
                              subTitle:
                                  "Please make sure you have a clear background.",
                              image: cubit.face,
                              cubit: cubit),
                          AddIdBody(
                              context: context,
                              title: "Take a photo of your face right",
                              subTitle:
                                  "Please make sure you have a clear background.",
                              image: cubit.faceRight,
                              cubit: cubit),
                          AddIdBody(
                              context: context,
                              title: "Take a photo of your face left",
                              subTitle:
                                  "Please make sure you have a clear background.",
                              image: cubit.faceLeft,
                              cubit: cubit),
                          ConfirmationBody(
                            context: context,
                            title: "Confirmation",
                            subTitle:
                                "Please make sure you have entered the correct information",
                            idFront: cubit.iDFront,
                            idBack: cubit.iDBack,
                            face: cubit.face,
                            faceRight: cubit.faceRight,
                            faceLeft: cubit.faceLeft,
                          ),
                        ],
                      ),
                    ).hP25,
                    const BodyExtraSmallText(
                            "If you are facing any difficulties, please get in touch")
                        .vP8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const BodyExtraSmallText("with us on "),
                        InkWell(
                          onTap: () {},
                          child: const BodyExtraSmallText(
                            "Whatsapp",
                            weight: FontWeight.bold,
                          ),
                        )
                      ],
                    ).bP8,
                    DefaultTextButton(
                            context: context,
                            function: () {
                              if (cubit.activeStep != 5) {
                                cubit.changeActiveStep(cubit.activeStep + 1);
                              } else if (cubit.activeStep == 5) {
                                AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.success,
                                    animType: AnimType.rightSlide,
                                    onDismissCallback: (DismissType type) {
                                      Navigator.pushNamed(
                                          context, HomeScreen.id);
                                    },
                                    body: Column(
                                      children: [
                                        const BodyLargeText(
                                          "Done",
                                          weight: FontWeight.normal,
                                          color: KHeadTextColor,
                                        ).bp(50),
                                        const BodyMediumText(
                                          "We will review your account and get back to you very shortly",
                                          weight: FontWeight.normal,
                                          color: KMainTextColor,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ).bp(50),
                                      ],
                                    )).show();
                              }
                            },
                            text: "Save",
                            color: KMainTextColor)
                        .p8
                  ],
                ).tP16.hP8,
              ),
            ));
  }
}
