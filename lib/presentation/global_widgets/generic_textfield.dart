import 'package:flutter/material.dart';
import 'package:gpspro/theme/app_colors.dart';

class GenericTextfield extends StatelessWidget {
  const GenericTextfield({
    super.key,
    this.controller,
    required this.label,
    required this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.readOnly = false,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.suffix,
    this.obscureText = false,
    this.validator,
    this.onFieldSubmitted,
    this.textlabelshow = true,
  });

  final TextEditingController? controller;
  final String label;
  final String hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Widget? suffix;
  final bool obscureText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final bool? textlabelshow;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            label: Text(hintText),
            hintText: textlabelshow! ? hintText : '',
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(9),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 16,
            ),
            prefixIcon: prefixIcon,
            prefix: prefix,
            suffixIcon: suffixIcon,
            suffix: suffix,
          ),
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          readOnly: readOnly,
          obscureText: obscureText,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
