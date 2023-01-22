import 'package:flutter/material.dart';

import 'action_button.dart';
import 'sessions.dart';
import 'timer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Pomodoro'),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Sessions(),
          Timer(),
          ActionButton(),
        ],
      ),
    );
  }
}
