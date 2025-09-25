// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpspro/core/extensions/extensions.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/gen/l10n/locale.dart';
// import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_text.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/presentation/screens/share_location/cubit/share_location_cubit.dart';
import 'package:gpspro/presentation/screens/share_location/share_category_image.dart';
import 'package:gpspro/presentation/screens/share_location/time_button_group.dart';
import 'package:intl/intl.dart';
// import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

class ShareDialog extends StatefulWidget {
  final String deviceId;
  final Device vehicle;

  const ShareDialog({super.key, required this.deviceId, required this.vehicle});

  @override
  State<ShareDialog> createState() => _ShareDialogState();
}

class _ShareDialogState extends State<ShareDialog> {
  String selectedValue = '24hr';
  String? shareLink;
  final bool _isCopying = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _generateLink(); // now safe, context is ready
    });
  }

  void _generateLink() {
    final expirationTime = _getExpirationTime();
    context.read<ShareLocationCubit>().generateShareLink(
          expiration: expirationTime,
          deviceId: widget.deviceId,
        );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDragHandle(size),
        _buildHeader(context, size),
        const Divider(
          thickness: 2,
          color: Color.fromRGBO(240, 236, 244, 1),
        ),
        SizedBox(height: size.height * 0.015),
        _buildVehicleCard(context, size),
        SizedBox(height: size.height * 0.027),
        _buildShareLinkSection(context, size),
        _buildExpirationSection(size),
        SizedBox(height: size.height * 0.035),
        _buildShareButton(size),
        SizedBox(height: size.height * 0.030),
      ],
    );
  }

  Widget _buildDragHandle(Size size) {
    return Center(
      child: Container(
        width: size.width * 0.1,
        height: size.height * 0.006,
        margin: EdgeInsets.only(top: size.height * 0.018, bottom: size.height * 0.025),
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.locale.shareVehicleLocation,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: size.height * 0.02,
              color: const Color.fromRGBO(25, 28, 32, 1),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(size.width * 0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromRGBO(250, 249, 251, 1),
              ),
              child: SvgPicture.asset('assets/icons/cancel.svg'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleCard(BuildContext context, Size size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.045),
      padding: EdgeInsets.all(size.width * 0.02),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(250, 249, 251, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ShareCategoryImage(category: widget.vehicle.category),
          SizedBox(width: size.width * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  widget.vehicle.name,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.04,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: size.height * 0.005),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/location.svg',
                      color: const Color.fromRGBO(120, 118, 128, 1),
                    ),
                    SizedBox(width: size.width * 0.01),
                    Expanded(
                      child: AppText(
                        widget.vehicle.position?.address ?? context.locale.noAddress,
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: size.width * 0.03,
                          color: const Color.fromRGBO(120, 118, 128, 1),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShareLinkSection(BuildContext context, Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocListener<ShareLocationCubit, ShareLocationState>(
                listener: (context, state) {
                  state.maybeWhen(
                    error: (msg) {
                      AppToast.showError(context: context, message: msg);
                    },
                    orElse: () {},
                  );
                },
                child: BlocBuilder<ShareLocationCubit, ShareLocationState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const SizedBox.shrink(),
                      success: (token) {
                        shareLink = 'https://web.trackongps.com/?token=$token';
                        return const SizedBox.shrink();
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExpirationSection(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            context.locale.expireAfter,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: size.width * 0.035,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          ShareTimeButtonGroup(updateExpirationTime: _updateExpirationTime),
        ],
      ),
    );
  }

  Widget _buildShareButton(Size size) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.045),
      width: double.infinity,
      height: size.height * 0.065,
      child: ElevatedButton(
        onPressed: () {
          Share.share(shareLink!);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(18, 108, 192, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          context.locale.shareLinkButton,
          style: TextStyle(
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(249, 249, 255, 1),
          ),
        ),
      ),
    );
  }

  void _updateExpirationTime(String expiredValue) {
    setState(() {
      selectedValue = expiredValue;
    });
    _generateLink();
  }

  String _getExpirationTime() {
    final now = DateTime.now();
    final dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    final durationMap = {
      context.locale.duration24hr: const Duration(hours: 24),
      context.locale.duration3days: const Duration(days: 3),
      context.locale.duration7days: const Duration(days: 7),
      context.locale.duration30days: const Duration(days: 30),
    };

    return dateFormat.format(now.add(durationMap[selectedValue] ?? const Duration(hours: 24)));
  }
}
