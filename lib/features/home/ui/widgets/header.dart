import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
    required this.size,
  }) : super(key: key);
  final MediaQueryData size;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: size.size.height * 0.32,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(48)),
          gradient: LinearGradient(
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
        ));
  }
}
