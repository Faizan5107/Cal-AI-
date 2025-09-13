import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_flow/theme/colors.dart';

import '../../widgets/measurment_selector.dart';
import '../../widgets/title_widget.dart';

class HeightWeightScreen extends StatefulWidget {
  @override
  _HeightWeightScreenState createState() => _HeightWeightScreenState();
}

class _HeightWeightScreenState extends State<HeightWeightScreen> {
  bool isImperial = true;

  int _currentHeightInches = 68;
  int _currentHeightCm = 173;

  int _currentWeightLbs = 150;
  int _currentWeightKg = 68;

  List<String> _getHeightValues(bool forImperial) {
    if (forImperial) {
      return List<String>.generate(49, (i) {
        final totalInches = 48 + i;
        final feet = totalInches ~/ 12;
        final inches = totalInches % 12;
        return "${feet} ft ${inches} in";
      });
    } else {
      return List<String>.generate(151, (i) => (100 + i).toString());
    }
  }

  List<String> _getWeightValues(bool forImperial) {
    if (forImperial) {
      return List<String>.generate(251, (i) => (50 + i).toString());
    } else {
      return List<String>.generate(181, (i) => (20 + i).toString());
    }
  }

  int _getInitialIndex(List<String> values, int targetValue) {
    final String targetString = targetValue.toString();
    final int index = values.indexOf(targetString);
    if (index != -1) {
      return index;
    }
    for (int i = 0; i < values.length; i++) {
      if (int.parse(values[i]) >= targetValue) {
        return i;
      }
    }
    return 0;
  }

  @override
  @override
  Widget build(BuildContext context) {
    final List<String> heightValues = _getHeightValues(isImperial);
    final List<String> weightValues = _getWeightValues(isImperial);

    final int initialHeightIndex =
        isImperial
            ? (_currentHeightInches - 48)
            : _getInitialIndex(heightValues, _currentHeightCm);

    final int initialWeightIndex = _getInitialIndex(
      weightValues,
      isImperial ? _currentWeightLbs : _currentWeightKg,
    );

    List<String> _getFeetValues() {
      return List<String>.generate(5, (i) => (4 + i).toString());
    }

    List<String> _getInchValues() {
      return List<String>.generate(12, (i) => i.toString());
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWidget.heading(
                    'Height & Weight',
                    fontSize: 32,
                    align: TextAlign.start,
                  ),
                  TitleWidget.subtitle(
                    'This will be taken into account when calculating your daily nutrition goals.',
                    align: TextAlign.start,
                  ),
                ],
              ),
            ),
            // SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TitleWidget.heading(
                    'Imperial',
                    fontSize: 22,
                    color: isImperial ? AppColor.black : AppColor.lightBg,
                  ),
                  Switch(
                    inactiveTrackColor: Colors.grey,
                    activeTrackColor: AppColor.black,
                    value: !isImperial,
                    onChanged: (value) {
                      setState(() {
                        isImperial = !value;
                        if (isImperial) {
                          _currentHeightInches =
                              (_currentHeightCm / 2.54).round();
                          _currentWeightLbs =
                              (_currentWeightKg * 2.20462).round();
                        } else {
                          _currentHeightCm =
                              (_currentHeightInches * 2.54).round();
                          _currentWeightKg =
                              (_currentWeightLbs / 2.20462).round();
                        }
                      });
                    },
                  ),
                  TitleWidget.heading(
                    'Metric',
                    fontSize: 22,
                    color: !isImperial ? AppColor.black : AppColor.lightBg,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  isImperial
                      ? Column(
                        children: [
                          TitleWidget.heading('Height', fontSize: 18),
                          Row(
                            children: [
                              SizedBox(
                                height: 200,
                                width: 100,
                                child: CupertinoPicker(
                                  scrollController: FixedExtentScrollController(
                                    initialItem:
                                        (_currentHeightInches ~/ 12) - 4,
                                  ),
                                  itemExtent: 60,
                                  onSelectedItemChanged: (index) {
                                    setState(() {
                                      final feet = 4 + index;
                                      final inches = _currentHeightInches % 12;
                                      _currentHeightInches =
                                          (feet * 12) + inches;
                                    });
                                  },
                                  children:
                                      _getFeetValues()
                                          .map(
                                            (value) => Center(
                                              child: Text("$value ft"),
                                            ),
                                          )
                                          .toList(),
                                ),
                              ),

                              SizedBox(width: 5),
                              SizedBox(
                                height: 200,
                                width: 100,
                                child: CupertinoPicker(
                                  scrollController: FixedExtentScrollController(
                                    initialItem: _currentHeightInches % 12,
                                  ),
                                  itemExtent: 50,
                                  onSelectedItemChanged: (index) {
                                    setState(() {
                                      final feet = _currentHeightInches ~/ 12;
                                      _currentHeightInches =
                                          (feet * 12) + index;
                                    });
                                  },
                                  children:
                                      _getInchValues()
                                          .map(
                                            (value) => Center(
                                              child: Text("$value in"),
                                            ),
                                          )
                                          .toList(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                      : Column(
                        children: [
                          TitleWidget.heading('Height', fontSize: 18),

                          SizedBox(
                            height: 200,
                            width: 100,
                            child: CupertinoPicker(
                              scrollController: FixedExtentScrollController(
                                initialItem: _getInitialIndex(
                                  _getHeightValues(false),
                                  _currentHeightCm,
                                ),
                              ),
                              itemExtent: 50,
                              onSelectedItemChanged: (index) {
                                setState(() {
                                  _currentHeightCm = int.parse(
                                    _getHeightValues(false)[index],
                                  );
                                });
                              },
                              children:
                                  _getHeightValues(false)
                                      .map(
                                        (value) =>
                                            Center(child: Text("$value cm")),
                                      )
                                      .toList(),
                            ),
                          ),
                        ],
                      ),

                  Column(
                    children: [
                      TitleWidget.heading('Weight', fontSize: 18),

                      SizedBox(
                        height: 200,
                        width: 100,
                        child: CupertinoPicker(
                          scrollController: FixedExtentScrollController(
                            initialItem: initialWeightIndex,
                          ),
                          itemExtent: 50,
                          onSelectedItemChanged: (index) {
                            setState(() {
                              if (isImperial) {
                                _currentWeightLbs = int.parse(
                                  weightValues[index],
                                );
                              } else {
                                _currentWeightKg = int.parse(
                                  weightValues[index],
                                );
                              }
                            });
                          },
                          children:
                              weightValues
                                  .map(
                                    (value) => Center(
                                      child: Text(
                                        "$value ${isImperial ? "lbs" : "kg"}",
                                      ),
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
