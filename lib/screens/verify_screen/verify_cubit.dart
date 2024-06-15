import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hedg/screens/verify_screen/verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyInitial());

  bool canReSend = true;
  int reSendTime = 30;
  Timer? _timer;

  void reSendCounter() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (reSendTime == 0) {
        _timer!.cancel();
        reSendTime = 30;
        canReSend = true;
        emit(ReSendTimerCancelState());
      } else {
        reSendTime--;
        canReSend = false;
        emit(ReSendTimerState());
      }
    });
  }
}
