import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gpspro/gen/l10n/locale.dart';

class MapStyleSheet extends StatefulWidget {
  final String initialMapStyle;
  final Function(String) onApply;

  const MapStyleSheet({
    super.key,
    required this.initialMapStyle,
    required this.onApply,
  });

  @override
  State<MapStyleSheet> createState() => _MapStyleSheetState();
}

class _MapStyleSheetState extends State<MapStyleSheet> {
  late String _selectedMap;

  @override
  void initState() {
    super.initState();
    _selectedMap = widget.initialMapStyle;
  }

  @override
  Widget build(BuildContext context) {
    log('selected Mapstyle $_selectedMap');
    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.locale.map_styles_title,
                  style: const TextStyle(
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    height: 24 / 18,
                    letterSpacing: -0.3,
                    color: Color.fromRGBO(24, 24, 24, 1),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: SvgPicture.asset('assets/icons/close.svg'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _mapOption('simple_map', 'Trackon', 'simple')),
                Expanded(child: _mapOption('classic_map', context.locale.classic, 'classic')),
                Expanded(child: _mapOption('satellite_map', context.locale.satellite, 'satellite')),
                Expanded(child: _mapOption('terrance_map', context.locale.terrain, 'terrain')),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 10,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(247, 247, 247, 1),
              border: Border(
                top: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
                bottom: BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
                widget.onApply(_selectedMap);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(8, 128, 234, 1),
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(
                context.locale.apply_setting,
                style: const TextStyle(
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 24 / 16,
                  letterSpacing: -0.3,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mapOption(String imageName, String label, String identical) {
    final isSelected = _selectedMap == identical;
    log('I am selected $_selectedMap');
    return GestureDetector(
      onTap: () => setState(() => _selectedMap = identical),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: isSelected ? Border.all(color: const Color.fromRGBO(8, 128, 234, 1), width: 3) : null,
            ),
            child: Image.asset(
              'assets/images/$imageName.png',
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * .08,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              fontSize: 16,
              height: 20 / 14,
              letterSpacing: -0.3,
              color: const Color.fromRGBO(24, 24, 24, 1),
            ),
          ),
        ],
      ),
    );
  }
}
