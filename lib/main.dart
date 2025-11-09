import 'package:flutter/material.dart';

import 'gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 175, 69, 108),
          Color.fromARGB(255, 58, 53, 53),
        ),
      ),
    ),
  );
}
