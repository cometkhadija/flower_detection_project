import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),

      centerTitle: true,

      backgroundColor: AppColors.background,

      elevation: 0,

      foregroundColor: AppColors.primary,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}