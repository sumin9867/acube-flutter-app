import 'package:flutter/material.dart';
import 'package:gpspro/presentation/global_widgets/customized_textbox.dart';

class GenericTextfieldNew extends StatefulWidget {
  const GenericTextfieldNew({
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
    this.onValidationChanged,
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
  final ValueChanged<bool>? onValidationChanged;

  @override
  State<GenericTextfieldNew> createState() => _GenericTextfieldNewState();
}

class _GenericTextfieldNewState extends State<GenericTextfieldNew> {
  late FocusNode _focusNode;
  String? errorMessage;
  late bool _obscureText;
  bool _hasInteracted = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _obscureText = widget.obscureText;

    _focusNode.addListener(() {
      setState(() {});

      if (!_focusNode.hasFocus && _hasInteracted) {
        _validate(widget.controller?.text);
      }
    });

    widget.controller?.addListener(() {
      if (!_hasInteracted && widget.controller!.text.isNotEmpty) {
        setState(() {
          _hasInteracted = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _validate(String? value) {
    final result = widget.validator?.call(value);
    final hasError = result != null;

    setState(() {
      errorMessage = result;
    });

    widget.onValidationChanged?.call(!hasError);
  }

  @override
  Widget build(BuildContext context) {
    final isFocused = _focusNode.hasFocus;
    final hasError = errorMessage != null;
    final errorColor = const Color.fromRGBO(217, 61, 66, 1);
    final focusColor = const Color.fromRGBO(0, 145, 255, 1);
    final errorFillColor = const Color.fromRGBO(255, 230, 230, 1);
    final focusFillColor = const Color.fromRGBO(224, 240, 255, 1);
    final normalFillColor = const Color.fromRGBO(241, 241, 241, 1);

    return BoxedLabelIn(
      enableInteractiveSelection: true,
      autofocus: true,
      focusNode: _focusNode,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      readOnly: widget.readOnly,
      obscureText: _obscureText,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: (value) {
        final error = widget.validator?.call(value);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            errorMessage = error;
          });
        });
        return error;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        fillColor: hasError
            ? errorFillColor
            : isFocused
                ? focusFillColor
                : normalFillColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: hasError ? errorColor : focusColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: errorColor, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: errorColor, width: 1),
        ),
        hintText: widget.hintText,
        labelText: widget.label,
        floatingLabelStyle: TextStyle(
          color: hasError ? errorColor : focusColor,
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w600,
          fontSize: 14,
          height: 16 / 12,
          letterSpacing: 0.3,
        ),
        labelStyle: TextStyle(
          color: hasError ? errorColor : Colors.black,
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w400,
        ),
        errorStyle: TextStyle(
          color: errorColor,
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w600,
          fontSize: 12,
          height: 16 / 12,
          letterSpacing: 0.3,
        ),
        hintStyle: TextStyle(
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 1.5,
          letterSpacing: -0.3,
          color: isFocused
              ? Colors.transparent
              : hasError
                  ? errorColor
                  : const Color.fromRGBO(100, 100, 100, 1),
        ),
        prefixIcon: widget.prefixIcon,
        prefix: widget.prefix,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffixIcon,
        suffix: widget.suffix,
        contentPadding: const EdgeInsets.only(left: 12, top: 10),
        errorText: errorMessage,
      ),
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }
}
