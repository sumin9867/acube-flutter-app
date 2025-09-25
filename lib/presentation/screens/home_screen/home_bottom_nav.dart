import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/gen/l10n/locale.dart';
import 'package:gpspro/presentation/global_cubit/websocket/websocket_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/devices_screen.dart';
import 'package:gpspro/presentation/screens/home_screen/events/events_screen.dart';
import 'package:gpspro/presentation/screens/home_screen/live_map/live_map_screen.dart';
import 'package:gpspro/presentation/screens/home_screen/preferences/preference_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({super.key});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<PersistentTabConfig> _buildTabConfig(BuildContext context) {
    final loc = context.locale;
    return [
      PersistentTabConfig(
        screen: const LiveMapScreen(),
        item: ItemConfig(
          icon: SvgPicture.asset('assets/icons/bottom_nav/selected_live.svg', height: 22),
          inactiveIcon: SvgPicture.asset('assets/icons/bottom_nav/live.svg', height: 22),
          title: loc.tabLive,
        ),
      ),
      PersistentTabConfig(
        screen: const DevicesScreen(),
        item: ItemConfig(
          inactiveIcon: SvgPicture.asset('assets/icons/bottom_nav/vehicle.svg', height: 18),
          icon: SvgPicture.asset('assets/icons/bottom_nav/selected_vehicle.svg', height: 18),
          title: loc.tabDevices,
        ),
      ),
      PersistentTabConfig(
        screen: const EventsScreen(),
        item: ItemConfig(
          icon: SvgPicture.asset('assets/icons/bottom_nav/selected_event.svg', height: 22),
          inactiveIcon: SvgPicture.asset('assets/icons/bottom_nav/event.svg', height: 22),
          title: loc.tabEvents,
        ),
      ),
      PersistentTabConfig(
        screen: const PreferenceScreen(),
        item: ItemConfig(
          icon: SvgPicture.asset('assets/icons/bottom_nav/selected_setting.svg', height: 22),
          inactiveIcon: SvgPicture.asset('assets/icons/bottom_nav/setting.svg', height: 22),
          title: loc.tabSettings,
        ),
      ),
    ];
  }

  void _handleWebSocket(int index) {
    final webSocketCubit = locator.get<WebsocketCubit>();
    if (index > 1) {
      webSocketCubit.disconnect();
    } else {
      webSocketCubit.reconnect();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      tabs: _buildTabConfig(context),
      navBarBuilder: (navBarConfig) => BottomNavigationStyle(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(border: Border.all()),
      ),
      onTabChanged: (index) => _handleWebSocket(index),
    );
  }
}

class BottomNavigationStyle extends StatelessWidget {
  const BottomNavigationStyle({
    required this.navBarConfig,
    this.navBarDecoration = const NavBarDecoration(),
    this.itemAnimationProperties = const ItemAnimation(),
    this.height,
    super.key,
  });

  final NavBarConfig navBarConfig;
  final NavBarDecoration navBarDecoration;
  final double? height;

  final ItemAnimation itemAnimationProperties;

  Widget _buildItem(ItemConfig item, bool isSelected) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconTheme(
            data: IconThemeData(
              size: item.iconSize,
              color: isSelected ? const Color.fromRGBO(18, 108, 192, 1) : item.inactiveForegroundColor,
            ),
            child: isSelected ? item.icon : item.inactiveIcon,
          ),
          const SizedBox(height: 7),
          if (item.title != null)
            FittedBox(
              child: Text(
                item.title!,
                style: item.textStyle
                    .apply(
                        color:
                            isSelected ? const Color.fromRGBO(18, 108, 192, 1) : const Color.fromRGBO(120, 118, 128, 1))
                    .copyWith(fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400, fontSize: 14),
              ),
            ),
          const SizedBox(height: 8),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final double itemWidth =
        (MediaQuery.of(context).size.width - navBarDecoration.padding.horizontal) / navBarConfig.items.length;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -2),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              AnimatedContainer(
                padding: EdgeInsets.zero,
                duration: itemAnimationProperties.duration,
                curve: itemAnimationProperties.curve,
                width: itemWidth * navBarConfig.selectedIndex,
                height: 2,
              ),
              AnimatedContainer(
                padding: EdgeInsets.zero,
                duration: itemAnimationProperties.duration,
                curve: itemAnimationProperties.curve,
                width: itemWidth,
                height: 2,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(18, 108, 192, 1),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: navBarConfig.items.map((item) {
              final int index = navBarConfig.items.indexOf(item);
              return Flexible(
                child: InkWell(
                  onTap: () {
                    navBarConfig.onItemSelected(index);
                  },
                  child: Center(
                    child: _buildItem(
                      item,
                      navBarConfig.selectedIndex == index,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
