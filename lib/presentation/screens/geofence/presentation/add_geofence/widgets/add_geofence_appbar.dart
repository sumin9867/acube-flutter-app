import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpspro/presentation/screens/geofence/application/search_location/search_location_cubit.dart';

class AddGeofenceAppbar extends StatefulWidget implements PreferredSizeWidget {
  final ValueNotifier<bool> isSearchingNotifier;
  final ValueNotifier<bool> isSearchingInitialNotifier;
  final ValueChanged<bool> onSearchStateChanged;

  const AddGeofenceAppbar({
    super.key,
    required this.isSearchingNotifier,
    required this.isSearchingInitialNotifier,
    required this.onSearchStateChanged,
  });

  @override
  State<AddGeofenceAppbar> createState() => _AddGeofenceAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AddGeofenceAppbarState extends State<AddGeofenceAppbar> {
  final TextEditingController _searchController = TextEditingController();

  void _toggleSearch() {
    widget.isSearchingNotifier.value = !widget.isSearchingNotifier.value;
    widget.onSearchStateChanged(widget.isSearchingNotifier.value);
    if (!widget.isSearchingNotifier.value) {
      _searchController.clear();
      widget.isSearchingInitialNotifier.value = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: widget.isSearchingNotifier,
      builder: (context, isSearching, _) {
        return AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: isSearching
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * .045,
                  child: TextField(
                    controller: _searchController,
                    autofocus: true,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    cursorColor: const Color.fromRGBO(0, 145, 255, 1),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(2, 128, 255, 0.07),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color.fromRGBO(0, 145, 255, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color.fromRGBO(0, 145, 255, 1)),
                      ),
                      contentPadding: EdgeInsets.zero,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          'assets/icons/vehicle_geofence/search.svg',
                          height: 18,
                          width: 18,
                          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: _toggleSearch,
                        splashRadius: 18,
                        icon: SvgPicture.asset(
                          'assets/icons/vehicle_geofence/close.svg',
                          height: 30,
                          width: 30,
                          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.length > 4) {
                        widget.isSearchingInitialNotifier.value = false;
                        context.read<SearchLocationCubit>().searchLocation(value);
                      }
                    },
                    onSubmitted: (value) {
                      widget.isSearchingInitialNotifier.value = false;
                      context.read<SearchLocationCubit>().searchLocation(value);
                    },
                  ),
                )
              : const Text(
                  'Create Geofence',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
          actions: [
            if (!isSearching)
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                    onTap: _toggleSearch, child: SvgPicture.asset('assets/icons/vehicle_geofence/search.svg')),
              ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
