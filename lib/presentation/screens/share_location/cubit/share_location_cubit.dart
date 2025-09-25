import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/presentation/repository/i_share_repo.dart';
import 'package:injectable/injectable.dart';

part 'share_location_cubit.freezed.dart';
part 'share_location_state.dart';

@injectable
class ShareLocationCubit extends Cubit<ShareLocationState> {
  final IShareRepo shareRepo;
  ShareLocationCubit(this.shareRepo) : super(const ShareLocationState.initial());

  Future<void> generateShareLink({
    required String expiration,
    required String deviceId,
  }) async {
    emit(const ShareLocationState.loading());
    try {
      final response = await shareRepo.generateShareLink(expiration, deviceId);
      emit(ShareLocationState.success(response.token));
    } catch (e) {
      emit(ShareLocationState.error(e.toString()));
    }
  }
}
