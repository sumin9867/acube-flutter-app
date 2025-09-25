import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/core/utils/helpers/app_helper.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_cubit/websocket/websocket_cubit.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/presentation/global_widgets/loading_widgets.dart';
import 'package:gpspro/presentation/global_widgets/trackon_appbar.dart';
import 'package:gpspro/presentation/screens/engine_lock/cubit/engine_lock_cubit.dart';

class VehicleEngineLockPage extends StatefulWidget {
  const VehicleEngineLockPage({
    super.key,
    required this.vehicle,
  });

  final Device vehicle;

  @override
  State<VehicleEngineLockPage> createState() => _VehicleEngineLockPageState();
}

class _VehicleEngineLockPageState extends State<VehicleEngineLockPage> {
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

  bool get isStopped => (widget.vehicle.status == DeviceStatus.online &&
      (widget.vehicle.position?.attributes?.ignition == null ||
          widget.vehicle.position!.attributes!.ignition == false));

  bool get isOnline => widget.vehicle.status == DeviceStatus.online && !isStopped;

  @override
  Widget build(BuildContext context) {
    return BlocListener<EngineLockCubit, EngineLockState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {
            dismissLoadingDialog(context);

            AppToast.showError(context: context, message: context.locale.unexpectedError);
          },
          locking: (message) {
            showLoadingDialog(context, message, false);
          },
          lockSuccess: (message) {
            context.pop();
            dismissLoadingDialog(context);
            AppToast.showSuccess(context: context, message: message);
          },
          unlockSuccess: (message) {
            context.pop();
            dismissLoadingDialog(context);
            AppToast.showSuccess(context: context, message: message);
          },
          unlocking: (message) {
            showLoadingDialog(context, message, false);
          },
          error: (message) {
            context.pop();

            dismissLoadingDialog(context);

            AppToast.showError(context: context, message: message);
          },
        );
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
        appBar: TrackonAppbar(
          text: context.locale.engineLockTitle,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 14),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: isOnline ? const Color.fromRGBO(255, 115, 1, 0.43) : const Color.fromRGBO(1, 147, 55, 0.29),
                  ),
                  color: isOnline ? const Color.fromRGBO(255, 145, 1, 0.17) : const Color.fromRGBO(2, 186, 60, 0.09),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/vehicle.svg',
                      color: isOnline ? const Color.fromRGBO(247, 104, 8, 1) : const Color.fromRGBO(41, 151, 100, 1),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${context.locale.vehicleStatusLabel}${!isOnline ? context.locale.stopped : context.locale.running}',
                            style: TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              height: 24 / 16,
                              letterSpacing: -0.3,
                              color: isOnline
                                  ? const Color.fromRGBO(247, 104, 8, 1)
                                  : const Color.fromRGBO(41, 151, 100, 1),
                            ),
                          ),
                          const SizedBox(height: 4),
                          if (!isOnline)
                            Text(
                              'Vehicle is parked - Safe to lock Engine',
                              style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height: 20 / 14,
                                letterSpacing: -0.3,
                                color: isOnline
                                    ? const Color.fromRGBO(247, 104, 8, 1)
                                    : const Color.fromRGBO(41, 151, 100, 1),
                              ),
                            ),
                          const SizedBox(height: 2),
                          if (isOnline)
                            Text(
                              'Engine lock will work if vehicle speed is within a safe threshold; otherwise, the command will be queued.',
                              style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height: 20 / 14,
                                letterSpacing: -0.3,
                                color: isOnline
                                    ? const Color.fromRGBO(247, 104, 8, 1)
                                    : const Color.fromRGBO(41, 151, 100, 1),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: AppHelper.getVehicleImage(widget.vehicle).image(
                  fit: BoxFit.contain,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.vehicle.name.toUpperCase(),
                style: const TextStyle(
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  height: 24 / 18,
                  letterSpacing: -0.3,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/engine_location.svg',
                    height: 20,
                    width: 20,
                  ),
                  Text(
                    (widget.vehicle.position?.address ?? '').toUpperCase(),
                    style: const TextStyle(
                      color: Color.fromRGBO(100, 100, 100, 1),
                      fontSize: 15,
                      height: 20 / 14,
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: const Color.fromRGBO(255, 115, 1, 0.43)),
                  color: const Color.fromRGBO(255, 145, 1, 0.17),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/icons/alert-triangle.svg'),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.locale.importantNotice,
                            style: const TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              height: 24 / 16,
                              letterSpacing: -0.3,
                              color: Color.fromRGBO(237, 95, 0, 1),
                            ),
                          ),
                          Text(
                            context.locale.importantNoticeLine1,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            style: const TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              height: 20 / 14,
                              letterSpacing: -0.3,
                              color: Color.fromRGBO(237, 95, 0, 1),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            context.locale.importantNoticeLine2,
                            style: const TextStyle(
                              fontFamily: 'SF Pro',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              height: 20 / 14,
                              letterSpacing: -0.3,
                              color: Color.fromRGBO(237, 95, 0, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        return showLockEngineDialog(context, widget.vehicle.name, true);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(41, 151, 100, 1),
                        shadowColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/engine_unlock.svg',
                            height: 20,
                            width: 20,
                            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            context.locale.unlockEngine,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SF Pro',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        return showLockEngineDialog(context, widget.vehicle.name, false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(217, 61, 66, 1),
                        shadowColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/engine_lock.svg',
                            height: 20,
                            width: 20,
                            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            context.locale.lockEngine,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SF Pro',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                context.locale.realtimeStatusNote,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  height: 20 / 14,
                  letterSpacing: -0.3,
                  color: Color.fromRGBO(141, 141, 141, 1),
                ),
              ),
              Text(
                context.locale.realtimeStatusNoteRefresh,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  height: 20 / 14,
                  letterSpacing: -0.3,
                  color: Color.fromRGBO(141, 141, 141, 1),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  void showLockEngineDialog(BuildContext context, String vehicleName, bool isUnlock) {
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
                      color: isUnlock ? const Color.fromRGBO(2, 186, 60, 0.09) : const Color.fromRGBO(255, 1, 1, 0.06),
                      borderRadius: BorderRadius.circular(14)),
                  child: SvgPicture.asset(
                    'assets/icons/${!isUnlock ? "engine_unlock" : 'engine_lock'}.svg',
                    height: 24,
                    color: isUnlock ? const Color.fromRGBO(48, 164, 108, 1) : const Color.fromRGBO(229, 72, 77, 1),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  context.locale.confirmLockTitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    height: 24 / 18,
                    letterSpacing: -0.3,
                    color: Color.fromRGBO(24, 24, 24, 1),
                  ),
                ),
                const SizedBox(height: 12),
                Text(context.locale.confirmLockMessage(isUnlock ? 'unlock' : 'lock', vehicleName),
                    style: const TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      height: 24 / 16,
                      letterSpacing: -0.3,
                      color: Color.fromRGBO(100, 100, 100, 1),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(isUnlock ? context.locale.confirmLockNoteUnlock : context.locale.confirmLockNoteLock,
                    style: const TextStyle(
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
                        onPressed: () {
                          isUnlock
                              ? context.read<EngineLockCubit>().unlockEngine(widget.vehicle.id.toString())
                              : context.read<EngineLockCubit>().lockEngine(widget.vehicle.id.toString());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isUnlock ? const Color.fromRGBO(41, 151, 100, 1) : const Color.fromRGBO(217, 61, 66, 1),
                          shadowColor: Colors.transparent,
                          surfaceTintColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          isUnlock ? context.locale.unlockEngine : context.locale.lockEngine,
                          style: const TextStyle(
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
}
