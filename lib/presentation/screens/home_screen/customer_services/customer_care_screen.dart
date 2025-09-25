import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart'; // adjust import if needed
import 'package:gpspro/core/constants/api_keys.dart';
import 'package:gpspro/core/constants/appwrite.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class CustomerCareScreen extends StatefulWidget {
  final bool isLoggedIn;

  const CustomerCareScreen({super.key, required this.isLoggedIn});

  @override
  State<CustomerCareScreen> createState() => _CustomerCareScreenState();
}

class _CustomerCareScreenState extends State<CustomerCareScreen> {
  late final WebViewController _controller;

  final String baseUrl = 'https://chat.trackon-gps.com';
  final String websiteToken = ApiKeys.websiteToken;

  @override
  void initState() {
    super.initState();

    final authCubit = context.read<AuthCubit>();
    final user = authCubit.user;
    final profilePicId = authCubit.profilePicId;

    final String userId = user != null ? user.id.toString() : '';
    final String userName = user != null ? user.name.toString() : '';
    final String userEmail = user != null ? user.email.toString() : '';
    final String userPhone = user != null ? user.phone.toString() : '';

    final String userAvatar = profilePicId == null
        ? 'https://itsoch.com/user.png'
        : '${Appwrite.appwriteUrl}${Appwrite.appwriteBucketId}/files/$profilePicId/view?project=${Appwrite.appwriteProjectId}';
    final String identifierHash =
        generateHmacSha256(websiteToken: websiteToken, userId: user == null ? '' : user.id.toString());

    final htmlContent = '''
<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Trackon Support</title>
  <script defer src="$baseUrl/packs/js/sdk.js"></script>
  <style>
    * {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      padding: 20px;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f4faff;
      height: 100vh;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      color: #121636;
    }

    .spinner {
      margin-top: 30px;
      width: 40px;
      height: 40px;
      border: 4px solid rgba(0, 0, 0, 0.1);
      border-left-color: #167EE8;
      border-radius: 50%;
      animation: spin 1s linear infinite;
    }

    @keyframes spin {
      to { transform: rotate(360deg); }
    }

    .woot--close-button,
    .woot-widget-holder .woot--close-button {
      display: none !important;
      visibility: hidden !important;
      opacity: 0 !important;
      pointer-events: none !important;
      height: 0 !important;
      width: 0 !important;
    }
  </style>
  <script type="text/javascript">
    window.chatwootSettings = { locale: "en", type: 'standard' };
    window.onload = function () {
      window.chatwootSDK.run({
        websiteToken: "$websiteToken",
        baseUrl: "$baseUrl"
      });

      window.addEventListener("chatwoot:ready", function () {
        window.\$chatwoot.setUser("$userId", {
          email: "$userEmail",
          name: "$userName",
          avatar_url: "$userAvatar",
          phone_number: "$userPhone",
          identifier_hash: "$identifierHash",
        });

        window.\$chatwoot.toggle("open");

       
      });
    };
  </script>
</head>
<body>

  <div id="loading" class="spinner"></div>
</body>
</html>
''';

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent);

    if (Platform.isAndroid) {
      final androidController = _controller.platform as AndroidWebViewController;
      // Enable cookie manager
      final cookieManager = WebViewCookieManager().platform as AndroidWebViewCookieManager;
      cookieManager.setAcceptThirdPartyCookies(androidController, true);
    }

    // Load your HTML content
    _controller.loadHtmlString(
      htmlContent,
      baseUrl: 'https://chat.trackon-gps.com',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(controller: _controller),
        floatingActionButton: Container(
          width: 100,
          height: 60,
          margin: const EdgeInsets.only(
            top: 6,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              // BoxShadow(
              //   color: Colors.black12,
              //   blurRadius: 8,
              //   offset: Offset(0, 2),
              // ),
            ],
          ),
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop(); // or your custom exit logic
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      ),
    );
  }

  String generateHmacSha256({
    required String websiteToken,
    required String userId,
  }) {
    final key = utf8.encode(ApiKeys.useridentityValidationCode);
    final bytes = utf8.encode(userId);

    final hmacSha256 = Hmac(sha256, key); // HMAC-SHA256 instance
    final digest = hmacSha256.convert(bytes);

    return digest.toString(); // Hex digest
  }
}



  // return SafeArea(
  //   child: Scaffold(

  //     resizeToAvoidBottomInset: true,
  //     body: Stack(
  //       children: [
  //         !widget.isLoggedIn
  //             ? _buildChatwootWidgetForLoggedInUser()
  //             : BlocBuilder<AuthCubit, AuthState>(
  //                 builder: (context, state) {
  //                   return state.maybeWhen(
  //                     authenticated: (user) {
  //                       final chatwootUser = ChatwootUser(
  //                         avatarUrl: user.avatarUrl,
  //                         identifier: user.id.toString(),
  //                         name: user.name,
  //                         email: user.email,
  //                       );

  //                       return _buildChatwootWidget(chatwootUser);
  //                     },
  //                     orElse: () => const SizedBox.shrink(),
  //                   );
  //                 },
  //               ),

  //         if (isLoading)
  //           Container(
  //             height: double.infinity,
  //             color: Colors.white,
  //             child: Center(
  //               child: CircularProgressIndicator(),
  //             ),
  //           ),
  //       ],
  //     ),
  //   ),
  // );
// }

  // Widget _buildChatwootWidgetForLoggedInUser() {

  //   log('heacac');
  //   final chatwootUser = ChatwootUser(
  //     avatarUrl: 'https://example.com/avatar.jpg', 
  //     identifier: 'guest_${DateTime.now().millisecondsSinceEpoch}', 
  //     name: 'Guest User',  
  //     email: 'guest@example.com',  
  //   );

  //   return _buildChatwootWidget(chatwootUser);
  // }

  // Widget _buildChatwootWidget(ChatwootUser chatwootUser) {
  //   return ChatwootWidget(
  //     websiteToken: 'kmwRtR9hwY2SxV36fn6Sozcu',
  //     baseUrl: 'https://chat.trackon-gps.com/',
  //     user: chatwootUser,
  //     locale: 'en',
  //     closeWidget: () {
  //       if (Platform.isAndroid) {
  //         SystemNavigator.pop();
  //       } else if (Platform.isIOS) {
  //         exit(0);
  //       }
  //     },
  //   );
  // }
