import 'package:flutter/material.dart';
import 'package:onboarding_flow/theme/colors.dart';
import 'package:onboarding_flow/widgets/animation.dart';
import 'package:onboarding_flow/widgets/title_widget.dart';

class SelectableTile extends StatefulWidget {
  final String title;
  String? subtitle;
  final bool isSelected;
  final VoidCallback onTap;
  final String image;
  final double height;

  SelectableTile({
    super.key,
    required this.title,
    this.subtitle,
    this.height = 90,
    required this.isSelected,
    required this.onTap,
    required this.image,
  });

  @override
  State<SelectableTile> createState() => _SelectableTileState();
}

class _SelectableTileState extends State<SelectableTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.0,
      upperBound: 0.1,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward(); // shrink
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse(); // bounce back
    widget.onTap();
  }

  void _onTapCancel() {
    _controller.reverse(); // reset if canceled
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color selectedBg = Colors.black;
    final Color selectedText = Colors.white;
    final Color unselectedBg = Colors.grey.shade100;
    final Color unselectedText = Colors.black;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context,child){
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            // height: height,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: widget.isSelected ? selectedBg : AppColor.inactiveColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: widget.isSelected ? Colors.black : AppColor.inactiveBorder,
                width: 2,
              ),
            ),
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.image.isNotEmpty
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        widget.image,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    )
                    : Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                        color:
                            widget.isSelected ? Colors.white : Colors.transparent,
                      ),
                      child:
                          widget.isSelected
                              ? const Icon(
                                Icons.check,
                                size: 16,
                                color: Colors.black,
                              )
                              : null,
                    ),
        
                const SizedBox(width: 12),
        
                if (widget.subtitle == null)
                  Expanded(
                    child: Center(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TitleWidget.normal(
                          widget.title,
                          align: TextAlign.start,
                          fontSize: 18,
                          color: widget.isSelected ? selectedText : unselectedText,
                        ),
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TitleWidget.normal(
                          widget.title,
                          align: TextAlign.start,
                          fontSize: 18,
                          color: widget.isSelected ? selectedText : unselectedText,
                        ),
                        TitleWidget.subtitle(
                          widget.subtitle!,
                          align: TextAlign.start,
                          color:
                              widget.isSelected
                                  ? selectedText.withOpacity(0.8)
                                  : unselectedText,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );}
      ),
    );
  }
}
