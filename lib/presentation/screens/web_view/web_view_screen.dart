import 'package:flutter/material.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/domain/arguments/web_arguments.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({
    super.key,
    required this.params,
  });

  final WebViewRouteParams params;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final WebViewController _controller = WebViewController();
  double webprogress = 0;
  @override
  void initState() {
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.params.url))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            if (mounted) {
              setState(() {
                webprogress = progress / 100;
              });
            }
          },
        ),
      );
    super.initState();
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
