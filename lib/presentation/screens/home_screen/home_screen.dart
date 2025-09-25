import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/core/app_permission.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/presentation/global_cubit/websocket/websocket_cubit.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/presentation/global_widgets/no_connection_page.dart';
import 'package:gpspro/presentation/screens/custom_double_back_widget.dart';
import 'package:gpspro/presentation/screens/home_screen/cubit/home_screen_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/cubit/home_screen_state.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/filter/vehicle_filter_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/error_screen.dart';
import 'package:gpspro/presentation/screens/home_screen/home_bottom_nav.dart';
import 'package:gpspro/presentation/screens/home_screen/welcome_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ConnectivityResult? _connectionStatus;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  bool isSocketInitialized = false;

  @override
  void initState() {
    super.initState();

    initConnectivity();

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> resultList) {
      if (resultList.isNotEmpty) {
        _updateConnectionStatus(resultList.first);
      }
    });

    context.read<DevicesQuickCheckCubit>().checkDevices();

    locator<VehicleFilterCubit>().initialize;
    if (Platform.isAndroid) {
      Future.microtask(() async {
        await AppPermissions.askForAllPermissions();
      });
    }
  }

  @override
  void didUpdateWidget(HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  Future<void> initConnectivity() async {
    List<ConnectivityResult> resultList;
    try {
      resultList = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status: $e');
      return;
    }

    if (!mounted) return;

    _updateConnectionStatus(resultList.first);
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    if (_connectionStatus == result) return;
    setState(() {
      _connectionStatus = result;
    });
    log('Connectivity changed: $_connectionStatus');
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    locator.get<WebsocketCubit>().disconnect();
    locator.get<WebsocketCubit>().close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WebsocketCubit, WebsocketState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            error: (message) {
              AppToast.showError(context: context, message: message);
            });
      },
      child: CustomDoubleBackToExit(
        snackBarMessage: 'Tap back again to exit',
        snackbarBackgroundColor: const Color.fromARGB(255, 244, 244, 244),
        allowExitOnIOS: true,
        snackbarMargin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * .86,
          left: MediaQuery.of(context).size.height * .12,
          right: MediaQuery.of(context).size.height * .12,
        ),
        snackbarBehavior: SnackBarBehavior.floating,
        snackbarTextStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        child: _connectionStatus == null
            ? const Scaffold(
                backgroundColor: Colors.white,
              )
            : _connectionStatus == ConnectivityResult.none
                ? const NoConnectionPage()
                : Scaffold(
                    backgroundColor: Colors.white,
                    resizeToAvoidBottomInset: false,
                    body: BlocBuilder<DevicesQuickCheckCubit, DevicesQuickCheckState>(
                      builder: (context, state) {
                        if (state is DevicesQuickCheckSuccess) {
                          if (state.hasDevices && !isSocketInitialized) {
                            locator.get<WebsocketCubit>().init();
                            isSocketInitialized = true;
                          }

                          return state.hasDevices
                              ? SafeArea(
                                  child: Scaffold(
                                    resizeToAvoidBottomInset: false,
                                    body: widget.navigationShell,
                                    bottomNavigationBar: const HomeBottomNavBar(),
                                  ),
                                )
                              : const WelcomeView();
                        } else if (state is DevicesQuickCheckFailure) {
                          final isSessionExpired = state.message.toLowerCase().contains('session expired') ||
                              state.message.toLowerCase().contains('unauthorized') ||
                              state.message.toLowerCase().contains('401');

                          return ErrorScreen(
                            title: isSessionExpired ? 'Session Expired' : 'Something went wrong',
                            message: isSessionExpired
                                ? 'Your session has expired. Please log in again to continue.${state.message}'
                                : 'We couldn\'t load your devices at the moment. Please check your connection .${state.message} and try again.',
                            onRetry: () {
                              if (isSessionExpired) {
                                context.go('/signin');
                              } else {
                                context.read<DevicesQuickCheckCubit>().checkDevices();
                              }
                            },
                          );
                        } else if (state is DevicesQuickCheckLoading) {
                          return const Scaffold(
                            backgroundColor: Colors.white,
                          );
                        }

                        return const Scaffold(
                          body: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(height: 16),
                                Text(
                                  'Initializing...',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
      ),
    );
  }
}
