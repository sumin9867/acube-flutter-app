import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/cubit/search/vehicle_search_cubit.dart';
import 'package:gpspro/util/debounce.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class VehicleSearchBar extends StatefulWidget {
  const VehicleSearchBar({
    super.key,
    this.hintText,
    this.controller,
    this.onSearch,
  });
  final String? hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onSearch;

  @override
  State<VehicleSearchBar> createState() => _VehicleSearchBarState();
}

class _VehicleSearchBarState extends State<VehicleSearchBar> {
  late final TextEditingController controller;
  final Debounce debounce = Debounce(duration: const Duration(milliseconds: 100));

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    controller.addListener(listenSerchText);
    super.initState();
  }

  void listenSerchText() {
    _updateClearButton();
    debounce.call(() {
      context.read<VehicleSearchCubit>().search(controller.text);
    });
  }

  @override
  void didUpdateWidget(covariant VehicleSearchBar oldWidget) {
    if (oldWidget.controller != widget.controller) {
      controller.dispose();
      controller = widget.controller ?? TextEditingController();
      controller.addListener(listenSerchText);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.removeListener(listenSerchText);
    controller.dispose();
    debounce.dispose();
    super.dispose();
  }

  void _updateClearButton() {
    if (controller.text.isEmpty) {
      setState(() {});
    } else if (controller.text.length == 1) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final fontSize = width * 0.04; // Example: ~16 on 400px width
    final paddingV = height * 0.012; // Example: ~10 on 800px height
    final paddingH = width * 0.04; // ~16 on 400px
    final iconSize = width * 0.045; // ~18 on 400px

    return TapRegion(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: widget.hintText ?? context.locale.searchVehicle,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: const Color.fromRGBO(120, 118, 128, 1.0),
            fontSize: fontSize,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(14),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color.fromARGB(255, 214, 214, 214)),
            borderRadius: BorderRadius.circular(14),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(14),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: paddingH,
            vertical: paddingV,
          ),
          prefixIcon: IconButton(
            onPressed: widget.onSearch == null ? null : () => widget.onSearch!.call(controller.text),
            icon: Icon(
              Iconsax.search_normal_1_copy,
              color: Colors.grey,
              size: iconSize,
            ),
          ),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    controller.clear();
                    context.read<VehicleSearchCubit>().clear();
                  },
                  icon: Icon(Icons.clear, size: iconSize),
                )
              : null,
        ),
      ),
    );
  }
}
