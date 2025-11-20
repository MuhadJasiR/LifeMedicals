import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'prescription_upload_state.dart';

class PrescriptionUploadCubit extends Cubit<PrescriptionUploadState> {
  final ImagePicker _imagePicker = ImagePicker();
  PrescriptionUploadCubit() : super(PrescriptionUploadInitial());

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(source: source);
      if (pickedFile != null) {
        emit(PrescriptionUploadSelected(File(pickedFile.path)));
      }
    } catch (e) {
      log('error picking image: $e');
      emit(PrescriptionUploadFailure(e.toString()));
    }
  }
}
