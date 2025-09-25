import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/core/extensions/build_context.dart';
import 'package:gpspro/presentation/screens/home_screen/events/cubit/events_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/events/widgets/event_tab_body.dart';
import 'package:gpspro/presentation/screens/home_screen/events/widgets/events_filter.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  final PageController _pageController = PageController();

  int _currentPage = 1;
  final int _pageSize = 10;

  List<String> _currentTypes = EventsFilter.defaultTypes;
  final DateTime _selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  ).toUtc();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: EventsFilter.filters.length, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;

    final newTypes = EventsFilter.getTypesForFilter(EventsFilter.filters[_tabController.index]);
    setState(() {
      _currentTypes = newTypes;
      _currentPage = 1;
    });

    // _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await context.read<EventsCubit>().fetchEvents(
          types: _currentTypes,
          to: _selectedDate.add(const Duration(days: 1)).toIso8601String(),
          from: _selectedDate.toUtc().toIso8601String(),
          limit: _pageSize,
          page: _currentPage,
        );
  }

  @override
  Widget build(BuildContext context) {
    log('Selected date (UTC): $_selectedDate');

    return DefaultTabController(
      length: EventsFilter.filters.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Vehicle Events',
            style: context.textTheme.headlineSmall?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: TabBar.secondary(
            dividerHeight: 1,
            labelPadding: const EdgeInsets.symmetric(horizontal: 2),
            controller: _tabController,
            tabs: EventsFilter.filters.asMap().entries.map((entry) {
              final index = entry.key;
              final filter = entry.value;
              final isSelected = _tabController.index == index;

              final screenWidth = MediaQuery.of(context).size.width;
              final iconSize = screenWidth * 0.05;

              return Tab(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      EventsFilter.icons[index],
                      color: isSelected ? context.colorScheme.primary : Colors.grey,
                      size: iconSize,
                    ),
                    SizedBox(width: screenWidth * 0.010),
                    Text(
                      filter,
                      style: TextStyle(
                        fontSize: 13,
                        color: isSelected ? context.colorScheme.primary : Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TabBarView(
            controller: _tabController,
            children: EventsFilter.filters.map((filter) {
              final types = EventsFilter.getTypesForFilter(filter);
              return EventsTabBody(
                key: ValueKey(filter), // UNIQUE per tab
                types: types,
                selectedDate: _selectedDate,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
