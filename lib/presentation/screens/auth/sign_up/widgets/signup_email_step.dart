import 'package:flutter/material.dart';
import 'package:gpspro/core/utils/validators/validators.dart';
import 'package:gpspro/presentation/global_widgets/generic_textfield_newfield.dart';

class SignupEmailStep extends StatelessWidget {
  final TextEditingController controller;

  const SignupEmailStep({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GenericTextfieldNew(
      label: 'Mobile Number or Email',
      hintText: 'Mobile Number or Email',
      controller: controller,
      validator: FormValidator.loginUserNameEmailValidation,
    );
  }
}
