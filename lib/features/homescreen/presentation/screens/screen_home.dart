import 'package:flutter/material.dart';
import 'package:todo/features/homescreen/presentation/widgets/searchbar_widget.dart';
import 'package:todo/features/homescreen/presentation/widgets/stack_container_widget.dart';

import '../widgets/minititles_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [StackContainerWidget(), MinititlesWidget()],
        ),
      ),
    );
  }
}
