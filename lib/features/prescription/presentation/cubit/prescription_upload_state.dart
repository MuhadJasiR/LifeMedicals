part of 'prescription_upload_cubit.dart';

abstract class PrescriptionUploadState extends Equatable {
  const PrescriptionUploadState();

  @override
  List<Object> get props => [];
}

final class PrescriptionUploadInitial extends PrescriptionUploadState {}

class PrescriptionUploadSelected extends PrescriptionUploadState {
  final File imageFile;
  const PrescriptionUploadSelected(this.imageFile);
}

class PrescriptionUploadInProgress extends PrescriptionUploadState {}

class PrescriptionUploadSuccess extends PrescriptionUploadState {}

class PrescriptionUploadFailure extends PrescriptionUploadState {
  final String errorMessage;
  const PrescriptionUploadFailure(this.errorMessage);
}
