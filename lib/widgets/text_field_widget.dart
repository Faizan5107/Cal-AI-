import 'package:flutter/material.dart';

import '../theme/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.textInputAction,
    this.keyboardType,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.onChanged,
    this.readOnly = false,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.contentPadding,
    this.maxLines = 1,
    this.onTap,
  });

  final bool readOnly;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final EdgeInsets? contentPadding;
  final int maxLines;
  final VoidCallback? onTap;

  final border = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColor.black),
    borderRadius: BorderRadius.circular(8),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      cursorColor: Colors.black,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines,
      onTap: onTap,
      style: const TextStyle(color: AppColor.black, fontSize: 12),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black26,
          fontSize: 12,
        ),
        filled: true,
        fillColor: AppColor.lightBg,
        errorBorder: border.copyWith(
          borderSide: const BorderSide(
            color: AppColor.black,
            width: 1,
          ),
        ),
        suffixIcon: suffixIcon,
        suffixIconConstraints: suffixIconConstraints,
        prefixIconConstraints: prefixIconConstraints,
        prefixIcon: prefixIcon,
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        contentPadding: () {
          if (contentPadding != null) return contentPadding;
          return const EdgeInsets.all(16);
        }(),
      ),
    );
  }
}

class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.textInputAction,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  @override
  State createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  var isShow = true;

  final border = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColor.lightBg),
    borderRadius: BorderRadius.circular(8),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      validator: widget.validator,
      obscureText: isShow,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      style: const TextStyle(color: AppColor.black, fontSize: 12),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: AppColor.black,
        ),
        filled: true,
        fillColor: AppColor.lightBg,
        errorBorder: border.copyWith(
          borderSide: const BorderSide(
            color: AppColor.black,
            width: 1,
          ),
        ),
        focusedBorder: border,
        enabledBorder: border,
        border: border,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            isShow = !isShow;
            setState(() {});
          },
          icon: Icon(
            !isShow ? Icons.visibility_rounded : Icons.visibility_off_rounded,
            color: AppColor.black,
          ),
        ),
      ),
    );
  }
}