import 'package:flutter/material.dart';

Widget MyTextButton(Color? foregroundColor, Color? backgroundColor,
    Function onPressed, String text, Color color) {
  return Expanded(
    child: TextButton(
      style: TextButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          shape: const LinearBorder()),
      onPressed: () {
        onPressed();
      },
      child: Container(
        height: 85,
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 28, color: color),
        )),
      ),
    ),
  );
}

Widget MyIconButton(Color? foregroundColor, Color? backgroundColor,
    Function onPressed, IconData? icon, Color color) {
  return Expanded(
    child: TextButton(
      style: TextButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          shape: const LinearBorder()),
      onPressed: () {
        onPressed();
      },
      child: Container(
        height: 85,
        child: Center(
          child: Icon(
            icon,
            size: 32,
            color: color,
          ),
        ),
      ),
    ),
  );
}
