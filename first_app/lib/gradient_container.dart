import 'package:flutter/material.dart';

import 'package:first_app/styled_text.dart';

const startAligment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colors});

  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAligment,
          end: endAlignment,
        ),
      ),
      child: const Center(
          child: StyledText('Hello World!')
          ),
    );
  }
}
