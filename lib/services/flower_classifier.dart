import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

class FlowerClassifier {
  static final FlowerClassifier _instance = FlowerClassifier._internal();
  factory FlowerClassifier() => _instance;
  FlowerClassifier._internal();

  Interpreter? _interpreter;

  List<String> labels = [];

  bool _isLoaded = false;

  double threshold = 0.40;

  static const int inputSize = 224;
  static const int numClasses = 26;

  Future<void> loadModel() async {
    debugPrint("========== LOAD MODEL ==========");

    if (_isLoaded) {
      debugPrint("Model already loaded.");
      return;
    }

    try {
      _interpreter = await Interpreter.fromAsset(
        'assets/flower_model_26classes.tflite',
      );
      if (kDebugMode) {
        print("=================================");
      }
      if (kDebugMode) {
        print("INPUT SHAPE");
      }
      if (kDebugMode) {
        print(_interpreter!.getInputTensor(0).shape);
      }
      if (kDebugMode) {
        print(_interpreter!.getInputTensor(0).type);
      }

      if (kDebugMode) {
        print("OUTPUT SHAPE");
      }
      if (kDebugMode) {
        print(_interpreter!.getOutputTensor(0).shape);
      }
      if (kDebugMode) {
        print(_interpreter!.getOutputTensor(0).type);
      }
      if (kDebugMode) {
        print("=================================");
      }

      debugPrint("✅ TFLite Model Loaded");

      final jsonString = await rootBundle.loadString(
        'assets/flower_data_26.json',
      );

      final jsonData = json.decode(jsonString);

      labels = (jsonData["flower_data"] as List)
          .map((e) => e["english"] as String)
          .toList();

      debugPrint("✅ Labels Loaded : ${labels.length}");

      _isLoaded = true;

      debugPrint("===============================");
    } catch (e, s) {
      debugPrint("❌ Model Load Error");
      debugPrint(e.toString());
      debugPrint(s.toString());

      _isLoaded = false;
    }
  }

  bool get isLoaded => _isLoaded;

  Future<Map<String, dynamic>> predict(
    File imageFile,
  ) async {
    debugPrint("========== PREDICT ==========");

    if (!_isLoaded || _interpreter == null) {
      debugPrint("❌ Model Not Loaded");

      throw Exception("Model not loaded");
    }

    try {
      debugPrint("Reading Image...");

      final bytes = await imageFile.readAsBytes();

      img.Image? image = img.decodeImage(bytes);

      if (image == null) {
        throw Exception("Image Decode Failed");
      }

      debugPrint("Image Decoded");

      image = img.bakeOrientation(image);

      final resized = img.copyResize(
        image,
        width: inputSize,
        height: inputSize,
      );

      debugPrint("Image Resized");

      final input = List.generate(
        1,
        (_) => List.generate(
          inputSize,
          (y) => List.generate(
            inputSize,
            (x) {
              final pixel = resized.getPixel(x, y);

              return [
                pixel.r / 255.0,
                pixel.g / 255.0,
                pixel.b / 255.0,
              ];
            },
          ),
        ),
      );

      final output = List.generate(
        1,
        (_) => List.filled(numClasses, 0.0),
      );

      debugPrint("Running Interpreter...");

      _interpreter!.run(input, output);

      debugPrint("Interpreter Finished");

      final scores = output[0];

      debugPrint("================ RAW SCORES ================");
      debugPrint(scores.toString());
      debugPrint("===========================================");

      int bestIndex = 0;
      double bestScore = scores[0];

      for (int i = 1; i < scores.length; i++) {
        if (scores[i] > bestScore) {
          bestScore = scores[i];
          bestIndex = i;
        }
      }

      final flowerName =
          bestIndex < labels.length ? labels[bestIndex] : "Unknown";

      final isKnown = bestScore >= threshold;

      debugPrint("");
      debugPrint("Best Index : $bestIndex");
      debugPrint("Best Flower: $flowerName");
      debugPrint(
        "Confidence : ${(bestScore * 100).toStringAsFixed(2)}%",
      );
      debugPrint("Known      : $isKnown");
      debugPrint("===========================================");

      return {
        "flowerName": flowerName,
        "confidence": bestScore,
        "isKnown": isKnown,
        "index": bestIndex,
      };
    } catch (e, s) {
      debugPrint("❌ Prediction Error");
      debugPrint(e.toString());
      debugPrint(s.toString());

      return {
        "flowerName": "Error",
        "confidence": 0.0,
        "isKnown": false,
        "index": -1,
      };
    }
  }

  void dispose() {
    _interpreter?.close();
    _isLoaded = false;
  }
}
