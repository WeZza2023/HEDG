import 'package:flutter/material.dart';
import 'package:hedg/constants/constant_colors.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/preformance_screen/preformance_screen.dart';

import '../../components/components.dart';
import '../../components/custom_texts.dart';
import '../buy_screen/buy_screen.dart';
import '../calculator_screen/calculator_screen.dart';

class ModeratedExploreScreen extends StatelessWidget {
  const ModeratedExploreScreen({super.key});

  static String id = "ModeratedExploreScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Moderated Plan",
          weight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExploreItem(
              context: context,
              title: "Balanced Plan",
              subTitle: "Balanced Risk and Reasonable return",
              color: const Color(0xffFAEBD1),
              image: "assets/images/Moderated.png",
            ).bP16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BodyMediumText(
                  "Description",
                  weight: FontWeight.bold,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, PreformanceScreen.id);
                  },
                  child: Row(
                    children: [
                      const BodyExtraSmallText(
                        "See Performance",
                        weight: FontWeight.bold,
                        isUnderlined: true,
                        color: KHeadTextColor,
                      ).hP4,
                      const Icon(
                        Icons.arrow_forward,
                        size: 18,
                        color: KHeadTextColor,
                      )
                    ],
                  ),
                ),
              ],
            ).bP16,
            const BodySmallText(
              "A moderated investment plan balances risk and return, typically by investing in a mix of stocks, fixed Income, and Gold. This plan is typically suitable for conservative investors  with a minimal exposure to risky assets.",
              maxLines: 5,
              textAlign: TextAlign.start,
            ).bP16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Icon(
                        Icons.play_circle_outline_rounded,
                        size: 18,
                        color: Colors.red,
                      ),
                      const BodySmallText(
                        "Watch video",
                        weight: FontWeight.bold,
                        isUnderlined: true,
                        color: Colors.red,
                      ).hP4,
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, CalculatorScreen.id);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calculate_outlined,
                        size: 18,
                        color: KHeadTextColor,
                      ),
                      const BodyExtraSmallText(
                        "Calculator",
                        weight: FontWeight.bold,
                        isUnderlined: true,
                        color: KHeadTextColor,
                      ).hP4,
                      const Icon(
                        Icons.arrow_forward,
                        size: 18,
                        color: KHeadTextColor,
                      )
                    ],
                  ),
                ),
              ],
            ).bP16,
            const BodyMediumText("Plan Details", weight: FontWeight.bold).bP16,
            Container(
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const BodySmallText("Asset Manager"),
                          const Icon(
                            Icons.help_outline_rounded,
                            size: 18,
                            color: KMainTextColor,
                          ).hP4,
                        ],
                      ),
                      const BodySmallText("Azimut")
                    ],
                  ),
                  const Divider(
                    color: KUnselectedTabColor,
                  ).hP16.vP8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const BodySmallText("Risk Profile"),
                          const Icon(
                            Icons.help_outline_rounded,
                            size: 18,
                            color: KMainTextColor,
                          ).hP4,
                        ],
                      ),
                      const BodySmallText("Low")
                    ],
                  ),
                  const Divider(
                    color: KUnselectedTabColor,
                  ).hP16.vP8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const BodySmallText("Subscription Freq."),
                          const Icon(
                            Icons.help_outline_rounded,
                            size: 18,
                            color: KMainTextColor,
                          ).hP4,
                        ],
                      ),
                      const BodySmallText("Daily")
                    ],
                  ),
                  const Divider(
                    color: KUnselectedTabColor,
                  ).hP16.vP8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const BodySmallText("Redemption Freq."),
                          const Icon(
                            Icons.help_outline_rounded,
                            size: 18,
                            color: KMainTextColor,
                          ).hP4,
                        ],
                      ),
                      const BodySmallText("Weekly")
                    ],
                  ),
                ],
              ).p16,
            ).bP16,
            Container(
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
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BodySmallText("Fixed Income"),
                        ],
                      ),
                      BodySmallText("85%"),
                    ],
                  ),
                  const Divider(
                    color: KUnselectedTabColor,
                  ).hP16.vP8,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BodySmallText("Stocks"),
                        ],
                      ),
                      BodySmallText("25%")
                    ],
                  ),
                  const Divider(
                    color: KUnselectedTabColor,
                  ).hP16.vP8,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BodySmallText("Gold"),
                        ],
                      ),
                      BodySmallText("15%")
                    ],
                  ),
                ],
              ).p16,
            ).bP16,
            DefaultTextButton(
                context: context,
                function: () {
                  Navigator.pushNamed(context, BuyScreen.id, arguments: [1]);
                },
                text: "Buy",
                color: KMainTextColor)
          ],
        ).p16,
      ),
    );
  }
}
