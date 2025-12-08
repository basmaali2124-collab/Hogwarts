import 'package:flutter/material.dart';

class CustomArticleWidget extends StatelessWidget {
  final String text;
  final bool isFinal;

  const CustomArticleWidget({
    super.key,
    required this.text,
    this.isFinal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Griffy',
          fontSize: isFinal ? 22 : 20,
          height: 1.9,
          color: const Color(0xFF5D4037),
          fontWeight: isFinal ? FontWeight.bold : FontWeight.normal,
          letterSpacing: 0.8,
          shadows: isFinal
              ? [
                  const Shadow(
                    offset: Offset(0, 2),
                    blurRadius: 8,
                    color: Colors.black26,
                  ),
                ]
              : null,
        ),
      ),
    );
  }
}
