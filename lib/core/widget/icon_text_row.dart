import 'package:flutter/material.dart';

class IconTextRow extends StatelessWidget {
  const IconTextRow({
    required this.icon,
    required this.iconColor,
    required this.text,
    super.key,
  });
  final IconData icon;
  final Color iconColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
        ),
      ],
    );
  }
}
