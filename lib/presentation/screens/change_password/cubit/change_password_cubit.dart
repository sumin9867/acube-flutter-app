import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/domain/models/user_model.dart';
import 'package:gpspro/presentation/repository/i_auth_repo.dart';
import 'package:injectable/injectable.dart';

part 'change_password_cubit.freezed.dart';
part 'change_password_state.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.authRepo) : super(const _InitialState());

  final AuthRepo authRepo;
  Future<void> updatePasswordWithConfirmation(
    String currentPassword,
    String newPassword,
    AuthCubit authCubit,
  ) async {
    emit(const ChangePasswordState.loading(message: 'Updating password...'));

    try {
      final isConfirmed = await authCubit.confirmPassword(currentPassword);
      log('I am confirmed $isConfirmed');

      if (!isConfirmed) {
        emit(const ChangePasswordState.failed(message: 'Current password is incorrect.'));
        return;
      }

      final User? user = authCubit.user;
      if (user == null) {
        if (!isClosed) {
          emit(const ChangePasswordState.failed(message: 'User not found.'));
        }
        return;
      }

      final updatedUser = user.copyWith(password: newPassword);

      await authCubit.updateProfile(updatedUser);
      await authCubit.refetchUserSessionAfterPasswordChange(updatedUser.password!);
      log('I ma called into password');

      if (!isClosed) {
        emit(const ChangePasswordState.success(message: 'Your password has been changed successfully'));
      }
    } catch (e) {
      log('Change password error: $e');
      if (!isClosed) {
        emit(ChangePasswordState.failed(message: e.toString()));
      }
    }
  }
}
