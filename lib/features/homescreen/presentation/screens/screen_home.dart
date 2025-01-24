import 'package:flutter/material.dart';
import 'package:todo/features/homescreen/presentation/widgets/searchbar_widget.dart';
import 'package:todo/features/homescreen/presentation/widgets/stack_container_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [StackContainerWidget(), SearchbarWidget()],
        ),
      ),
    );
  }
}
