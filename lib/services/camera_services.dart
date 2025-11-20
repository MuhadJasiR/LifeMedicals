import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;

class CameraServices {
  CameraController? _cameraController;
  final CameraDescription cameraDescription;
  CameraServices(this.cameraDescription);

  Future<void> init() async {
    _cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.ultraHigh,
      enableAudio: false,
    );
    await _cameraController!.initialize();
  }

  Future<Uint8List> takepicture() async {
    final XFile file = await _cameraController!.takePicture();
    final bytes = await file.readAsBytes();

    final decoded = img.decodeImage(bytes);
    final resized = img.copyResize(decoded!, width: 224, height: 224);
    return Uint8List.fromList(img.encodeJpg(resized));
  }

  void dispose() {
    _cameraController?.dispose();
  }

  CameraController? get cameraController => _cameraController;
}
