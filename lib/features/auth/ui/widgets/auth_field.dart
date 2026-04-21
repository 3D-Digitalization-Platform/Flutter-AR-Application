import 'package:flutter/material.dart';

Widget commonField(
  String hint, {
  bool isPassword = false,
  TextEditingController? controller,
  bool hasError = false,
  TextInputType? keyboardType,
}) {
  return TextField(
    controller: controller,
    obscureText: isPassword,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: const Color(0xFFF5F6FA),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: hasError ? const BorderSide(color: Colors.red, width: 2) : BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: hasError ? const BorderSide(color: Colors.red, width: 2) : BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: hasError ? const BorderSide(color: Colors.red, width: 2) : const BorderSide(color: Color(0xFF6C8FCB), width: 1.5),
      ),
    ),
  );
}
