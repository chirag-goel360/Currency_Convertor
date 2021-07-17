import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function function;

  CustomButton({
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: FloatingActionButton(
        onPressed: () {
          function();
        },
        child: Icon(
          Icons.swap_horiz_outlined,
          size: 30,
        ),
      ),
    );
  }
}
