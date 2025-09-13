import 'package:flutter/material.dart';
import 'package:onboarding_flow/widgets/title_widget.dart';

import '../theme/colors.dart';

class MeasurementSelector extends StatefulWidget {
  final String label;
  final String unit;
  final List<String> values;
  final int initialSelectedItemIndex;
  final ValueChanged<int> onSelectedItemChanged;

  const MeasurementSelector({
    required this.label,
    required this.unit,
    required this.values,
    required this.initialSelectedItemIndex,
    required this.onSelectedItemChanged,
  });

  @override
  State<MeasurementSelector> createState() => _MeasurementSelectorState();
}

class _MeasurementSelectorState extends State<MeasurementSelector> {
  late FixedExtentScrollController _scrollController;
  int _selectedItemIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedItemIndex = widget.initialSelectedItemIndex;
    _scrollController = FixedExtentScrollController(
      initialItem: widget.initialSelectedItemIndex,
    );
  }

  @override
  void didUpdateWidget(covariant MeasurementSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialSelectedItemIndex != oldWidget.initialSelectedItemIndex &&
        _scrollController.hasClients) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _scrollController.animateToItem(
            widget.initialSelectedItemIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget.heading(
          widget.label,
          fontSize: 20,
          align: TextAlign.center,
        ),
        SizedBox(
          height: 300,
          width: 100,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 90,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              ListWheelScrollView.useDelegate(
                controller: _scrollController,
                itemExtent: 50,
                perspective: 0.005,
                physics: const BouncingScrollPhysics(),
                onSelectedItemChanged: (index) {
                  setState(() {
                    _selectedItemIndex = index;
                  });
                  widget.onSelectedItemChanged(index);
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    final isSelected = index == _selectedItemIndex;
                    return Center(
                      child: TitleWidget.normal(
                        '${widget.values[index]} ${widget.unit}',
                        fontSize: 16,
                        color: isSelected ? AppColor.black : Colors.black54,
                      ),
                    );
                  },
                  childCount: widget.values.length,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
