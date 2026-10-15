import 'package:flutter/material.dart';

class AppEmpty extends StatelessWidget {
  final String message;

  const AppEmpty({super.key, this.message = 'No data found.'});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}
