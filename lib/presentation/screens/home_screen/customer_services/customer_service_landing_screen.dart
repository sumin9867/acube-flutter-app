// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/router/route_helper.dart';
import 'package:gpspro/router/route_params.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomerServiceLandingScreen extends StatelessWidget {
  const CustomerServiceLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF9F9F9),
      ),
      bottomSheet: SafeArea(
        top: false,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: size.height * 0.02,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFFFFFF), Color(0xFFF9F9F9)],
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(24, 24, 24, 0.1),
                offset: Offset(0, -2),
                blurRadius: 9,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.locale.callCustomerCare,
                style: const TextStyle(
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 1.5,
                  letterSpacing: -0.3,
                  color: Color.fromRGBO(24, 24, 24, 1),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                context.locale.urgentHelp,
                style: const TextStyle(
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 1.43,
                  letterSpacing: -0.3,
                  color: Color.fromRGBO(100, 100, 100, 1),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final Uri phoneUri = Uri(scheme: 'tel', path: '+977 9707051010');
                    if (await canLaunchUrl(phoneUri)) {
                      await launchUrl(phoneUri);
                    } else {
                      log('Could not launch $phoneUri');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0880EA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    elevation: 4,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/images/phone.svg',
                        height: 20,
                        width: 20,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        context.locale.callNumber,
                        style: const TextStyle(
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          letterSpacing: -0.3,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(
              size.width * 0.030,
              size.height * 0.01,
              size.width * 0.030,
              size.height * 0.0,
            ),
            height: MediaQuery.of(context).size.height * .73,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 12),
                  SvgPicture.asset(
                    'assets/images/care_poster.svg',
                    height: size.height * 0.16,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 26),
                  Text(
                    context.locale.howCanWeHelp,
                    style: const TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                      height: 1.5,
                      letterSpacing: 0.0,
                      color: Color.fromRGBO(24, 24, 24, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    context.locale.chooseOption,
                    style: const TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                      height: 1.5,
                      letterSpacing: -0.3,
                      color: Color.fromRGBO(100, 100, 100, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  // Support tiles
                  _buildSupportTile(
                    context,
                    icon: 'live_care',
                    title: context.locale.liveSupport,
                    subtitle: context.locale.liveSupportSubtitle,
                    onTap: () => RouteHelper.pushCustomerCarePage(
                      const CustomerCareParams(isLoggedIn: true),
                    ),
                  ),
                  _buildSupportTile(
                    context,
                    icon: 'whatsapp',
                    title: context.locale.whatsappChat,
                    subtitle: context.locale.whatsappSubtitle,
                    onTap: () async {
                      const phoneNumber = '+9779820754740';
                      final url = 'https://wa.me/${phoneNumber.replaceAll('+', '')}';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Could not open WhatsApp')),
                        );
                      }
                    },
                  ),
                  _buildSupportTile(
                    context,
                    icon: 'video',
                    title: context.locale.tutorialVideos,
                    subtitle: context.locale.tutorialSubtitle,
                    onTap: () async {
                      const url = 'https://youtube.com/@trackonnepal';
                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                  ),
                  _buildSupportTile(
                    context,
                    icon: 'faq',
                    title: context.locale.faq,
                    subtitle: context.locale.faqSubtitle,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const _WebViewScreen(
                            url: 'https://www.trackon-gps.com/faq',
                            title: 'FAQs',
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: context.locale.availability,
                          ),
                          TextSpan(
                            text: context.locale.availabilityHours,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: context.locale.availabilityFooter,
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                        style: const TextStyle(
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          height: 1.33,
                          letterSpacing: -0.3,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSupportTile(
    BuildContext context, {
    required String icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Material(
        color: context.colorScheme.primaryContainer.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        child: ListTile(
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFF1F1F1)),
            borderRadius: BorderRadius.circular(16),
          ),
          leading: SvgPicture.asset(
            'assets/images/$icon.svg',
            width: 28,
            height: 28,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
              height: 1.5,
              letterSpacing: -0.3,
              color: Color.fromRGBO(24, 24, 24, 1),
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              height: 1.43,
              letterSpacing: -0.3,
              color: Color.fromRGBO(100, 100, 100, 1),
            ),
          ),
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
        ),
      ),
    );
  }
}

class _WebViewScreen extends StatefulWidget {
  final String url;
  final String title;

  const _WebViewScreen({
    required this.url,
    required this.title,
    super.key,
  });

  @override
  State<_WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<_WebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (String url) {
          setState(() {
            _isLoading = true;
          });
        },
        onPageFinished: (String url) {
          setState(() {
            _isLoading = false;
          });
        },
      ))
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(widget.title)),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
