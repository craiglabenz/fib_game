import 'package:flutter/material.dart';

class ConfirmMoveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Text(
          'Confirm',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
