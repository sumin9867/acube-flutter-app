import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gpspro/core/utils/validators/validators.dart';
import 'package:gpspro/gen/assets.gen.dart';
import 'package:gpspro/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class AppAvatar extends StatefulWidget {
  const AppAvatar({
    super.key,
    this.avatarUrl,
    this.radius = 50.0,
  });

  final String? avatarUrl;
  final double radius;

  const AppAvatar.medium({
    super.key,
    this.avatarUrl,
  }) : radius = 40.0;

  @override
  State<AppAvatar> createState() => _AppAvatarState();
}

class _AppAvatarState extends State<AppAvatar> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.height;
    log('$screenWidth');

    // Determine the width multiplier based on screen width
    final widthMultiplier = screenWidth < 670 ? 1.75 : 2.0;
    final width = widget.radius * widthMultiplier;

    return Container(
      height: widget.radius * 2,
      width: width,
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(widget.radius),
        color: AppColors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.radius),
        child: AppValidator.isNullOrBlank(widget.avatarUrl)
            ? Image.asset(
                Assets.images.onboarding.onboardingLiveTracking.path,
                fit: BoxFit.cover,
              )
            : CachedNetworkImage(
                imageUrl: widget.avatarUrl!,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
      ),
    );
  }
}
