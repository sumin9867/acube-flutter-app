import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpspro/core/utils/validators/form_validator.dart';
import 'package:gpspro/domain/models/user_model.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/screens/account_section/widget/change_password.dart';
import 'package:gpspro/presentation/screens/account_section/widget/delete_confirmation.dart';
import 'package:gpspro/presentation/screens/account_section/widget/user_profile.dart';
import 'package:gpspro/presentation/screens/vehicle_settings/widget/editable_widget.dart';

class AccountSection extends StatefulWidget {
  final User user;
  const AccountSection({
    super.key,
    required this.user,
  });

  @override
  State<AccountSection> createState() => _AccountSectionState();
}

class _AccountSectionState extends State<AccountSection> {
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9FB),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: Text(
          context.locale.account_settings,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Color.fromRGBO(24, 24, 24, 1)),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserProfile(user: widget.user),
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 10),
            child: Text(
              context.locale.basic_information,
              style: const TextStyle(color: Color.fromRGBO(101, 99, 109, 1), fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),
          EditableField(
            canedit: false,
            controller: _nameController,
            validator: FormValidator.vehicleNameValidator,
            shapeBorder: const Border(
              top: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
            ),
            label: context.locale.your_name,
            value: widget.user.name,
            isVehicleSetting: false,
            leadingIcon: 'person.svg',
            onSave: (newValue) {},
          ),
          EditableField(
            canedit: false,
            shapeBorder: const Border(
              top: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
            ),
            label: context.locale.registered_number,
            value: (widget.user.phone?.isNotEmpty ?? false) ? widget.user.phone! : 'No Number',
            isVehicleSetting: false,
            leadingIcon: 'register_number.svg',
            onSave: (newValue) {},
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 10),
            child: Text(
              context.locale.other_action,
              style: const TextStyle(color: Color.fromRGBO(101, 99, 109, 1), fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
                ),
                color: Colors.white,
              ),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChangePassword(),
                  ));
                },
                leading: SvgPicture.asset(
                  'assets/icons/change_password.svg',
                  color: const Color.fromRGBO(128, 128, 128, 1),
                  height: 16,
                ),
                title: Text(context.locale.changePassword,
                    style: const TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w600, // Closest to 590; Semibold is usually w600
                      fontSize: 16,
                      height: 1.5, // 24 / 16 = 1.5 for line-height
                      letterSpacing: -0.3,
                      color: Color.fromRGBO(24, 24, 24, 1),
                    )),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Text(context.locale.change_password_hint,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400, // Regular = w400
                        fontSize: 14,
                        height: 20 / 14, // line-height divided by font-size = 1.43
                        letterSpacing: 0,
                        color: Color.fromRGBO(101, 99, 109, 1),
                      )),
                ),
              )),
          Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
                ),
                color: Colors.white,
              ),
              child: ListTile(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DeleteConfirmation(
                    userId: widget.user.id,
                  ),
                )),
                leading: SvgPicture.asset(
                  'assets/icons/delete.svg',
                  color: const Color.fromRGBO(217, 61, 66, 1),
                  height: 16,
                ),
                title: Text(context.locale.delete_account,
                    style: const TextStyle(
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w600, // Closest to 590; Semibold is usually w600
                        fontSize: 16,
                        height: 1.5, // 24 / 16 = 1.5 for line-height
                        letterSpacing: -0.3,
                        color: Color.fromRGBO(217, 61, 66, 1))),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Text(context.locale.delete_account_hint,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400, // Regular = w400
                        fontSize: 14,
                        height: 20 / 14, // line-height divided by font-size = 1.43
                        letterSpacing: 0,
                        color: Color.fromRGBO(101, 99, 109, 1),
                      )),
                ),
              ))
        ],
      ),
    );
  }
}
