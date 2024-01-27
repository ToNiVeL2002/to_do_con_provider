import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xffC5FFF8),
            Color(0xff96EFFF),
            Color(0xff7B66FF),
          ]
        )
      ),
    );
  }
}