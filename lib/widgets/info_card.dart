import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,

      child: ListTile(
        leading: Icon(icon),

        title: Text(title),

        trailing: const Icon(Icons.chevron_right),

        onTap: onTap,
      ),
    );
  }
}