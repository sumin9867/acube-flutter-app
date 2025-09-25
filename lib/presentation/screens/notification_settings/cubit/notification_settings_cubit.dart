import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/core/app_logger.dart';
import 'package:gpspro/core/exceptions/app_exceptions.dart';
import 'package:gpspro/presentation/global_widgets/loading_widgets.dart';
import 'package:gpspro/presentation/repository/i_notification_repo.dart';
import 'package:injectable/injectable.dart';

part 'notification_settings_cubit.freezed.dart';
part 'notification_settings_state.dart';

@injectable
class NotificationSettingsCubit extends Cubit<NotificationSettingsState> {
  NotificationSettingsCubit(this.notificationRepo) : super(const _InitialState());

  final NotificationRepo notificationRepo;
  List<Map<String, bool>>? _lastKnownNotifications;
  void emitSuccess(List<Map<String, bool>> notifications) {
    _lastKnownNotifications = notifications;
    emit(_IdleState(notifications));
  }

  List<Map<String, bool>> get lastKnownNotifications => _lastKnownNotifications ?? [];

  Future<void> init() async {
    emit(const _LoadingState());
    await fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    try {
      final response = await notificationRepo.fetchNotifications();
      log('I am resposne from $response');
      emitSuccess(response);
      emit(_IdleState(response));
    } on AppException catch (e) {
      emit(_ErrorState(e.message));
    } catch (e) {
      AppLogger.error(e);
      emit(_ErrorState(e.toString()));
    }
  }

  Future<void> updateNotification(String type, bool isOn, BuildContext context) async {
    showLoadingDialog(context, 'Updating Notification', false);

    final result = await notificationRepo.updateNotifications(
      notType: type,
      isOn: isOn,
    );

    result.fold(
      (error) {
        dismissLoadingDialog(context);

        log('Notification $error');
        emit(_ErrorState(error));
      },
      (_) {
        dismissLoadingDialog(context);

        log('sdcdsc');
        // Future.microtask(() => fetchNotifications()); // fire-and-forget
      },
    );
  }

  Future<void> updateNotificationAll(List<Map<String, bool>> notifications, BuildContext context) async {
    try {
      showLoadingDialog(context, 'Updating Notification', false);

      for (var item in notifications) {
        await notificationRepo.updateNotifications(notType: item.keys.first, isOn: item.values.first);
      }

      await fetchNotifications();
      dismissLoadingDialog(context);
    } on AppException catch (e) {
      emit(_ErrorState(e.message));
    } catch (e) {
      dismissLoadingDialog(context);

      AppLogger.error(e);
      emit(_ErrorState(e.toString()));
    } finally {
      dismissLoadingDialog(context);
    }
  }
}
