  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:freezed_annotation/freezed_annotation.dart';
  import 'package:gpspro/auth/cubit/auth_cubit.dart';
  import 'package:gpspro/core/exceptions/app_exceptions.dart';
  import 'package:gpspro/domain/models/user_model.dart';
  import 'package:gpspro/router/router.dart';
  import 'package:injectable/injectable.dart';

  part 'signup_cubit.freezed.dart';
  part 'signup_state.dart';

  @injectable
  class SignupCubit extends Cubit<SignupState> {
    SignupCubit(this.authCubit) : super(const SignupState.initial());

    final AuthCubit authCubit;
    String? token;
    String? emailOrPhone;
    int step = 1;

    Future<void> signup({required String emailOrPhone}) async {
      emit(const SignupState.loading());
      try {
        await authCubit.authRepo.initiateSignup(emailOrPhone: emailOrPhone);
        this.emailOrPhone = emailOrPhone;
        step = 2;
        emit(SignupState.otpSent('OTP has been sent to $emailOrPhone'));
      } on AppException catch (e) {
        emit(SignupState.error(e.message));
      } catch (_) {
        emit(const SignupState.error('Unexpected error occurred'));
      }
    }

    Future<void> resendOtp() async {
      emit(const SignupState.loading());
      if (emailOrPhone == null) {
        emit(const SignupState.error('No email or phone found to resend OTP'));
        return;
      }

      try {
        await authCubit.authRepo.initiateSignup(emailOrPhone: emailOrPhone!);
        emit(SignupState.resendOtp('OTP resent to $emailOrPhone'));
      } on AppException catch (e) {
        emit(SignupState.error(e.message));
      } catch (_) {
        emit(const SignupState.error('Unexpected error occurred while resending OTP'));
      }
    }

    Future<void> verifyOtp({required String otp}) async {
      emit(const SignupState.loading());
      try {
        if (emailOrPhone == null) {
          throw const AppException(message: 'No email or phone found');
        }

        final response = await authCubit.authRepo.verifyToken(
          otp: otp,
          emailOrPhone: emailOrPhone!,
          identifier: 'registration',
        );

        token = response;
        step = 3;
        emit(const SignupState.otpVerified());
      } on AppException catch (e) {
        emit(SignupState.error(e.message));
      } catch (_) {
        emit(const SignupState.error('Unexpected error during OTP verification'));
      }
    }

    Future<void> completeSignup({
      required String fullname,
      required String password,
    }) async {
      try {
        emit(const SignupState.loading());

        if (token == null) {
          throw const AppException(message: 'Token is missing');
        }

        await authCubit.authRepo.completeSignup(
          token: token!,
          fullname: fullname,
          password: password,
        );

        emit(SignupState.success(User(
          id: 0,
          name: fullname,
        ))); // Just a placeholder user
        RouteHelper.pushReplaceSignInPage();
        step = 1;
      } on AppException catch (e) {
        emit(SignupState.error(e.message));
      } catch (_) {
        emit(SignupState.error(const AppException().message));
      }
    }
  }
