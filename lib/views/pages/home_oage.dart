import 'package:book_application/views/widgets/container_widget.dart';
import 'package:book_application/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeroWidget(title: 'Flutter Mapp'),
            ContainerWidget(
              title: 'Basic layout',
              description: 'This is a descriptipn',
            ),
            ContainerWidget(
              title: 'Basic layout',
              description: 'This is a descriptipn',
            ),
            ContainerWidget(
              title: 'Basic layout',
              description: 'This is a descriptipn',
            ),
            ContainerWidget(
              title: 'Basic layout',
              description: 'This is a descriptipn',
            ),
            ContainerWidget(
              title: 'Basic layout',
              description: 'This is a descriptipn',
            ),
          ],
        ),
      ),
    );
  }
}
