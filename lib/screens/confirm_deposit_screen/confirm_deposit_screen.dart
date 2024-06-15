import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/constants/constant_sizes.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/confirm_deposit_screen/confirm_deposit_state.dart';

import '../../components/components.dart';
import '../../components/custom_texts.dart';
import '../../components/default_formfield.dart';
import 'confirm_deposit_cubit.dart';

class ConfirmDepositScreen extends StatelessWidget {
  ConfirmDepositScreen({super.key});

  static String id = "ConfirmDepositScreen";
  final formKey = GlobalKey<FormState>();
  final dateDepositedController = TextEditingController();
  final amountDepositedController = TextEditingController();
  final receiptNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ConfirmDepositCubit>(context);
    return BlocBuilder<ConfirmDepositCubit, ConfirmDepositState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
          title: const BodyMediumText(
            "Confirm Deposit",
            weight: FontWeight.bold,
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: AppSizes.getScreenWidth(context),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff098AD3).withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BodyMediumText(
                          "Receipt Image",
                          weight: FontWeight.bold,
                        ).tP16.hP16,
                        cubit.receiptImage == null
                            ? InkWell(
                                onTap: () {
                                  cubit.pickImageFromCamera();
                                },
                                child: DottedBorder(
                                  strokeWidth: 2,
                                  borderPadding: const EdgeInsets.all(20),
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(12),
                                  dashPattern: const [9, 9, 9, 9],
                                  color: const Color(0xffDDE5E9),
                                  child: SizedBox(
                                    width: AppSizes.getScreenWidth(context),
                                    height: 200,
                                    child: const Icon(
                                      Icons.add,
                                      size: 32,
                                      color: Color(0xffD1DCE2),
                                    ),
                                  ),
                                ),
                              )
                            : Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.file(
                                        fit: BoxFit.fill,
                                        cubit.receiptImage!,
                                        height: 200,
                                        width: AppSizes.getScreenWidth(context),
                                      )),
                                  Align(
                                    alignment: AlignmentDirectional.topEnd,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xffFCDDD5),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: InkWell(
                                        onTap: () {
                                          cubit.removeImage();
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ).p4,
                                      ),
                                    ),
                                  )
                                ],
                              ).p(20),
                      ],
                    )).bP16,
                Container(
                  width: AppSizes.getScreenWidth(context),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff098AD3).withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: const Offset(0, 3),
                        ),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BodySmallText(
                        "Date Deposited",
                        weight: FontWeight.bold,
                      ).bP8,
                      DefaultFormField(
                        controller: dateDepositedController,
                        type: TextInputType.text,
                        readOnly: true,
                        suffix: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                useSafeArea: true,
                                enableDrag: true,
                                showDragHandle: true,
                                constraints: const BoxConstraints(
                                  minHeight: 200,
                                  maxHeight: 300,
                                ),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                context: context,
                                builder: (context) => CupertinoDatePicker(
                                      initialDateTime: DateTime.now(),
                                      mode: CupertinoDatePickerMode.date,
                                      onDateTimeChanged: (value) {
                                        dateDepositedController.text =
                                            "${value.day}/${value.month}/${value.year}";
                                      },
                                    ));
                          },
                          icon: const Icon(
                            Icons.date_range_rounded,
                            color: KMainTextColor,
                          ),
                        ),
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "please enter date deposited";
                          }
                          return null;
                        },
                        label: "Date Deposited",
                      ).bP16,
                      const BodySmallText(
                        "Amount Deposited",
                        weight: FontWeight.bold,
                      ).bP8,
                      DefaultFormField(
                        controller: receiptNumberController,
                        type: TextInputType.text,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "please enter enter amount";
                          }
                          return null;
                        },
                        label: "Enter Amount",
                      ).bP16,
                      const BodySmallText(
                        "Instapay Address",
                        weight: FontWeight.bold,
                      ).bP8,
                      DefaultFormField(
                        controller: amountDepositedController,
                        type: TextInputType.text,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "please enter instapay address";
                          }
                          return null;
                        },
                        label: "Instapay Address",
                      ).bP16,
                    ],
                  ).p16,
                ).bP16,
                const BodySmallText(
                  "Funds will be added to your wallet after 1 working day!",
                  maxLines: 2,
                ).bP16.hP16,
                DefaultTextButton(
                    context: context,
                    function: () {},
                    text: "Send Details",
                    color: KMainTextColor)
              ],
            ).p16,
          ),
        ),
      ),
    );
  }
}
