import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;

class FaceCapturePage extends StatefulWidget {
  final List<CameraDescription> cameras;

  const FaceCapturePage({super.key, required this.cameras}); 

   @override
  FaceCapturePageState createState() => FaceCapturePageState();
}

class FaceCapturePageState extends State<FaceCapturePage> {
  CameraController? controller;
  bool isDetecting = true;
  int frameCount = 0;
  bool faceDetected = false;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    try {
      final frontCamera = widget.cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => widget.cameras.first,
      );

      controller = CameraController(frontCamera, ResolutionPreset.medium);
      await controller!.initialize();

      controller!.startImageStream((CameraImage image) async {
        if (!isDetecting || faceDetected) return;
        frameCount++;

        if (frameCount % 5 == 0) {
          isDetecting = false;
          Uint8List? jpegBytes = await convertYUV420toJpeg(image);
          if (jpegBytes != null) {
            await sendImageToAPI(jpegBytes);
          }
          isDetecting = true;
        }
      });

      setState(() {});
    } catch (e) {
      dev.log("Camera init error: $e");
    }
  }

  Future<void> sendImageToAPI(Uint8List imageBytes) async {
    try {
      final uri = Uri.parse("http://192.168.10.1:8000/process-frame/");//ipsddress of python api 

      final request = http.MultipartRequest('POST', uri);
      request.files.add(http.MultipartFile.fromBytes(
        'file',
        imageBytes,
        filename: 'frame.jpg',
      ));

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      final result = jsonDecode(responseBody);

      if (result['status'] == 'success' || result.containsKey('embedding')) {
        faceDetected = true;
        controller?.stopImageStream();

        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("✅ Face Detected"),
            content: const Text("Face successfully detected and embedded."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                  Navigator.pop(context); // Go back
                },
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      dev.log("API error: $e");
    }
  }

  Future<Uint8List?> convertYUV420toJpeg(CameraImage image) async {
    try {
      final width = image.width;
      final height = image.height;
      final imgData = img.Image(width: width, height: height);

      final planeY = image.planes[0].bytes;
      final planeU = image.planes[1].bytes;
      final planeV = image.planes[2].bytes;

      for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
          final yIndex = y * width + x;

          final uvRow = y ~/ 2;
          final uvCol = x ~/ 2;
          final uvOffset = uvRow * image.planes[1].bytesPerRow + uvCol;

          final Y = planeY[yIndex];
          final U = planeU[uvOffset];
          final V = planeV[uvOffset];

          final R = (Y + 1.402 * (V - 128)).clamp(0, 255).toInt();
          final G = (Y - 0.344136 * (U - 128) - 0.714136 * (V - 128)).clamp(0, 255).toInt();
          final B = (Y + 1.772 * (U - 128)).clamp(0, 255).toInt();

          imgData.setPixel(x, y, img.ColorInt32.rgb(R, G, B));
        }
      }

      final jpeg = img.encodeJpg(imgData);
      return Uint8List.fromList(jpeg);
    } catch (e) {
      dev.log("Image conversion error: $e");
      return null;
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("Capture Face")),
      body: controller != null && controller!.value.isInitialized
          ? CameraPreview(controller!)
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
