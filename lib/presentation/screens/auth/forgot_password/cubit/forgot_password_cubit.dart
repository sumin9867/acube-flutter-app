import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/exceptions/app_exceptions.dart';
import 'package:injectable/injectable.dart';

part 'forgot_password_cubit.freezed.dart';
part 'forgot_password_state.dart';

@injectable
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.authCubit) : super(const _Initial());

  final AuthCubit authCubit;

  String? emailOrPhone;
  String? token;

  Future<void> requestToken(String emailOrPhone) async {
    try {
      emit(const _Loading());
      await authCubit.authRepo.requestToken(emailOrPhone: emailOrPhone);
      this.emailOrPhone = emailOrPhone;
      emit(const _Success('OTP sent successfully'));
    } on AppException catch (e) {
      log(e.toString());
      emit(_Error(e));
    } catch (e) {
      emit(const _Error(UnknownException()));
    } finally {
      emit(const _Initial());
    }
  }

  Future<void> resendToken() async {
    try {
      emit(const ForgotPasswordState.loading());

      await authCubit.authRepo.requestToken(emailOrPhone: emailOrPhone!);
      emit(const ForgotPasswordState.resendInProgress());
    } on AppException catch (e) {
      emit(ForgotPasswordState.error(e));
    } catch (e) {
      emit(const ForgotPasswordState.error(UnknownException()));
    } finally {
      emit(const ForgotPasswordState.initial());
    }
  }

  Future<void> verifyToken(String otp) async {
    try {
      emit(const _Loading());
      final response = await authCubit.authRepo.verifyToken(otp: otp, emailOrPhone: emailOrPhone!, identifier: 'reset');
      token = response;
      emit(const _Success('OTP Verfied'));
    } on AppException catch (e) {
      emit(_Error(e));
    } catch (e) {
      emit(const _Error(UnknownException()));
    } finally {
      emit(const _Initial());
    }
  }

  Future<void> resetPassword(String newPassword) async {
    try {
      log('Reset password started ');
      emit(const _Loading());

      await authCubit.authRepo.resetPassword(
        token: token!,
        newPassword: newPassword,
      );

      log('Password reset successful');
      emit(const _Success('Password successfully resetted'));
    } on AppException catch (e) {
      log('AppException occurred: ${e.message}');
      emit(_Error(e));
    } catch (e) {
      log('Unknown error occurred: $e');
      emit(const _Error(UnknownException()));
    } finally {
      log('Reset password process completed');
      emit(const _Initial());
    }
  }
}
