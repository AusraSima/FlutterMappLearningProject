import 'package:book_application/data/constants.dart';
import 'package:book_application/views/pages/course_page.dart';
import 'package:book_application/views/widgets/container_widget.dart';
import 'package:book_application/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      KValue.keyConcepts,
      KValue.basicLayout,
      KValue.cleanUi,
      KValue.fixBug,
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeroWidget(title: 'Flutter Mapp', nextPage: CoursePage()),
            ...List.generate(list.length, (index) {
              return ContainerWidget(
                title: list.elementAt(index),
                description: 'This is a descriptipn',
              );
            }),
          ],
        ),
      ),
    );
  }
}
