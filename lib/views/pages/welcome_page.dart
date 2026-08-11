import 'package:book_application/views/widget_tree.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('assets/images/bg.jpg'),
            ),
            FilledButton(onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WidgetTree();
                  },
                ),
              );
            }, child: Text('Login')),
          ],
        ),
      ),
    );
  }
}
