import 'package:flutter/material.dart';

class HeaderFooterWrapper extends StatelessWidget {
  const HeaderFooterWrapper({
    super.key,
    this.header,
    this.footer,
    required this.child,
  });

  final Widget? header;
  final Widget? footer;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: constraints.maxWidth,
            minHeight: constraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: Column(
              children: [
                if (header != null) header!,
                child,
                if (footer != null) ...[const Spacer(), footer!],
              ],
            ),
          ),
        ),
      );
    });
  }
}
