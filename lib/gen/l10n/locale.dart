import 'package:flutter/material.dart';
import 'package:gpspro/gen/l10n/l10n.dart';

extension LocaleEx on BuildContext {
  S get locale => S.of(this);
}
