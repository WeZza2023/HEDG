import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/screens/about_us_screen/about_us_screen.dart';
import 'package:hedg/screens/add_acc_screen/add_acc_screen.dart';
import 'package:hedg/screens/aggressive_explore_screen/aggressive_explore_screen.dart';
import 'package:hedg/screens/bank_info_screen/bank_info_cubit.dart';
import 'package:hedg/screens/bank_info_screen/bank_info_screen.dart';
import 'package:hedg/screens/bank_transfer_screen/bank_transfer_screen.dart';
import 'package:hedg/screens/buy_screen/buy_screen.dart';
import 'package:hedg/screens/calculator_screen/calculator_cubit.dart';
import 'package:hedg/screens/calculator_screen/calculator_screen.dart';
import 'package:hedg/screens/cash_deposit_screen/cash_deposit_screen.dart';
import 'package:hedg/screens/change_pass_screen/change_pass_screen.dart';
import 'package:hedg/screens/change_question_screen/change_question_cubit.dart';
import 'package:hedg/screens/change_question_screen/change_question_screen.dart';
import 'package:hedg/screens/confirm_deposit_screen/confirm_deposit_cubit.dart';
import 'package:hedg/screens/confirm_deposit_screen/confirm_deposit_screen.dart';
import 'package:hedg/screens/confirm_transfer_screen/confirm_transfer_screen.dart';
import 'package:hedg/screens/conservative_explore_screen/conservative_explore_screen.dart';
import 'package:hedg/screens/conservative_plan_screen/conservative_plan_screen.dart';
import 'package:hedg/screens/custom_plan_screen/custom_plan_screen.dart';
import 'package:hedg/screens/debit_card_screen/debit_card_screen.dart';
import 'package:hedg/screens/enter_code_screen/enter_code_screen.dart';
import 'package:hedg/screens/faq_screen/faq_screen.dart';
import 'package:hedg/screens/forget_pass_screen/forget_pass_screen.dart';
import 'package:hedg/screens/guidance_screen/guidance_cubit.dart';
import 'package:hedg/screens/guidance_screen/guidance_screen.dart';
import 'package:hedg/screens/home_screen/home_cubit.dart';
import 'package:hedg/screens/home_screen/home_screen.dart';
import 'package:hedg/screens/id_confirmation_screen/id_confirmation_cubit.dart';
import 'package:hedg/screens/id_confirmation_screen/id_confirmation_screen.dart';
import 'package:hedg/screens/insta_pay_screen/insta_pay_screen.dart';
import 'package:hedg/screens/login_screen/login_screen.dart';
import 'package:hedg/screens/moderated_explore_screen/moderated_explore_screen.dart';
import 'package:hedg/screens/my_account_screen/my_account_screen.dart';
import 'package:hedg/screens/new_pass_screen/new_pass_cubit.dart';
import 'package:hedg/screens/new_pass_screen/new_pass_screen.dart';
import 'package:hedg/screens/notifications_settings_screen/notifications_settings_cubit.dart';
import 'package:hedg/screens/notifications_settings_screen/notifications_settings_screen.dart';
import 'package:hedg/screens/onboarding_screen/onboarding_cubit.dart';
import 'package:hedg/screens/onboarding_screen/onboarding_screen.dart';
import 'package:hedg/screens/orders_history/Orders_cubit.dart';
import 'package:hedg/screens/orders_history/orders_screen.dart';
import 'package:hedg/screens/preformance_screen/preformace_cibit.dart';
import 'package:hedg/screens/preformance_screen/preformance_screen.dart';
import 'package:hedg/screens/security_screen/security_screen.dart';
import 'package:hedg/screens/settings_screen/settings_screen.dart';
import 'package:hedg/screens/signup_screen/signup_cubit.dart';
import 'package:hedg/screens/signup_screen/signup_screen.dart';
import 'package:hedg/screens/terms_conditions_screen/terms_conditions_screen.dart';
import 'package:hedg/screens/topup_screen/topup_screen.dart';
import 'package:hedg/screens/transaction_history_screen/transaction_history_screen.dart';
import 'package:hedg/screens/verify_screen/verify_cubit.dart';
import 'package:hedg/screens/verify_screen/verify_screen.dart';
import 'package:hedg/screens/vodafone_cash_screen/vodafone_cash_payment.dart';
import 'package:hedg/screens/vodafone_cash_screen/vodafone_cash_screen.dart';
import 'package:hedg/screens/wire_transfer_screen/wire_transfer_screen.dart';
import 'package:hedg/shared_prefs/shared_prefs.dart';

