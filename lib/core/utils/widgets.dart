import 'package:flutter/material.dart';

Widget buildAppButton({
  required void Function()? onTap,
  required String titleButton,
  required Color textColor,
}) {
  return Material(
    elevation: 7.0,
    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    child: InkWell(
      onTap: onTap,
      child: Ink(
        decoration:  BoxDecoration(
          color: textColor,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        height: 48,
        child: Center(
            child: Text(
          titleButton,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    ),
  );
}
