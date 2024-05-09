import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
    required this.icon,
    required this.callback,
  }) : super(key: key);
  final IconData icon;
  final void Function() callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const CircleBorder(),
        ),
        backgroundColor: MaterialStateProperty.all(
          const Color(0xff4c4f5e),
        ),
      ),
      child: Icon(
        // FontAwesomeIcons.plus,
        icon,
      ),
    );
  }
}
// required Null Function() callback, required IconData icon,
