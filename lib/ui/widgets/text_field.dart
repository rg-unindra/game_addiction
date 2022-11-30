import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_addiction/core/utils/extensions/extensions.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.onSubmited,
    this.controller,
  });

  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmited;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onSubmitted: onSubmited,
      inputFormatters: inputFormatters,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16).r(context),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
