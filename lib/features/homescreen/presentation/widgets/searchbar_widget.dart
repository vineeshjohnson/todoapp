import 'package:flutter/material.dart';
import 'package:todo/core/colors.dart';

class SearchbarWidget extends StatelessWidget {
  const SearchbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        TextField(
          
          maxLength: 50,
          decoration: InputDecoration(
              labelText: 'Search..',
              fillColor: AppColors.searchbarcolor,
              border: OutlineInputBorder(),),
        )
      ],
    );
  }
}
