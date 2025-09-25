import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/app_config/app_config.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/domain/arguments/web_arguments.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_dialog.dart';
import 'package:gpspro/presentation/screens/home_screen/preferences/widgets/user_card.dart';
import 'package:gpspro/presentation/screens/home_screen/welcome_screen.dart';
import 'package:gpspro/router/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceScreen extends StatelessWidget {
  const PreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rootContext = Navigator.of(context, rootNavigator: true).context;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: false,
            snap: false,
            elevation: 0,
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 16, bottom: 12),
              title: Text(
                context.locale.label_preference,
                style: TextStyle(
                  color: context.colorScheme.primary,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 24,
                  height: 24 / 18,
                  letterSpacing: -0.3,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return state.maybeWhen(
                  authenticated: (user) => UserCard(user: user),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 10, top: 14),
              child: Text(
                context.locale.label_general,
                style: const TextStyle(
                  color: Color.fromRGBO(101, 99, 109, 1),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _CustomListTile(
                  shapeBorder: const Border(
                    top: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
                  ),
                  label: context.locale.addNewDeviceLabel,
                  value: context.locale.addNewDeviceValue,
                  leadingIcon: 'add_device',
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      context: rootContext,
                      builder: (context) {
                        return const QrScreenInit(
                          isFirstTime: false,
                        );
                      },
                    );
                  },
                  canedit: true,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 10, top: 20),
              child: Text(
                context.locale.label_device_related_actions,
                style: const TextStyle(
                  color: Color.fromRGBO(101, 99, 109, 1),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _CustomListTile(
                  shapeBorder: const Border(
                    bottom: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
                  ),
                  label: context.locale.manageSubscriptionsLabel,
                  value: context.locale.manageSubscriptionsValue,
                  leadingIcon: 'crown',
                  onTap: () {
                    RouteHelper.pushSubscriptionPage();
                  },
                  canedit: true,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 10, top: 20),
              child: Text(
                context.locale.more,
                style: const TextStyle(
                  color: Color.fromRGBO(101, 99, 109, 1),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _CustomListTile(
                  shapeBorder: const Border(
                    top: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
                  ),
                  label: context.locale.notificationSettings,
                  value: context.locale.settingsValue,
                  height: 20,
                  leadingIcon: 'bell',
                  onTap: () {
                    RouteHelper.pushNotificationSettingsPage();
                  },
                  canedit: true,
                ),
                _CustomListTile(
                  label: 'Terms and Conditions',
                  value: 'Read the rules and guidelines',
                  leadingIcon: 'file-lock',
                  height: 20,
                  onTap: () {
                    RouteHelper.pushWebViewPage(
                      WebViewRouteParams(
                        'Terms and Conditions',
                        locator.get<AppConfig>().configModel.termsAndConditionUrl,
                      ),
                    );
                  },
                  canedit: true,
                ),
                _CustomListTile(
                  label: 'Privacy and Policy',
                  value: 'Understand how we protect your data',
                  leadingIcon: 'shield',
                  height: 20,
                  onTap: () {
                    RouteHelper.pushWebViewPage(
                      WebViewRouteParams(
                        'Privacy Policy',
                        locator.get<AppConfig>().configModel.privacyPolicyUrl,
                      ),
                    );
                  },
                  canedit: true,
                ),
                _CustomListTile(
                  shapeBorder: const Border(
                    bottom: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
                  ),
                  label: context.locale.helpSupportLabel,
                  value: context.locale.helpSupportValue,
                  leadingIcon: 'support_agent',
                  onTap: () {
                    RouteHelper.pushCustomerCareLandingPage();
                  },
                  canedit: true,
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: _CustomListTile(
              shapeBorder: const Border(
                bottom: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
              ),
              label: context.locale.logout,
              value: context.locale.desc_logout,
              leadingIcon: 'logout',
              onTap: () {
                showLockEngineDialog(context);
              },
              canedit: false,
              isLoggedOut: true,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}

void showLockEngineDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 1, 1, 0.06), borderRadius: BorderRadius.circular(14)),
                child: SvgPicture.asset(
                  'assets/icons/logout.svg',
                  height: 24,
                  color: const Color.fromRGBO(229, 72, 77, 1),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Logout?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  height: 24 / 18,
                  letterSpacing: -0.3,
                  color: Color.fromRGBO(24, 24, 24, 1),
                ),
              ),
              const SizedBox(height: 12),
              const Text('Are you sure you want to logout?',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    height: 24 / 16,
                    letterSpacing: -0.3,
                    color: Color.fromRGBO(100, 100, 100, 1),
                  )),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        context.locale.cancel,
                        style: const TextStyle(
                          color: Color.fromRGBO(24, 24, 24, 1),
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          height: 24 / 16,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();

                        await prefs.remove('profilePicId');

                        locator<AuthCubit>().requestUnAuthentication();

                        locator<AppRouter>().pop();
                        locator<AppRouter>().go(RouteConstant.signin);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(217, 61, 66, 1),
                        shadowColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SF Pro',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> logout(BuildContext context) async {
  await AppDialogs.showConfirmation(
    title: context.locale.logout,
    content: context.locale.desc_logout_confirmation,
    onYes: () async {},
  );
}

class MenuCategoryTile extends StatelessWidget {
  const MenuCategoryTile({
    super.key,
    required this.title,
    required this.icon,
    required this.menuList,
    this.initiallyExpanded = true,
  });

  final String title;
  final Widget icon;
  final List<MenuTile> menuList;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ExpansionTile(
        initiallyExpanded: initiallyExpanded,
        collapsedBackgroundColor: context.colorScheme.primaryContainer.withOpacity(0.6),
        backgroundColor: context.colorScheme.primaryContainer.withOpacity(0.4),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        leading: Container(
          height: 34,
          width: 34,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: context.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: IconTheme(
            data: IconThemeData(
              color: context.theme.colorScheme.primary,
            ),
            child: icon,
          ),
        ),
        title: Text(
          title,
          style: context.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height * .017),
        ),
        tilePadding: const EdgeInsets.symmetric(horizontal: 12.0),
        children: menuList
            .map(
              (menu) => MenuTile(
                icon: menu.icon,
                label: menu.label,
                onPressed: menu.onPressed,
              ),
            )
            .toList(),
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  const MenuTile({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.comfortable,
      leading: SizedBox(
        height: 34,
        width: 34,
        child: Icon(icon),
      ),
      trailing: const Icon(Icons.chevron_right_rounded),
      title: Text(
        label,
        style: context.textTheme.titleMedium?.copyWith(fontSize: MediaQuery.of(context).size.height * .017),
      ),
      onTap: onPressed,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String label;
  final bool? isLoggedOut;
  final bool canedit;
  final String value;
  final double? height;
  final String leadingIcon;
  final Border? shapeBorder;
  final VoidCallback onTap;

  const _CustomListTile({
    required this.label,
    required this.canedit,
    required this.value,
    required this.leadingIcon,
    this.shapeBorder,
    required this.onTap,
    this.isLoggedOut = false,
    this.height = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: shapeBorder,
        color: Colors.white,
      ),
      child: ListTile(
        onTap: onTap,
        leading: SvgPicture.asset(
          'assets/icons/$leadingIcon.svg',
          color: isLoggedOut! ? const Color.fromRGBO(229, 72, 77, 1) : const Color.fromRGBO(128, 128, 128, 1),
          height: height,
        ),
        title: Text(label,
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: 15,
              height: 20 / 14,
              letterSpacing: -0.3,
              color: isLoggedOut! ? const Color.fromRGBO(217, 61, 66, 1) : const Color.fromRGBO(24, 24, 24, 1),
            )),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Text(value,
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                height: 20 / 14,
                letterSpacing: -0.3,
                color: isLoggedOut! ? const Color.fromRGBO(217, 61, 66, 1) : const Color.fromRGBO(100, 100, 100, 1),
              )),
        ),
        trailing: canedit
            ? const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
              )
            : null,
      ),
    );
  }
}
