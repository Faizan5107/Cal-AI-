import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_flow/widgets/title_widget.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

import '../theme/colors.dart';

enum Unit { kg, lb }

class WeightSlider extends StatefulWidget {
  const WeightSlider({Key? key}) : super(key: key);

  @override
  State<WeightSlider> createState() => _WeightSliderState();
}

class _WeightSliderState extends State<WeightSlider> {
  late WeightSliderController _controller;

  double _weightKg = 30.0;
  Unit _unit = Unit.kg;

  double _kgToLb(double kg) => kg * 2.2046226218;
  double _lbToKg(double lb) => lb / 2.2046226218;

  @override
  void initState() {
    super.initState();
    _controller = WeightSliderController(
      initialWeight: _weightKg,
      minWeight: 0,
      interval: 0.1,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _switchUnit(Unit next) {
    if (_unit == next) return;

    setState(() {
      _unit = next;
      final displayValue =
      _unit == Unit.kg ? _weightKg : _kgToLb(_weightKg);

      _controller.dispose();
      _controller = WeightSliderController(
        initialWeight: displayValue,
        minWeight: 0,
        interval: 0.1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final displayValue =
    _unit == Unit.kg ? _weightKg : _kgToLb(_weightKg);
    final unitLabel = _unit == Unit.kg ? "kg" : "lb";

    return Column(
            children: [
              TitleWidget.heading(
                "${displayValue.toStringAsFixed(1)} $unitLabel",
                  fontSize: 48,
                  color: AppColor.black,
              ),
              CupertinoSegmentedControl<Unit>(
                padding: const EdgeInsets.symmetric(vertical: 6),
                borderColor: AppColor.black,
                selectedColor: AppColor.black,
                unselectedColor: Colors.white,
                children: {
                  Unit.kg: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: TitleWidget.normal(
                      "Kg",
                      fontSize: 16,
                      color: _unit == Unit.kg ? Colors.white : Colors.black,
                    ),
                  ),
                  Unit.lb: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: TitleWidget.normal(
                      "lbs",
                      fontSize: 16,
                      color: _unit == Unit.lb ? Colors.white : Colors.black,
                    ),
                  ),
                },
                groupValue: _unit,
                onValueChanged: _switchUnit,
              ),

              SizedBox(
                height: 200,
                // width: double.infinity,
                child: Center(
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: VerticalWeightSlider(
                      controller: _controller,
                      decoration: const PointerDecoration(
                        width: 130.0,
                        height: 3.0,
                        largeColor: Color(0xFF898989),
                        mediumColor: Color(0xFFC5C5C5),
                        smallColor: Color(0xFFF0F0F0),
                        gap: 30.0,
                      ),
                      onChanged: (double value) {
                        setState(() {
                          if (_unit == Unit.kg) {
                            _weightKg = value;
                          } else {
                            _weightKg = _lbToKg(value);
                          }
                        });
                      },
                      indicator: RotatedBox(
                        quarterTurns: 1,
                        child: Container(
                          width: 3.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.red[400],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
    );
  }
}
