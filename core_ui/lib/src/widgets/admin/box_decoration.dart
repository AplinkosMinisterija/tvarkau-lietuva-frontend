import 'package:flutter/material.dart';

BoxDecoration getBoxDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    boxShadow: [
      BoxShadow(
        color: const Color.fromRGBO(28, 5, 206, 1).withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(7, 6),
      ),
    ],
    border: Border.all(width: 2, color: const Color.fromRGBO(43, 4, 166, 0.7)),
    gradient: const LinearGradient(
      colors: <Color>[
        Color.fromRGBO(12, 0, 42, 0.5),
        Color.fromRGBO(71, 21, 239, 0.5)
      ],
    ),
  );
}
