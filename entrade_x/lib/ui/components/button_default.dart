import 'package:flutter/material.dart';

class ButtonLoginWidget extends StatelessWidget {
  const ButtonLoginWidget(
      {super.key,
      required this.screenSize,
      required this.onTap,
      this.text = ''});

  final void Function()? onTap;
  final Size screenSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: screenSize.width * 0.4,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
