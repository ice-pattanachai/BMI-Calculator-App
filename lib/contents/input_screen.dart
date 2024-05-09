import 'package:flutter/material.dart';
import 'package:flutter_bmi/components/constants.dart';
import 'package:flutter_bmi/contents/bmi_calculate/BottomContainer_Button.dart';
import 'package:flutter_bmi/contents/bmi_calculate/bg_card_content.dart';
import 'package:flutter_bmi/contents/bmi_calculate/calculator_brain.dart';
import 'package:flutter_bmi/contents/bmi_calculate/circle_button.dart';
import 'package:flutter_bmi/contents/result_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bg_card.dart';

import 'dart:developer' as dev;

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreen();
}

class _InputScreen extends State<InputScreen> {
  var maleCardColor = kInActiveColor;
  var femaleCardColor = kActiveColor;
  var inputHeight = 168;
  var inputAge = 18;
  var inputWidth = 80;

  void toggleGenderCard() {
    var colorHolder = maleCardColor;
    maleCardColor = femaleCardColor;
    femaleCardColor = colorHolder;
    dev.log(
        'call toggleGenderCard male:$maleCardColor female:$femaleCardColor');
  }

  void updateAge(int value) {
    setState(() {
      inputAge += value;
    });
  }

  void updateWeight(int value) {
    setState(() {
      inputWidth += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BgCard(
                    callback: () => setState(() => toggleGenderCard()),
                    child: BgCardContent(
                      icon: FontAwesomeIcons.mars,
                      textLabel: 'Male',
                      color: maleCardColor,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        toggleGenderCard();
                      });
                    },
                    child: BgCard(
                      callback: () => setState(() => toggleGenderCard()),
                      child: BgCardContent(
                        icon: FontAwesomeIcons.venus,
                        textLabel: 'Female',
                        color: femaleCardColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BgCard(
              callback: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Height',
                    style: kLabelNumberTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        inputHeight.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text('CM'),
                    ],
                  ),
                  Expanded(
                    child: Slider(
                      value: inputHeight.toDouble(),
                      max: 250,
                      min: 10,
                      activeColor: const Color(0xffeb1555),
                      onChanged: (value) {
                        setState(() {
                          inputHeight = value.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: BgCard(
                  callback: () {},
                  child: Column(
                    children: [
                      const Text(
                        'Weight',
                        style: kLabelNumberTextStyle,
                      ),
                      Text(
                        inputWidth.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleButton(
                            callback: () => setState(() => inputWidth += 1),
                            icon: FontAwesomeIcons.plus,
                          ),
                          const SizedBox(width: .2),
                          CircleButton(
                            callback: () => setState(() => inputWidth -= 1),
                            icon: FontAwesomeIcons.minus,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: BgCard(
                  callback: () {},
                  child: Column(
                    children: [
                      const Text(
                        'Age',
                        style: kLabelNumberTextStyle,
                      ),
                      Text(
                        inputAge.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleButton(
                            callback: () => setState(() => inputAge += 1),
                            icon: FontAwesomeIcons.plus,
                          ),
                          const SizedBox(width: .2),
                          CircleButton(
                            callback: () => setState(() => inputAge -= 1),
                            icon: FontAwesomeIcons.minus,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          BottomContainer(
            text: 'CALCULATE',
            onTap: () {
              Calculate calc = Calculate(
                inputHeight: inputHeight,
                inputWidth: inputWidth,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: calc.result(),
                    resultText: calc.getText(),
                    advise: calc.getAdvise(),
                    textColor: calc.getTextColor(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
