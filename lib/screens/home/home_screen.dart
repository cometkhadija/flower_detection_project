import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flower_identification_app/services/flower_classifier.dart';

import '../../core/app_colors.dart';
import '../result/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker picker = ImagePicker();

  bool loading = false;
  bool modelLoaded = false;

  @override
  void initState() {
    super.initState();
    initModel();
  }

  Future<void> initModel() async {
    debugPrint("========== HOME ==========");
    debugPrint("Loading Model...");

    await FlowerClassifier().loadModel();

    debugPrint("Model Loaded Successfully");

    if (!mounted) return;

    setState(() {
      modelLoaded = true;
    });
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      debugPrint("STEP 1 : Opening Image Picker");

      final XFile? file = await picker.pickImage(
        source: source,
        imageQuality: 100,
      );

      debugPrint("STEP 2 : Picker Closed");

      if (file == null) {
        debugPrint("Image Cancelled");
        return;
      }

      debugPrint("STEP 3 : ${file.path}");

      setState(() {
        loading = true;
      });

      debugPrint("STEP 4 : Predicting...");

      final result =
          await FlowerClassifier().predict(File(file.path));

      debugPrint("STEP 5 : Prediction Finished");
      debugPrint(result.toString());

      setState(() {
        loading = false;
      });

      if (!mounted) return;

      debugPrint("STEP 6 : Opening Result Screen");

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            imageFile: File(file.path),
            result: result,
          ),
        ),
      );

      debugPrint("STEP 7 : Done");
    } catch (e, s) {
      debugPrint("❌ HOME ERROR");
      debugPrint(e.toString());
      debugPrint(s.toString());

      setState(() {
        loading = false;
      });

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [

              const SizedBox(height: 20),

              Image.asset(
                "assets/images/app_logo.png",
                height: 90,
                errorBuilder: (_, __, ___) {
                  return const SizedBox();
                },
              ),

              const SizedBox(height: 15),

              Text(
                "FLORA IDENTIFY",
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              const SizedBox(height: 10),

              Text(
                "UNVEIL NATURE'S WISDOM",
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const Spacer(),

              Container(
                height: 260,
                width: 260,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  border: Border.all(
                    color: AppColors.gold,
                    width: 3,
                  ),

                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/background_pattern.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),

                child: loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Center(
                        child: Image.asset(
                          "assets/icons/camera.png",
                          width: 70,
                          height: 70,
                          errorBuilder: (_, __, ___) {
                            return const Icon(
                              Icons.camera_alt,
                              size: 70,
                              color: AppColors.primary,
                            );
                          },
                        ),
                      ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(
                  onPressed: (!modelLoaded || loading)
                      ? null
                      : () => pickImage(ImageSource.camera),

                  icon: Image.asset(
                    "assets/icons/camera.png",
                    width: 24,
                    height: 24,
                    errorBuilder: (_, __, ___) {
                      return const Icon(Icons.camera_alt);
                    },
                  ),

                  label: const Text("USE CAMERA"),
                ),
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: OutlinedButton.icon(
                  onPressed: (!modelLoaded || loading)
                      ? null
                      : () => pickImage(ImageSource.gallery),

                  icon: Image.asset(
                    "assets/icons/gallery.png",
                    width: 24,
                    height: 24,
                    errorBuilder: (_, __, ___) {
                      return const Icon(Icons.photo);
                    },
                  ),

                  label: const Text("UPLOAD FROM GALLERY"),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}