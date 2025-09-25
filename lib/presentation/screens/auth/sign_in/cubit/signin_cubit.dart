import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/exceptions/app_exceptions.dart';
import 'package:gpspro/domain/models/user_model.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/my_devices/my_devices_cubit.dart';
import 'package:injectable/injectable.dart';

part 'signin_cubit.freezed.dart';
part 'signin_state.dart';

@injectable
class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authCubit, this.myDeviceCubit) : super(const _Initial());

  final AuthCubit authCubit;
  final MyDevicesCubit myDeviceCubit;

  // Future<void> signIn(String username, String password) async {
  //   try {
  //     emit(const _Loading());
  //     final response = await authCubit.authRepo.login(
  //       username: username,
  //       password: password,
  //     );
  //     authCubit.requestAuthentication(
  //       response.userSession,
  //       response.user,
  //     );
  //     await myDeviceCubit.init();
  //     emit(_Success(response.user));
  //   } on AppException catch (e) {
  //     emit(_Error(e));
  //   } catch (e) {
  //     emit(const _Error(UnknownException()));
  //   } finally {
  //     emit(const _Initial());
  //   }
  // }

  Future<void> signIn(String username, String password) async {
    try {
      emit(const _Loading());
      // If it's already an email, proceed with login directly
      await _performLogin(username, password);
    } catch (e) {
      emit(_Error(AppException(message: e.toString())));
    }
  }

  Future<void> _performLogin(String username, String password) async {
    final response = await authCubit.authRepo.login(
      username: username,
      password: password,
    );

    authCubit.requestAuthentication(
      response.userSession,
      response.user,
    );
    await myDeviceCubit.init();
    emit(_Success(response.user));
  }
}