import 'screens/forget_pass_screen/forget_pass_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool? showLogin;
  try {
    showLogin = CacheHelper.getBoolean(key: "ShowLogin");
  } on Exception {
    showLogin = false;
  }
  runApp(MyApp(showLogin: showLogin));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.showLogin});

  final bool showLogin;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingCubit(),
        ),
        BlocProvider(
          create: (context) => ForgetPassCubit(),
        ),
        BlocProvider(create: (context) => NewPassCubit()),
        BlocProvider(
          create: (context) => SignupCubit(),
        ),
        BlocProvider(
          create: (context) => VerifyCubit(),
        ),
        BlocProvider(
          create: (context) => IdConfirmationCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => PerformanceCubit(),
        ),
        BlocProvider(
          create: (context) => OrdersCubit(),
        ),
        BlocProvider(
          create: (context) => ConfirmDepositCubit(),
        ),
        BlocProvider(create: (context) => CalculatorCubit()),
        BlocProvider(create: (context) => GuidanceCubit()),
        BlocProvider(create: (context) => BankInfoCubit()),
        BlocProvider(
          create: (context) => NotificationsSettingsCubit(),
        ),
        BlocProvider(create: (context) => ChangeQuestionCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: "Poppins"),
        routes: {
          // const SplashScreen().id: (context) => const SplashScreen(),
          OnboardingScreen.id: (context) => const OnboardingScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          ForgetPassScreen.id: (context) => ForgetPassScreen(),
          EnterCodeScreen.id: (context) => EnterCodeScreen(),
          NewPassScreen.id: (context) => NewPassScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          VerifyScreen.id: (context) => VerifyScreen(),
          IdConfirmationScreen.id: (context) => const IdConfirmationScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
          ConservativePlanScreen.id: (context) =>
              const ConservativePlanScreen(),
          PreformanceScreen.id: (context) => PreformanceScreen(),
          OrdersScreen.id: (context) => const OrdersScreen(),
          TopUpScreen.id: (context) => const TopUpScreen(),
          DebitCardScreen.id: (context) => DebitCardScreen(),
          InstaPayScreen.id: (context) => InstaPayScreen(),
          ConfirmDepositScreen.id: (context) => ConfirmDepositScreen(),
          VodafoneCashScreen.id: (context) => const VodafoneCashScreen(),
          VodafoneCashPayment.id: (context) => VodafoneCashPayment(),
          BankTransferScreen.id: (context) => const BankTransferScreen(),
          CashDepositScreen.id: (context) => CashDepositScreen(),
          WireTransferScreen.id: (context) => WireTransferScreen(),
          ConfirmTransferScreen.id: (context) => ConfirmTransferScreen(),
          ConservativeExploreScreen.id: (context) =>
              const ConservativeExploreScreen(),
          ModeratedExploreScreen.id: (context) =>
              const ModeratedExploreScreen(),
          AggressiveExploreScreen.id: (context) =>
              const AggressiveExploreScreen(),
          CalculatorScreen.id: (context) => const CalculatorScreen(),
          CustomPlanScreen.id: (context) => CustomPlanScreen(),
          GuidanceScreen.id: (context) => GuidanceScreen(),
          BuyScreen.id: (context) => BuyScreen(),
          MyAccountScreen.id: (context) => MyAccountScreen(),
          BankInfoScreen.id: (context) => const BankInfoScreen(),
          AddAccScreen.id: (context) => const AddAccScreen(),
          AboutUsScreen.id: (context) => const AboutUsScreen(),
          TermsConditionsScreen.id: (context) => const TermsConditionsScreen(),
          TransactionHistoryScreen.id: (context) =>
              const TransactionHistoryScreen(),
          SettingsScreen.id: (context) => const SettingsScreen(),
          NotificationsSettingsScreen.id: (context) =>
              const NotificationsSettingsScreen(),
          SecurityScreen.id: (context) => const SecurityScreen(),
          ChangePassScreen.id: (context) => ChangePassScreen(),
          ChangeQuestionScreen.id: (context) => ChangeQuestionScreen(),
          FaqScreen.id: (context) => const FaqScreen(),
        },
        initialRoute: showLogin ? LoginScreen.id : OnboardingScreen.id,
      ),
    );
  }
}
