import 'package:flutter/material.dart';

import '../../../../core/colors.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 54,
      width: 259,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          labelText: 'Search..',
          fillColor: AppColors.searchbarcolor,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.black),
              borderRadius: BorderRadius.all(Radius.circular(12))),
        ),
      ),
    );
  }
}
