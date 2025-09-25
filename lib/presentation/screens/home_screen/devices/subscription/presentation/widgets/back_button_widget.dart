import 'package:flutter/material.dart';

class BottomButtons extends StatefulWidget {
  final VoidCallback onCancel;
  final String finalAmount;
  final Future<void> Function() onContinue; // 👈 change here

  const BottomButtons({
    super.key,
    required this.onCancel,
    required this.onContinue,
    required this.finalAmount,
  });

  @override
  State<BottomButtons> createState() => _BottomButtonsState();
}

class _BottomButtonsState extends State<BottomButtons> {
  bool _isLoading = false;

  Future<void> _handleContinue() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    try {
      await widget.onContinue(); // 👈 now we await
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: _isLoading ? null : _handleContinue,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(8, 128, 234, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: _isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Text(
                  'Pay Rs. ${widget.finalAmount}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
        ),
      ),
    );
  }
}
