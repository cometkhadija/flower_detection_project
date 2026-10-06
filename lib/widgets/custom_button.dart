import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData icon;
  final bool outlined;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,

      child: outlined
          ? OutlinedButton.icon(
              onPressed: onPressed,
              icon: Icon(icon),
              label: Text(text),

              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 235, 240, 236),
                side: const BorderSide(
                  color: Color.fromARGB(255, 5, 43, 27),
                  width: 2,
                ),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            )
          : ElevatedButton.icon(
              onPressed: onPressed,

              icon: Icon(icon),

              label: Text(text),

              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,

                foregroundColor: Colors.white,

                elevation: 4,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
    );
  }
}