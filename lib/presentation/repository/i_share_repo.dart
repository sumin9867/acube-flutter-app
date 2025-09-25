import 'package:gpspro/domain/models/i_sharemodel.dart';

abstract class IShareRepo {
  Future<ShareResponse> generateShareLink(
    String expiration,
    String deviceId,
  );
}
