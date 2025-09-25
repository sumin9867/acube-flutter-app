import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/core/utils/helpers/app_helper.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_cubit/websocket/websocket_cubit.dart';
import 'package:gpspro/presentation/global_widgets/app_dialog.dart';
import 'package:gpspro/presentation/global_widgets/app_text.dart';
import 'package:gpspro/presentation/screens/anti_theft/cubit/vehicle_anti_theft_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/app_scaffold.dart';
import 'package:gpspro/presentation/wrappers/header_footer_wrapper.dart';
import 'package:gpspro/theme/app_colors.dart';

class VehicleAntiTheftPage extends StatefulWidget {
  const VehicleAntiTheftPage({
    super.key,
    required this.vehicle,
  });

  final Device vehicle;

  @override
  State<VehicleAntiTheftPage> createState() => _VehicleAntiTheftPageState();
}

class _VehicleAntiTheftPageState extends State<VehicleAntiTheftPage> {
  final webSocketCubit = locator.get<WebsocketCubit>();

  @override
  void initState() {
    webSocketCubit.disconnect();
    super.initState();
  }

  @override
  void dispose() {
    webSocketCubit.reconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          locator.get<VehicleAntiTheftCubit>()..initialize(widget.vehicle),
      child: AppStackScafold(
        title: context.locale.antitheft,
        includeTopMargin: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: HeaderFooterWrapper(
            footer: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: BlocBuilder<VehicleAntiTheftCubit, VehicleAntiTheftState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const SizedBox.shrink(),
                    idle: (isAntiTheftEnabled) => ToggleButtons(
                      borderRadius: BorderRadius.circular(25),
                      selectedColor: AppColors.white,
                      selectedBorderColor:
                          isAntiTheftEnabled ? AppColors.green : AppColors.red,
                      fillColor:
                          isAntiTheftEnabled ? AppColors.green : AppColors.red,
                      color:
                          isAntiTheftEnabled ? AppColors.red : AppColors.green,
                      constraints: const BoxConstraints(
                        minHeight: 50.0,
                        minWidth: 100.0,
                      ),
                      isSelected: [
                        isAntiTheftEnabled,
                        !isAntiTheftEnabled,
                      ],
                      onPressed: (index) {
                        if (isAntiTheftEnabled && index == 0 ||
                            !isAntiTheftEnabled && index == 1) {
                          return;
                        }
                        AppDialogs.showConfirmation(
                          title: context.locale.antitheft,
                          content:
                              'Are you sure want to ${isAntiTheftEnabled ? 'OFF' : 'ON'} the anti-theft mode?',
                          onYes: () {
                            context.pop();
                            context
                                .read<VehicleAntiTheftCubit>()
                                .toggleAntiTheft();
                          },
                        );
                      },
                      textStyle: context.textTheme.titleLarge,
                      children: [
                        Text(context.locale.on.toUpperCase()),
                        Text(context.locale.off.toUpperCase()),
                      ],
                    ),
                  );
                },
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 22),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: AppHelper.getVehicleImage(widget.vehicle).image(
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  AppText(
                    widget.vehicle.name.toUpperCase(),
                    style: context.textTheme.displaySmall?.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppText(
                            '${context.locale.important}!',
                            style: context.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      AppText(
                        context.locale.antitheftImportantMessage,
                        style: context.textTheme.bodyMedium?.copyWith(),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
