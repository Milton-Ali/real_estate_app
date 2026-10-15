import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String message;

  const AppError({
    super.key,
    this.message = 'Something went wrong. Please try again.',
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}
