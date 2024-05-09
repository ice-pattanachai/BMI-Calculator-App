import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'circle_button.dart';
import '../../components/constants.dart';

class BgCardContent extends StatelessWidget {
  const BgCardContent({
    Key? key,
    required this.icon,
    // required this.iconSize,
    required this.textLabel,
    required this.color,
  }) : super(key: key);

  final IconData icon;
  // final double iconSize;
  final String textLabel;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60,
          color: color,
        ),
        Text(textLabel),
      ],
    );
  }
}

// ignore: must_be_immutable
class BuildSetState extends StatefulWidget {
  BuildSetState({
    Key? key,
    required this.inputbuildnumber,
    required this.labeltext,
  }) : super(key: key);

  int inputbuildnumber;
  final String labeltext;

  @override
  _BuildSetStateState createState() => _BuildSetStateState();
}

class _BuildSetStateState extends State<BuildSetState> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.labeltext,
          style: kLabelNumberTextStyle,
        ),
        Text(
          widget.inputbuildnumber.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleButton(
              callback: () => setState(() => widget.inputbuildnumber += 1),
              icon: FontAwesomeIcons.plus,
            ),
            const SizedBox(width: .2),
            CircleButton(
              callback: () => setState(() => widget.inputbuildnumber -= 1),
              icon: FontAwesomeIcons.minus,
            ),
          ],
        ),
      ],
    );
  }
}
