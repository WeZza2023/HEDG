import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hedg/extention/extetion.dart';
import 'package:hedg/screens/guidance_screen/guidance_screen.dart';

import '../../../components/components.dart';
import '../../aggressive_explore_screen/aggressive_explore_screen.dart';
import '../../conservative_explore_screen/conservative_explore_screen.dart';
import '../../custom_plan_screen/custom_plan_screen.dart';
import '../../moderated_explore_screen/moderated_explore_screen.dart';

class ExploreLayout extends StatelessWidget {
  const ExploreLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ExploreItem(
            context: context,
            title: "Conservative plan",
            subTitle: "Save more with low risks",
            color: const Color(0xffC7EDD8),
            image: "assets/images/Conservative.png",
            onTap: () {
              Navigator.pushNamed(context, ConservativeExploreScreen.id);
            },
          ).bP16,
          ExploreItem(
            context: context,
            title: "Moderated plan",
            subTitle: "Balanced risk and return",
            color: const Color(0xffFAEBD1),
            image: "assets/images/Moderated.png",
            onTap: () {
              Navigator.pushNamed(context, ModeratedExploreScreen.id);
            },
          ).bP16,
          ExploreItem(
            context: context,
            title: "Aggressive plan",
            subTitle: "High interest with high risk",
            color: const Color(0xffF5D8D8),
            image: "assets/images/Aggressive.png",
            onTap: () {
              Navigator.pushNamed(context, AggressiveExploreScreen.id);
            },
          ).bP16,
          ExploreItem(
            context: context,
            title: "Do it your self plan",
            subTitle: "Customize your plan ",
            color: const Color(0xffC9E3F1),
            image: "assets/images/Customized.png",
            onTap: () {
              Navigator.pushNamed(context, CustomPlanScreen.id);
            },
          ).bP16,
          ExploreItem(
            context: context,
            title: "Need guidance ?",
            subTitle: "Choose the plan that suits you",
            color: const Color(0xffCDD7DD),
            image: "assets/images/guidance.png",
            onTap: () {
              Navigator.pushNamed(context, GuidanceScreen.id);
            },
          ).bP16,
        ],
      ).p16,
    );
  }
}
