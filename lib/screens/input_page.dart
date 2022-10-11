import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/bottom_container.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/utils/constants.dart';
import '../components/round_button.dart';
import 'package:bmi_calculator/models/calculator_brain.dart';

//Enums
enum CardClicked { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  CardClicked? gender;
  int selectedHeight = 180;
  int selectedWeight = 60;
  int selectedAge = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            gender = CardClicked.male;
                          });
                        },
                        containerColor: gender == CardClicked.male
                            ? kActiveCardColor
                            : kInActiveCardColor,
                        cardChild: IconContent(
                          fontIcon: FontAwesomeIcons.mars,
                          iconText: 'MALE',
                        )),
                  ),
                  Expanded(
                    child: ReusableCard(
                      containerColor: gender == CardClicked.female
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      cardChild: IconContent(
                        fontIcon: FontAwesomeIcons.venus,
                        iconText: 'FEMALE',
                      ),
                      onPress: () {
                        setState(() {
                          gender = CardClicked.female;
                        });
                      },
                    ),
                  ),
                ],
              )),
          Expanded(
              child: ReusableCard(
                containerColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(selectedHeight.toString(), style: kHeavyTextStyle),
                        const Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: const Color(0xFF8D8E98),
                          thumbColor: const Color(0xFFEB1555),
                          overlayColor: const Color(0x29EB1555),
                          thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                          value: selectedHeight.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double newValue) {
                            setState(() {
                              selectedHeight = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
              )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                      containerColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            selectedWeight.toString(),
                            style: kHeavyTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      selectedWeight--;
                                    });
                                  }),
                              const SizedBox(
                                width: 5.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: () {
                                    setState(() {
                                      selectedWeight++;
                                    });
                                  }),
                            ],
                          )
                        ],
                      ),
                    )),
                Expanded(
                    child: ReusableCard(
                      containerColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            selectedAge.toString(),
                            style: kHeavyTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      selectedAge--;
                                    });
                                  }),
                              const SizedBox(
                                width: 5.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: () {
                                    setState(() {
                                      selectedAge++;
                                    });
                                  }),
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
          BottomContainer(
            containerText: 'CALCULATE',
            onTap: () {

              CalculatorBrain obj = CalculatorBrain(height: selectedHeight, weight: selectedWeight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: obj.calculateBmi(),
                    resultText: obj.getResult(),
                    resultInterpretation: obj.getInterpretation(),
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
