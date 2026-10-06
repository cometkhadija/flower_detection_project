import 'dart:io';

import 'package:flutter/material.dart';

class FlowerCard extends StatelessWidget {
  final File image;

  const FlowerCard({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),

        child: Image.file(
          image,
          width: 220,
          height: 220,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}