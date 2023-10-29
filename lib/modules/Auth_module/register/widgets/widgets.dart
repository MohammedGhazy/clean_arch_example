import 'package:flutter/material.dart';

Widget buildTextFormField({
  TextEditingController? controller,
  String? hintText,
  required TextInputType keyboardType,
  required IconData prefixIcon,
  String? label,
  required Function validator,
  required Function onFieldSubmitted,
  void Function(String)? onChanged,
  IconData? suffixIcon,
  void Function()? suffixPress,
  bool isPassword = false,
}) {
  return TextFormField(
      obscureText: isPassword,
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      onFieldSubmitted: (value) => onFieldSubmitted(value),
      validator: (input) => validator(input),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
        border: OutlineInputBorder(
            borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.grey[100],
        hoverColor: Colors.indigo,
        prefixIcon: Icon(prefixIcon),
        suffix: GestureDetector(
            onTap:  suffixPress,
            child: Icon(suffixIcon)),
        //TODO prefixIconColor: ,
        hintText: hintText ?? "",
        label: Text(label ?? "", style: TextStyle(color: Colors.grey[600])),
      )
  );
}