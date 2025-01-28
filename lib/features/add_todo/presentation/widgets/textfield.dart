import 'package:flutter/material.dart';
import 'package:todo/core/colors.dart';

class Textfieldnew extends StatelessWidget {
  const Textfieldnew({super.key, required this.min, required this.label,required this.controller});
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
        decoration: InputDecoration(
            alignLabelWithHint: true,
            fillColor: AppColors.fadetext,
            filled: true,
            labelText: label,
            labelStyle: const TextStyle(color: AppColors.black),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.black),
                borderRadius: BorderRadius.all(Radius.circular(12)))),
      ),
    );
  }
}
