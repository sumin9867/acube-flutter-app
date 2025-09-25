import 'package:flutter/material.dart';

class AddGeofenceTextField extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool enabled;

  const AddGeofenceTextField({
    super.key,
    required this.label,
    this.controller,
    this.validator,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = enabled;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: isActive
          ? const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(232, 239, 252, 1),
                  blurRadius: 6,
                  spreadRadius: 1,
                  offset: Offset(0, 0),
                ),
              ],
            )
          : null,
      child: Container(
        decoration: BoxDecoration(
          color:
              isActive ? const Color.fromRGBO(2, 128, 255, 0.07) : const Color(0xFFF1F1F1), // Light gray for disabled
          borderRadius: BorderRadius.circular(12),
          border: isActive
              ? Border.all(
                  color: const Color.fromRGBO(0, 145, 255, 1),
                  width: 1,
                )
              : null,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: isActive ? const Color.fromRGBO(8, 128, 234, 1) : Colors.grey.shade600,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextFormField(
              controller: controller,
              validator: validator,
              enabled: enabled,
              decoration: const InputDecoration(
                isDense: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isActive ? const Color.fromRGBO(24, 24, 24, 1) : Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditableGeofenceField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;

  const EditableGeofenceField({
    super.key,
    required this.label,
    this.controller,
  });

  @override
  State<EditableGeofenceField> createState() => _EditableGeofenceFieldState();
}

class _EditableGeofenceFieldState extends State<EditableGeofenceField> {
  bool _isEditing = false;

  void _toggleEdit() {
    setState(() {
      _isEditing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isEditing
        ? AddGeofenceTextField(
            label: widget.label,
            controller: widget.controller,
          )
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration:
                BoxDecoration(color: const Color.fromRGBO(241, 241, 241, 1), borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              title: Text(
                widget.label,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(100, 100, 100, 1),
                  fontSize: 16,
                ),
              ),
              onTap: _toggleEdit,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
  }
}
