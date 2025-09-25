import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditableField extends StatefulWidget {
  final String label;
  final bool canedit;
  final String value;
  final String leadingIcon;
  final Border shapeBorder;
  final Function(String) onSave;
  final bool isVehicleSetting; // ✅ New flag
  final String? Function(String?)? validator;
  final TextEditingController? controller; // ✅ Controller from parent

  const EditableField({
    super.key,
    required this.label,
    required this.value,
    required this.leadingIcon,
    required this.onSave,
    required this.shapeBorder,
    this.controller,
    this.canedit = true,
    this.isVehicleSetting = true, // default true
    this.validator,
  });

  @override
  State<EditableField> createState() => _EditableFieldState();
}

class _EditableFieldState extends State<EditableField> {
  bool isEditing = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _rawValue = '';

  @override
  void initState() {
    super.initState();
    _rawValue = _extractRawValue(widget.value);
    if (widget.controller != null) {
      widget.controller!.text = _rawValue;
    }
  }

  @override
  void didUpdateWidget(covariant EditableField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update raw value and controller text if widget.value changes externally
    if (oldWidget.value != widget.value) {
      _rawValue = _extractRawValue(widget.value);
      if (widget.controller != null && !isEditing) {
        widget.controller!.text = _rawValue;
      }
    }
  }

  // Helper to remove 'km/l', 'N/A' etc and get raw number as string
  String _extractRawValue(String value) {
    if (value.toLowerCase() == 'n/a' || value.trim().isEmpty) {
      return '';
    }
    // Remove units for mileage and speed
    return value.replaceAll(RegExp(r'km\/l|km\/h', caseSensitive: false), '').trim();
  }

  String get displayValue {
    final lowerLabel = widget.label.toLowerCase();

    if (lowerLabel.contains('mileage')) {
      if (_rawValue.isEmpty) {
        return 'N/A';
      } else {
        return '$_rawValue km/l';
      }
    } else if (lowerLabel.contains('speed')) {
      if (_rawValue.isEmpty) {
        return 'N/A';
      } else {
        return '$_rawValue km/h';
      }
    }

    return widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isEditing)
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: widget.shapeBorder,
              color: Colors.white,
            ),
            child: ListTile(
              leading: SvgPicture.asset(
                widget.isVehicleSetting
                    ? 'assets/icons/vehicle_setting/${widget.leadingIcon}' // Vehicle setting path
                    : 'assets/icons/${widget.leadingIcon}', // Alternate path when not vehicle setting
                color: const Color.fromRGBO(128, 128, 128, 1),
                height: 16,
              ),
              title: Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(100, 100, 100, 1),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Text(
                  displayValue,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(24, 24, 24, 1),
                  ),
                ),
              ),
              trailing: widget.canedit
                  ? GestureDetector(
                      onTap: () {
                        // When starting to edit, use raw value only
                        if (widget.controller != null) {
                          widget.controller!.text = _rawValue;
                        }
                        setState(() => isEditing = true);
                      },
                      child: Container(
                          padding: const EdgeInsets.all(20),
                          child: SvgPicture.asset('assets/icons/vehicle_setting/edit.svg')),
                    )
                  : null,
            ),
          )
        else
          Container(
            decoration: BoxDecoration(
              border: widget.shapeBorder,
            ),
            child: Form(
              key: _formKey,
              child: ListTile(
                leading: SvgPicture.asset('assets/icons/vehicle_setting/${widget.leadingIcon}'),
                title: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(232, 239, 252, 1),
                        blurRadius: 6,
                        spreadRadius: 1,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(2, 128, 255, 0.07),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color.fromRGBO(0, 145, 255, 1),
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.label,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color.fromRGBO(8, 128, 234, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextFormField(
                          controller: widget.controller,
                          validator: widget.validator,
                          keyboardType: widget.label.toLowerCase().contains('mileage')
                              ? TextInputType.number
                              : TextInputType.text,
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            hintText: '', // you can put a hint here if you want
                          ),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(24, 24, 24, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        final needsValidation = widget.validator != null;
                        if (!needsValidation || (_formKey.currentState?.validate() ?? true)) {
                          // If empty for mileage, save as 0
                          String newValue = widget.controller!.text.trim();
                          if (widget.label.toLowerCase().contains('mileage') && newValue.isEmpty) {
                            newValue = '0';
                            widget.controller!.text = newValue;
                          }
                          widget.onSave(newValue);
                          _rawValue = newValue;
                          setState(() => isEditing = false);
                        }
                      },
                      child: SvgPicture.asset('assets/icons/vehicle_setting/ok.svg'),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        // Cancel editing: revert controller text to raw value
                        if (widget.controller != null) {
                          widget.controller!.text = _rawValue;
                        }
                        setState(() => isEditing = false);
                      },
                      child: SvgPicture.asset('assets/icons/vehicle_setting/cancell.svg'),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
