import 'package:equatable/equatable.dart';

abstract class DevicesQuickCheckState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DevicesQuickCheckInitial extends DevicesQuickCheckState {}

class DevicesQuickCheckLoading extends DevicesQuickCheckState {}

class DevicesQuickCheckSuccess extends DevicesQuickCheckState {
  final bool hasDevices;

  DevicesQuickCheckSuccess(this.hasDevices);

  @override
  List<Object?> get props => [hasDevices];
}

class DevicesQuickCheckFailure extends DevicesQuickCheckState {
  final String message;

  DevicesQuickCheckFailure(this.message);

  @override
  List<Object?> get props => [message];
}
