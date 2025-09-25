import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/screens/account_section/widget/confirm_password.dart';

class DeleteConfirmation extends StatefulWidget {
  final int userId;
  const DeleteConfirmation({super.key, required this.userId});

  @override
  State<DeleteConfirmation> createState() => _DeleteConfirmationState();
}

class _DeleteConfirmationState extends State<DeleteConfirmation> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              context.locale.are_you_sure_delete_account,
              style: const TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w600, // Closest to 590: Semibold
                fontSize: 18,
                height: 1.33, // 24 / 18 = 1.33
                letterSpacing: -0.3,
                color: Color.fromRGBO(24, 24, 24, 1), // rgba(24,24,24,1)
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              context.locale.delete_account_warning,
              style: const TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w400, // Regular
                fontSize: 14,
                height: 1.43, // 20 / 14 = ~1.43
                letterSpacing: -0.3,
                color: Color.fromRGBO(100, 100, 100, 1), // rgba(100,100,100,1)
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isChecked ? Colors.blue.shade50 : Colors.white,
                border: Border.all(
                  color: isChecked ? const Color.fromRGBO(1, 121, 230, 0.28) : const Color.fromRGBO(235, 235, 235, 1),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    isChecked ? Icons.check_box : Icons.check_box_outline_blank,
                    color: isChecked ? const Color.fromRGBO(8, 128, 234, 1) : const Color.fromRGBO(235, 235, 235, 1),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      context.locale.accept_delete_terms,
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontWeight: isChecked ? FontWeight.w600 : FontWeight.w400, // Regular
                        fontSize: 14,
                        height: 1.43, // 20 / 14 = 1.428
                        letterSpacing: -0.3,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFFFFF), // #FFFFFF
                  Color(0xFFF9F9F9), // #F9F9F9
                ],
              ),
              border: Border(
                top: BorderSide(
                  color: Color.fromRGBO(241, 241, 241, 1), // border-top color
                  width: 1,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isChecked
                          ? () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ConfirmPassword(
                                  userId: widget.userId,
                                ),
                              ));

                              // Next action here
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        backgroundColor:
                            isChecked ? const Color.fromRGBO(229, 72, 77, 1) : const Color.fromRGBO(37, 0, 73, 0.05),
                        foregroundColor: isChecked ? Colors.white : const Color.fromRGBO(37, 0, 73, 0.05),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        elevation: 0,
                      ),
                      child: Text(context.locale.next,
                          style: const TextStyle(
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w600, // Closest to 590
                            fontSize: 16,
                            height: 1.5, // line-height / font-size => 24 / 16
                            letterSpacing: -0.3,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  // Cancel Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        context.pop();

                        // Cancel action here
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color.fromRGBO(228, 1, 1, 0.22)),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      child: Text(
                        context.locale.cancel,
                        style: const TextStyle(
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w600, // Closest to 590
                            fontSize: 16,
                            height: 1.5, // line-height (24) / font-size (16)
                            letterSpacing: -0.3,
                            color: Color.fromRGBO(229, 72, 77, 1)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //  SizedBox(height: 16)
        ],
      ),
    );
  }
}

class CheckboxWithButtons extends StatefulWidget {
  const CheckboxWithButtons({super.key});

  @override
  State<CheckboxWithButtons> createState() => _CheckboxWithButtonsState();
}

class _CheckboxWithButtonsState extends State<CheckboxWithButtons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Checkbox & Buttons')),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
