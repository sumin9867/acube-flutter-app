import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpspro/theme/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool isSearching;
  final Function(String) onSearch;
  final Function() onCancel;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.isSearching,
    required this.onSearch,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .04,
      child: TextField(
        controller: controller,
        autofocus: true,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          prefixIcon: SvgPicture.asset('assets/icons/vehicle_geofence/search.svg'),
          suffixIcon: IconButton(
            onPressed: onCancel,
            icon: const Icon(Icons.cancel_outlined),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGreyText),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        onChanged: onSearch,
        onSubmitted: onSearch,
      ),
    );
  }
}