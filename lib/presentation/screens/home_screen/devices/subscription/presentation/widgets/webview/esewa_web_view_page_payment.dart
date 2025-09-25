import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/domain/arguments/web_arguments.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/domain/esewa_init_payment_model.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/subscription/presentation/widgets/verification/esewa_payment_verification%20.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EsewaWebViewPagePayment extends StatefulWidget {
  const EsewaWebViewPagePayment({
    super.key,
    required this.params,
    required this.esewaInitPaymentModel,
  });
  final EsewaInitPaymentModel esewaInitPaymentModel;
  final WebViewRouteParams params;

  @override
  State<EsewaWebViewPagePayment> createState() =>
      _EsewaWebViewPagePaymentState();
}

class _EsewaWebViewPagePaymentState extends State<EsewaWebViewPagePayment> {
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
                  builder: (context) => EsewaPaymentVerification(
                      esewa: widget.esewaInitPaymentModel),
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
