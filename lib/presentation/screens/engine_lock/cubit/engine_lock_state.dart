part of 'engine_lock_cubit.dart';

@freezed
class EngineLockState with _$EngineLockState {
  const factory EngineLockState.initial() = _Initial;

  // Loading states
  const factory EngineLockState.locking(String message) = _Locking;
  const factory EngineLockState.unlocking(String message) = _Unlocking;

  // Success states
  const factory EngineLockState.lockSuccess(String message) = _LockSuccess;
  const factory EngineLockState.unlockSuccess(String message) = _UnlockSuccess;

  // Error state
  const factory EngineLockState.error(String message) = _Error;
}
