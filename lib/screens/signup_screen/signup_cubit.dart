import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/screens/signup_screen/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  String countryCode = '-  -';
  bool isPassShow = true;

  void changeCountryCode({required String code}) {
    countryCode = code;
    emit(ChangeCountryCodeState());
  }

  void changePassState() {
    isPassShow = !isPassShow;
    emit(ChangePassState());
  }
}
