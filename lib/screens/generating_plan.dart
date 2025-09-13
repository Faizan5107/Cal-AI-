import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onboarding_flow/theme/colors.dart';
import 'package:onboarding_flow/widgets/title_widget.dart';

import '../widgets/custom_progress.dart';

class GeneratingPlan extends StatefulWidget {
  const GeneratingPlan.route(BuildContext context,
      GoRouterState state, {super.key});

  @override
  _GeneratingPlanState createState() => _GeneratingPlanState();
}

class _GeneratingPlanState extends State<GeneratingPlan> {
  double _progress = 0.0;
  String _statusText = 'Customizing health plan...';
  List<String> _items = ['Calories', 'Carbs', 'Protein', 'Fats', 'Health score'];
  List<bool> _checkedItems = [false, false, false, false, false];

  @override
  void initState() {
    super.initState();
    _startSetupSequence();
  }

  void _startSetupSequence() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _progress = 0.21;
    });

    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      _progress = 0.48;
      _statusText = 'Applying BMR formula...';
      _checkedItems[0] = true;
      _checkedItems[1] = true;
    });

    await Future.delayed(const Duration(milliseconds: 1500));
    setState(() {
      _progress = 0.74;
      _statusText = 'Estimating your metabolic age...';
      _checkedItems[2] = true;
    });

    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      _progress = 0.98;
      _statusText = 'Finalizing results...';
      _checkedItems[3] = true;
      _checkedItems[4] = true;
    });

    await Future.delayed(const Duration(milliseconds: 1500));
    _showResultsScreen();
  }

  void _showResultsScreen() {
    setState(() {
      _progress = 1.0;
      _statusText = 'Congratulations!\nyour custom plan is ready!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TitleWidget.heading(
                '${(_progress * 100).toInt()}%',
                fontSize: 64,
                align: TextAlign.center,
              ),
              const SizedBox(height: 8),
              TitleWidget.heading(
                'We\'re setting everything up for you',
                fontSize: 32,
                align: TextAlign.center,
              ),
              const SizedBox(height: 32),
              CustomGradientProgressBar(progress: _progress),
              const SizedBox(height: 16),
              TitleWidget.subtitle(
                _statusText,
                fontSize: 16,
                align: TextAlign.center,
              ),
              const SizedBox(height: 48),
              _buildDailyRecommendationCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDailyRecommendationCard() {
    return Card(
      color: AppColor.black,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             TitleWidget.normal(
              'Daily recommendation for',
              fontSize: 18,
               color: Colors.white
            ),
            const SizedBox(height: 16),
            ...List.generate(_items.length, (index) {
              return ListTile(
                dense: true,
                minLeadingWidth: 0,
                visualDensity: VisualDensity.compact,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.circle, size: 4,color: Colors.white,),
                title: TitleWidget.subtitle(_items[index],color: Colors.white,fontSize: 14),
                trailing: AnimatedOpacity(
                  opacity: _checkedItems[index] ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: const Icon(Icons.check_circle, color: Colors.white,size: 20,),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}