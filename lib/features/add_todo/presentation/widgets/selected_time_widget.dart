import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/colors.dart';
import 'package:todo/core/fonts.dart';
import 'package:todo/features/add_todo/presentation/widgets/buttons.dart';
import 'package:todo/features/add_todo/presentation/widgets/choose_button.dart';
import 'package:todo/features/homescreen/presentation/bloc/todo_bloc.dart';

class SelectedTimeWidget extends StatelessWidget {
  const SelectedTimeWidget({super.key, required this.date});
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: AppColors.fadetext, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            date,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: Fonts.mainfont,
                color: AppColors.black),
          ),
          Buttons(
              text: 'Choose',
              onpress: () {
                context.read<TodoBloc>().add(ChooseDateEvent(context: context));
              })
        ],
      ),
    );
  }
}
