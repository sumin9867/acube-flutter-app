import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/domain/arguments/web_arguments.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/widgets/verification/khalti_payment_verification.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KhaltiPaymentWebViewScreen extends StatefulWidget {
  const KhaltiPaymentWebViewScreen({
    super.key,
    required this.params,
    required this.pidx,
  });

  final WebViewRouteParams params;
  final String pidx;

  @override
  State<KhaltiPaymentWebViewScreen> createState() =>
      _KhaltiPaymentWebViewScreenState();
}

class _KhaltiPaymentWebViewScreenState
    extends State<KhaltiPaymentWebViewScreen> {
  final WebViewController _controller = WebViewController();
  double webprogress = 0;

  @override
  void initState() {
    super.initState();
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.params.url))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            if (url.contains('https://www.trackon-gps.com')) {
              context.pop();
              context.pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      KhaltiPaymentVerification(pidx: widget.pidx),
                ),
              );
            }
          },
          onProgress: (progress) {
            if (mounted) {
              setState(() {
                webprogress = progress / 100;
              });
            }
          },
        ),
      );
  }



  @override
  Widget build(BuildContext context) {
    _controller.setBackgroundColor(context.theme.scaffoldBackgroundColor);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.params.title),
      ),
      body: Column(
        children: [
          webprogress < 1
              ? SizedBox(
                  height: 5,
                  child: LinearProgressIndicator(
                    color: Colors.blue,
                    value: webprogress,
                    backgroundColor: Colors.black,
                  ),
                )
              : Container(),
          Expanded(
            child: WebViewWidget(
              controller: _controller,
            ),
          ),
        ],
      ),
    );
  }
}
