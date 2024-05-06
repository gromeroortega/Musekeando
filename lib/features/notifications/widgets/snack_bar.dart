import 'package:flutter/material.dart';
import 'package:musickeando/features/app/ui/theme/app_theme.dart';

class NotificationSnackBar extends StatelessWidget {
  const NotificationSnackBar(
      {Key? key,
      required this.message,
      required this.icon,
      required this.color})
      : super(key: key);
  final String message;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Icon(icon, color: color),
        ),
        const SizedBox(width: 10),
        Flexible(
          flex: 2,
          child: Text(
            message,
            style: context.titleSmall,
            overflow: TextOverflow.fade,
          ),
        ),
      ],
    );
  }
}
