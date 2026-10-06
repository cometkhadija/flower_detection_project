import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/flower_name_wrapper.dart';
import '../details/detail_screen.dart';

class ResultScreen extends StatelessWidget {
  final File imageFile;
  final Map<String, dynamic> result;

  const ResultScreen({
    super.key,
    required this.imageFile,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    final flower = FlowerNameMapper.getFlowerInfo(result["flowerName"]);

    final confidence =
        ((result["confidence"] as double) * 100).toStringAsFixed(1);

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text("Detection Result"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// Flower Image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.file(
                imageFile,
                height: 260,
                width: 260,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            /// English Name
            Text(
              flower["english"]!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 6),

            /// Bangla Name
            Text(
              flower["bangla"]!,
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 6),

            /// Scientific Name
            Text(
              flower["scientific"]!,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 15),

            /// Confidence
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.amber.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "Confidence : $confidence %",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            buildCard(
              context,
              "assets/icons/medicine.png",
              "Medicinal Properties",
              "medicinal",
            ),

            buildCard(
              context,
              "assets/icons/cultivation.png",
              "Cultivation Guidance",
              "cultivation",
            ),

            buildCard(
              context,
              "assets/icons/skincare.png",
              "Skincare Benefits",
              "skincare",
            ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            height: 55,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.home),
              label: const Text("Back to Home"),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(
    BuildContext context,
    String iconPath,
    String title,
    String pageType,
  ) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Image.asset(
          iconPath,
          width: 35,
          height: 35,
          errorBuilder: (_, __, ___) {
            return const Icon(Icons.image_not_supported);
          },
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailScreen(
                flowerName: result["flowerName"],
                pageType: pageType,
                title: '',
                content: '',
              ),
            ),
          );
        },
      ),
    );
  }
}