import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = 'assets/images/dice-1.png';

  rollDice() {
    setState(() {
      activeDiceImage = 'assets/images/dice-2.png';      
    });
  }

  @override
  Widget build(context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            activeDiceImage,
            width: 200,
          ),
          const SizedBox(height: 20,), // Create an empty box of heigth 20
          TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
              // padding: const EdgeInsets.only(top: 20,),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 28,
              ),
            ),
            child: const Text('Roll Dice'),
          )
        ],
      );
  }
}