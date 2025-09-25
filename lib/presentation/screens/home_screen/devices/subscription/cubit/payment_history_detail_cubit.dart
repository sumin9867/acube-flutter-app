import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/payment_history_details.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/repository/i_payment_repo.dart';
import 'package:injectable/injectable.dart';

part 'payment_history_detail_cubit.freezed.dart';
part 'payment_history_detail_state.dart';

@injectable
class PaymentHistoryDetailCubit extends Cubit<PaymentHistoryDetailState> {
  PaymentHistoryDetailCubit(this.paymentRepo) : super(const PaymentHistoryDetailState.initial());
  final IPaymentRepo paymentRepo;

  Future<void> getPaymentDetails(String paymentId) async {
    emit(const PaymentHistoryDetailState.loading());

    final result = await paymentRepo.getPaymentHistoryDetails(paymentId);

    result.fold(
      (failure) => emit(PaymentHistoryDetailState.error(failure)),
      (success) => emit(PaymentHistoryDetailState.paymentHistoryDetails(success)),
    );
  }
}
