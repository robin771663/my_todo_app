import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const Button({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
    color: Colors.yellow,
    child: Text(text),);
  }
}