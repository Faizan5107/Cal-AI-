import 'package:flutter/material.dart';
import 'package:onboarding_flow/theme/colors.dart';
import 'package:onboarding_flow/widgets/title_widget.dart';

import '../gen/assets.gen.dart';

class WeightGainSlider extends StatefulWidget {
  const WeightGainSlider({super.key});

  @override
  _WeightGainSliderState createState() => _WeightGainSliderState();
}

class _WeightGainSliderState extends State<WeightGainSlider> {
  final List<double> values = [
    0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0,
    1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2.0,
    2.1,2.2,2.3,2.4,2.5,2.6,2.7,2.8,2.9,3.0
  ];

  double _currentValue = 0.2;

  String _getTitle(double value) {
    if (value >= 0.2 && value <= 1.0) {
      return "Slow and Steady";
    } else if (value >= 1.1 && value <= 2.0) {
      return "Recommended";
    } else {
      return "You may feel very tired and develop loose skin";
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determine which icon should be active
    bool isPandaActive = _currentValue >= 0.2 && _currentValue <= 1.0;
    bool isRabbitActive = _currentValue >= 1.1 && _currentValue <= 2.0;
    bool isJaguarActive = _currentValue >= 2.1 && _currentValue <= 3.0;

    return SingleChildScrollView( // 👈 prevents overflow
      child: Column(
        children: [
          /// Display selected value
          Text(
            "${_currentValue.toStringAsFixed(1)} lbs",
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          /// Animal icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                Assets.images.panda.path,
                height: 50,
                width: 50,
                color: isPandaActive ? Colors.orange : Colors.grey,
              ),
              Image.asset(
                Assets.images.rabbit.path,
                height: 50,
                width: 50,
                color: isRabbitActive ? Colors.orange : Colors.grey,
              ),
              Image.asset(
                Assets.images.jaguar.path,
                height: 50,
                width: 50,
                color: isJaguarActive ? Colors.orange : Colors.grey,
              ),
            ],
          ),

          /// Slider
          Slider(
            activeColor: AppColor.black,
            value: _currentValue,
            min: 0.2,
            max: 3.0,
            onChanged: (newValue) {
              setState(() {
                _currentValue = double.parse(newValue.toStringAsFixed(1));
              });
            },
          ),

          /// values under slider
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleWidget.normal("0.2 lbs"),
              TitleWidget.normal("1.5 lbs"),
              TitleWidget.normal("3.0 lbs"),
            ],
          ),

          const SizedBox(height: 40),

          Container(
            height: 80,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[300],
            ),
            alignment: Alignment.center,
            child: TitleWidget.normal(_getTitle(_currentValue)), // 👈 fixed
          ),
        ],
      ),
    );
  }
}
