import 'package:flutter/material.dart';
import 'package:helper_module/constants/app_colors.dart';

class ServiceItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const ServiceItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.grey,
          radius: 30.0,
          child: Icon(
            icon,
            color: Colors.black,
            size: 30.0,
          ),
        ),
        Text(label),
      ],
    );
  }
}
