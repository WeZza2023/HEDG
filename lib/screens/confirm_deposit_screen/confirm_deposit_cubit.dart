import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'confirm_deposit_state.dart';

class ConfirmDepositCubit extends Cubit<ConfirmDepositState> {
  ConfirmDepositCubit() : super(ConfirmDepositInitial());
  File? receiptImage;

  void removeImage() {
    receiptImage = null;
    emit(RemoveImageState());
  }

  Future<void> pickImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    receiptImage = File(image!.path);

    emit(PickedImageState());
  }
}
