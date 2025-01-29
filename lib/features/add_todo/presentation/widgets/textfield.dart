import 'package:flutter/material.dart';
import 'package:todo/core/colors.dart';

class Textfieldnew extends StatelessWidget {
  const Textfieldnew({
    super.key,
    required this.min,
    required this.label,
    required this.controller,
  });

  final int min;
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        minLines: min,
        maxLines: 50,
        style: const TextStyle(fontSize: 16, color: AppColors.black),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          alignLabelWithHint: true,
          fillColor: AppColors.fadetext,
          filled: true,
          labelText: label,
          labelStyle: const TextStyle(
            color: AppColors.onSurface,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.black, width: 1.5),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
