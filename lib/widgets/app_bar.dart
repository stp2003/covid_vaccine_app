import 'package:flutter/material.dart';

class AppBAR extends StatelessWidget {
  final String title;

  const AppBAR({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'poppins_bold',
          fontSize: 19.0,
          letterSpacing: 1.2,
        ),
      ),
      backgroundColor: Colors.teal,
      elevation: 0.0,
      titleSpacing: 18.2,
    );
  }
}
