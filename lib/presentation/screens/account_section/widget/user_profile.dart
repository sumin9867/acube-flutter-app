import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpspro/auth/cubit/auth_cubit.dart';
import 'package:gpspro/core/constants/appwrite.dart';
import 'package:gpspro/domain/models/user_model.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_widgets/app_toast.dart';
import 'package:gpspro/theme/app_colors.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key, required this.user});
  final User user;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Future<void> _pickImage() async {
    await [Permission.camera, Permission.photos, Permission.storage].request();

    final choice = await showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context, 'camera'),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/camera.svg', width: 20, height: 20),
                      const SizedBox(width: 10),
                      Text(
                        context.locale.take_photo_from_camera,
                        style: const TextStyle(
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.5,
                          letterSpacing: -0.3,
                          color: Color.fromRGBO(24, 24, 24, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context, 'gallery'),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/gallery.svg', width: 20, height: 20),
                      const SizedBox(width: 10),
                      Text(
                        context.locale.select_photo_from_gallery,
                        style: const TextStyle(
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.5,
                          letterSpacing: -0.3,
                          color: Color.fromRGBO(24, 24, 24, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (choice == null || !mounted) return;

    final ImagePicker picker = ImagePicker();
    XFile? pickedFile;

    try {
      pickedFile = await picker.pickImage(
        source: choice == 'camera' ? ImageSource.camera : ImageSource.gallery,
      );

      if (pickedFile == null || !File(pickedFile.path).existsSync()) return;

      final CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: AppColors.primaryColor,
            toolbarWidgetColor: Colors.white,
            statusBarColor: AppColors.primaryColor,
            lockAspectRatio: true,
            initAspectRatio: CropAspectRatioPreset.square,
          ),
          IOSUiSettings(
            title: 'Cropper',
            aspectRatioLockEnabled: true,
            aspectRatioPickerButtonHidden: true,
          ),
          WebUiSettings(context: context),
        ],
      );

      if (croppedFile != null && mounted) {
        context.read<AuthCubit>().uploadProfilePIcture(File(croppedFile.path));
      }
    } catch (e) {
      log('Image picking/cropping error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageSize = size.height * 0.12;
    final iconSize = size.width * 0.05;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (msg) {
            AppToast.showSuccess(context: context, message: msg);
          },
          error: (msg) {
            AppToast.showError(context: context, message: msg);
          },
          orElse: () {},
        );
      },
      child: Center(
        child: SizedBox(
          height: imageSize * 1.5,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return Container(
                    height: imageSize,
                    width: imageSize,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: ClipOval(
                      child: state.maybeWhen(
                        loading: (_) => Container(
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(),
                        ),
                        authenticated: (user) => CachedNetworkImage(
                          imageUrl:
                              '${Appwrite.appwriteUrl}${Appwrite.appwriteBucketId}/files/${user.attributes?["profilePicId"]}/view?project=${Appwrite.appwriteProjectId}',
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => const Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.grey,
                          ),
                        ),
                        orElse: () => Container(
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 7,
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    padding: EdgeInsets.all(iconSize * 0.3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: const Color(0xFFEBEBEB), width: 1),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(31, 128, 127, 127),
                          blurRadius: 4,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/icons/change.svg', height: 12),
                        const SizedBox(width: 6),
                        Text(
                          context.locale.change,
                          style: const TextStyle(
                            color: Color(0xFF181818),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
