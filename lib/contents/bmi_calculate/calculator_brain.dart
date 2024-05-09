import 'dart:math';
import 'package:flutter/material.dart';

class Calculate {
  Calculate({required this.inputHeight, required this.inputWidth});
  int inputHeight;
  int inputWidth;
  double _bmi = 0;
  // Color _textColor = Color(0xFF24D876);
  String result() {
    _bmi = (inputWidth / pow(inputHeight / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getText() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getAdvise() {
    if (_bmi >= 25) {
      return 'คุณมีน้ำหนักตัวมากกว่าปกติ \n พยายามออกกำลังกายให้มากขึ้น';
    } else if (_bmi > 18.5) {
      return 'คุณมีน้ำหนักตัวอยู่ในเกณฑ์ปกติ.\nGood job!';
    } else {
      return 'คุณมีน้ำหนักตัวต่ำกว่าปกติ.\n พยายามกินให้มากขึ้น';
    }
  }

  Color getTextColor() {
    if (_bmi >= 24 || _bmi <= 18) {
      return Colors.deepOrangeAccent;
    } else {
      return Color(0xFF24D876);
    }
  }
}
