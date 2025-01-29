import 'package:flutter/material.dart';
import 'package:todo/features/homescreen/presentation/widgets/search_button.dart';
import 'package:todo/features/homescreen/presentation/widgets/searchfield_widget.dart';

class SearchbarWidget extends StatelessWidget {
  const SearchbarWidget({super.key, required this.onpress});
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchFieldWidget(),
            SearchButton(
              onpress: onpress,
            )
          ],
        ),
      ),
    );
  }
}
