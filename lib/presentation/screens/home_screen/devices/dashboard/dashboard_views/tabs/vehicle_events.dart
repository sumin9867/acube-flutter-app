import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/core/di/get_injectable.dart';
import 'package:gpspro/domain/models/Device.dart';
import 'package:gpspro/domain/models/vehicle_event.dart';
import 'package:gpspro/presentation/global_widgets/no_data_widget.dart';
import 'package:gpspro/presentation/repository/i_event_repo.dart';
import 'package:gpspro/presentation/screens/home_screen/devices/widgets/vehicle_event_timeline_tile.dart';
import 'package:gpspro/presentation/screens/home_screen/events/cubit/cubit/single_event_cubit.dart';
import 'package:intl/intl.dart';

class VehicleDashboardEventsView extends StatefulWidget {
  const VehicleDashboardEventsView({
    super.key,
    required this.device,
    required this.start,
    required this.end,
  });

  final Device device;
  final DateTime start;
  final DateTime end;

  @override
  State<VehicleDashboardEventsView> createState() => _VehicleDashboardEventsViewState();
}

class _VehicleDashboardEventsViewState extends State<VehicleDashboardEventsView> {
  final int _pageSize = 10;
  int _currentPage = 1;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  bool _isInitialLoading = true; // 👈 Added: to delay "no data"
  final ScrollController _scrollController = ScrollController();

  final List<VehicleEvent> _events = [];
  final Map<String, String> _eventAddresses = {}; // store addresses by event id

  @override
  void initState() {
    super.initState();
    _fetchEvents();
    _scrollController.addListener(_scrollListener);

    // 👇 Wait at least 5 seconds before allowing "No Data" state
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _isInitialLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchEvents() async {
    if (!_hasMore) return; // stop fetching if no more data

    final cubit = context.read<SingleEventCubit>();
    await cubit.fetchEvents(
      types: [
        'commandResult',
        'deviceInactive',
        'queuedCommandSent',
        'deviceMoving',
        'deviceStopped',
        'deviceOverspeed',
        'deviceFuelDrop',
        'deviceFuelIncrease',
        'geofenceEnter',
        'geofenceExit',
        'ignitionOn',
        'alarm',
        'ignitionOff',
        'maintenance',
        'textMessage',
        'driverChanged',
        'media',
      ],
      from: widget.start.toIso8601String(),
      to: widget.end.toIso8601String(),
      limit: _pageSize,
      page: _currentPage,
      deviceId: widget.device.id.toString(),
    );

    // Get events from cubit state
    final state = cubit.state;
    state.maybeWhen(
      idle: (events, hasMore) async {
        // Check for duplicates
        final newEvents = events.where((e) => !_events.any((x) => x.id == e.id)).toList();

        _events.addAll(newEvents);

        // Fetch addresses for new events
        await Future.wait(newEvents.map((event) async {
          if (event.positionId != null) {
            final data = await locator
                .get<EventRepo>()
                .getPositionById(event.positionId.toString(), widget.device.id.toString());
            _eventAddresses[event.id.toString()] = data.isNotEmpty ? data.first.address ?? 'No address' : 'No address';
          } else {
            _eventAddresses[event.id.toString()] = 'No location';
          }
        }));

        _hasMore = hasMore; // update hasMore from cubit
        setState(() {});
      },
      orElse: () {},
    );
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 &&
        !_isLoadingMore &&
        _hasMore) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    if (!_hasMore) return;

    setState(() => _isLoadingMore = true);
    _currentPage++;
    await _fetchEvents();
    setState(() => _isLoadingMore = false);
  }

  Map<String, List<VehicleEvent>> _groupEventsByDate(List<VehicleEvent> events) {
    final Map<String, List<VehicleEvent>> grouped = {};
    for (final e in events) {
      final dateKey = e.eventTime.toLocal().toIso8601String().split('T').first;
      grouped.putIfAbsent(dateKey, () => []).add(e);
    }
    final sortedKeys = grouped.keys.toList()..sort((a, b) => b.compareTo(a));
    return {for (var k in sortedKeys) k: grouped[k]!};
  }

  String _getHeaderLabel(String dateKey) {
    final date = DateTime.parse(dateKey);
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));
    if (date.year == now.year && date.month == now.month && date.day == now.day) return 'Today';
    if (date.year == yesterday.year && date.month == yesterday.month && date.day == yesterday.day) return 'Yesterday';
    return DateFormat('dd MMM').format(date);
  }

  @override
  Widget build(BuildContext context) {
    // Show spinner during loading phase or first 5 seconds
    if (_events.isEmpty && (_isLoadingMore || _isInitialLoading)) {
      return const Center(child: CircularProgressIndicator());
    }

    // No data case (after 5s)
    if (_events.isEmpty && !_isLoadingMore && !_isInitialLoading) {
      return const NoDataWidget(
        subtitle: 'No event found',
      );
    }

    final groupedEvents = _groupEventsByDate(_events);

    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        for (final dateKey in groupedEvents.keys)
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFF1F1F1), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      _getHeaderLabel(dateKey),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ...groupedEvents[dateKey]!.asMap().entries.map((entry) {
                    final idx = entry.key;
                    final event = entry.value;
                    return VehicleEventTimelineTile(
                      event: event,
                      isFirst: idx == 0,
                      isLast: idx == groupedEvents[dateKey]!.length - 1,
                      address: _eventAddresses[event.id.toString()],
                    );
                  }),
                ],
              ),
            ),
          ),
        if (_isLoadingMore)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
      ],
    );
  }
}
