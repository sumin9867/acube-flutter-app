import 'package:flutter/material.dart';
import 'package:gpspro/domain/models/vehicle_event.dart';
import 'package:gpspro/presentation/global_widgets/no_data_widget.dart';
import 'package:gpspro/presentation/screens/home_screen/events/events_map.dart';
import 'package:gpspro/presentation/screens/home_screen/events/widgets/event_card.dart';
import 'package:gpspro/presentation/screens/home_screen/events/widgets/event_shimmer_card.dart';
import 'package:intl/intl.dart';

class EventsPageView extends StatelessWidget {
  final List<VehicleEvent> events;
  final bool hasMore;
  final ScrollController scrollController;

  const EventsPageView({
    super.key,
    required this.events,
    required this.hasMore,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final grouped = _groupEventsByDate(events);

    if (events.isEmpty && hasMore) {
      return const EventCardShimmerList();
    }

    if (grouped.isEmpty) {
      return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2)),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const EventCardShimmerList();
          } else {
            return const NoDataWidget(subtitle: 'No events available');
          }
        },
      );
    }

    return ListView.builder(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.06),
      itemCount: grouped.length + (hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= grouped.length) {
          return const Padding(padding: EdgeInsets.all(16), child: EventCardShimmer());
        }

        final dateGroup = grouped[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 16, 8),
              child: Text(
                dateGroup.label,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .015,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...dateGroup.events.map((event) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      if (event.positionId != null) {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return Dialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height * .6,
                                width: MediaQuery.of(context).size.width * .9,
                                child: EventsMap(vehicleEvent: event),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: EventCard(event: event),
                  ),
                )),
          ],
        );
      },
    );
  }

  List<_GroupedEvents> _groupEventsByDate(List<VehicleEvent> events) {
    final now = DateTime.now();
    final Map<String, List<VehicleEvent>> groupedMap = {};

    for (var event in events) {
      final date = event.eventTime.toLocal();
      final diff = now.difference(DateTime(date.year, date.month, date.day)).inDays;

      final label = switch (diff) {
        0 => 'Today',
        1 => 'Yesterday',
        _ => DateFormat('d MMMM yyyy').format(date),
      };

      groupedMap.putIfAbsent(label, () => []).add(event);
    }

    return groupedMap.entries.map((e) => _GroupedEvents(label: e.key, events: e.value)).toList()
      ..sort((a, b) => b.events.first.eventTime.compareTo(a.events.first.eventTime));
  }
}

class _GroupedEvents {
  final String label;
  final List<VehicleEvent> events;

  _GroupedEvents({required this.label, required this.events});
}
