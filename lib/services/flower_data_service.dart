import 'dart:convert';
import 'package:flutter/services.dart';

class FlowerDataService {
  static Map<String, dynamic>? _jsonData;

  Future<void> loadData() async {
    if (_jsonData != null) return;

    final jsonString =
        await rootBundle.loadString("assets/flower_data_26.json");

    _jsonData = json.decode(jsonString);
  }

  Future<String> getContent(
    String flowerName,
    String pageType,
  ) async {
    await loadData();

    final flowers = _jsonData!["flower_data"] as List;

    try {
      final flower = flowers.firstWhere(
        (item) => item["english"] == flowerName,
      );

      switch (pageType) {
        case "medicinal":
          return flower["medicinal"] ?? "No Information Available";

        case "cultivation":
          return flower["cultivation"] ?? "No Information Available";

        case "skincare":
          return flower["skincare"] ?? "No Information Available";

        default:
          return "No Information Available";
      }
    } catch (e) {
      return "No Information Available";
    }
  }
}