import 'package:flutter/material.dart';
import 'dart:math';

final random = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int activeDice = 1;
  int activeDice2 = 1;

  void rollDice() {
    setState(() {
      activeDice = random.nextInt(6) + 1;
      activeDice2 = random.nextInt(6) + 1;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Image.asset('images/dice-$activeDice.png', width: 200),
            const SizedBox(height: 20),
            Image.asset('images/dice-$activeDice2.png', width: 200),
            const SizedBox(height: 20),
          ],
        ),

        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          onPressed: rollDice,
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}
