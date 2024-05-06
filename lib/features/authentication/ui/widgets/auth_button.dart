import 'package:flutter/material.dart';

import 'package:musickeando/features/app/ui/theme/app_theme.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment(0.4, 1.0),
          colors: <Color>[
            Color(0xFFeb386f),
            Color(0xFFe4397f),
            Color(0xFFdd398d),
            Color(0xFFd63a9a),
            Color(0xFFcf3aa5),
            Color(0xFFc83aaf),
            Color(0xFFc03ab7),
            Color(0xFFb53ab9),
            Color(0xFFa23ab2),
            Color(0xFF9039ab),
            Color(0xFF7f39a4),
            Color(0xFF70389d)
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: Text('Ingresar', style: context.titleSmall),
    );
  }
}
