import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gpspro/core/constants/appwrite.dart';
import 'package:gpspro/domain/models/user_model.dart';
import 'package:gpspro/presentation/screens/account_section/account_section.dart';
import 'package:shimmer/shimmer.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    log('I am profile data $user');
    return ListTile(
      tileColor: const Color.fromRGBO(255, 255, 255, 1),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: SizedBox(
        width: 60,
        height: 60,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: CachedNetworkImage(
            imageUrl:
                '${Appwrite.appwriteUrl}${Appwrite.appwriteBucketId}/files/${user.attributes?["profilePicId"]}/view?project=${Appwrite.appwriteProjectId}',
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.person,
              size: 60,
              color: Colors.grey,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        user.name,
        maxLines: 1,
        style: const TextStyle(
          color: Color.fromRGBO(24, 24, 24, 1),
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w600,
          fontSize: 16,
          height: 1.5,
          letterSpacing: -0.3,
        ),
      ),
      subtitle: Text(
        (user.phone == null || user.phone!.isEmpty) ? 'NO number' : user.phone!,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Color.fromRGBO(101, 99, 109, 1),
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 1.43,
          letterSpacing: -0.3,
        ),
      ),
      trailing: ElevatedButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
                builder: (context) => AccountSection(
                      user: user,
                    )),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          side: const BorderSide(
            color: Color.fromRGBO(241, 241, 241, 1),
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        ),
        child: const Text(
          'View Profile',
          style: TextStyle(
            color: Color.fromRGBO(24, 24, 24, 1),
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: 1.43,
            letterSpacing: -0.3,
          ),
        ),
      ),
    );
  }
}
