import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpspro/domain/models/vehicle_event.dart';
import 'package:gpspro/presentation/screens/home_screen/events/cubit/events_cubit.dart';
import 'package:gpspro/presentation/screens/home_screen/events/widgets/event_page_view.dart';

class EventsTabBody extends StatefulWidget {
  final List<String> types;
  final DateTime selectedDate;

  const EventsTabBody({
    super.key,
    required this.types,
    required this.selectedDate,
  });

  @override
  State<EventsTabBody> createState() => _EventsTabBodyState();
}

class _EventsTabBodyState extends State<EventsTabBody> {
  final ScrollController _scrollController = ScrollController();
  int _page = 1;
  final int _limit = 10;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  List<VehicleEvent> _events = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _fetchEvents();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 &&
        !_isLoadingMore &&
        _hasMore) {
      _fetchMore();
    }
  }

  Future<void> _fetchEvents({bool isLoadMore = false}) async {
    setState(() => _isLoadingMore = true);

    final cubit = context.read<EventsCubit>();

    log('Fetching events for date: ${widget.selectedDate.toIso8601String()} page: $_page');

    await cubit.fetchEvents(
      types: widget.types,
      from: widget.selectedDate.toIso8601String(),
      to: widget.selectedDate.add(const Duration(days: 1)).toIso8601String(),
      limit: _limit,
      page: _page,
    );

    final state = cubit.state;
    state.whenOrNull(
      idle: (events, hasMore) {
        setState(() {
          // Replace list with cubit's combined list (no manual append)
          _events = events;
          _hasMore = hasMore;
        });
      },
      error: (message) {
        log('Error loading events: $message');
      },
    );

    setState(() => _isLoadingMore = false);
  }

  Future<void> _fetchMore() async {
    if (_isLoadingMore || !_hasMore) return;
    _page++;
    await _fetchEvents(isLoadMore: true);
  }

  @override
  Widget build(BuildContext context) {
    return EventsPageView(
      events: _events,
      hasMore: _hasMore,
      scrollController: _scrollController,
    );
  }
}
