import 'package:flutter/material.dart';

import 'package:flower_identification_app/core/flower_name_wrapper.dart';
import 'package:flower_identification_app/services/flower_data_service.dart';

class DetailScreen extends StatelessWidget {
  final String flowerName;
  final String pageType;

  const DetailScreen({
    super.key,
    required this.flowerName,
    required this.pageType,
    required String title,
    required String content,
  });

  @override
  Widget build(BuildContext context) {
    final flower = FlowerNameMapper.getFlowerInfo(flowerName);

    String title = "";

    if (pageType == "medicinal") {
      title = "Medicinal Properties";
    } else if (pageType == "cultivation") {
      title = "Cultivation Guidance";
    } else {
      title = "Skincare Benefits";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              flower["english"]!,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 5),

            Text(
              flower["bangla"]!,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 5),

            Text(
              flower["scientific"]!,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: FutureBuilder<String>(
                  future: FlowerDataService().getContent(
                    flowerName,
                    pageType,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return const Text(
                        "Failed to load data.",
                      );
                    }

                    if (!snapshot.hasData) {
                      return const Text(
                        "No Information Available",
                      );
                    }

                    return Text(
                      snapshot.data!,
                      style: const TextStyle(
                        fontSize: 17,
                        height: 1.7,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 40),

            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.popUntil(
                    context,
                    (route) => route.isFirst,
                  );
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text("SCAN AGAIN"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}