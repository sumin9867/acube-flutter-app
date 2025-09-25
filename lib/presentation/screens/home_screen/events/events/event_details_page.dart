// formatTimereadshortss(event.eventTime),

// class ReportEventArgument {
//   final int eventId;
//   final int positionId;
//   final Map<String, dynamic> attributes;
//   final String type;
//   final String name;

//   ReportEventArgument(
//       this.eventId, this.positionId, this.attributes, this.type, this.name);
// }
// while navigating to the EventDetailsPage, pass the arguments as shown above.

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:gpspro/core/di/get_injectable.dart';
// import 'package:gpspro/domain/models/Event.dart';
// import 'package:gpspro/domain/models/PositionModel.dart';
// import 'package:gpspro/gen/l10n/locale.dart';
// import 'package:gpspro/presentation/screens/CommonMethod.dart';
// import 'package:gpspro/presentation/screens/events/widgets/event_card.dart';
// import 'package:gpspro/repository/i_event_repo.dart';
// import 'package:gpspro/theme/app_colors.dart';
// import 'package:line_icons/line_icons.dart';

// class EventDetailsPage extends StatefulWidget {
//   const EventDetailsPage({super.key});

//   @override
//   EventDetailsPageState createState() => EventDetailsPageState();
// }

// class EventDetailsPageState extends State<EventDetailsPage> {
//   final Completer<GoogleMapController> _controller = Completer();
//   late GoogleMapController mapController;
//   late StreamController<int> _postsController;
//   final MapType _currentMapType = MapType.normal;
//   static late ReportEventArgument args;
//   Set<Marker> _markers = <Marker>{};
//   late Timer _timer;
//   late PositionModel position;
//   late Event event;
//   late String _mapStyle;

//   @override
//   void initState() {
//     _postsController = StreamController();
//     getPosition();
//     rootBundle.loadString('assets/style.json').then((string) {
//       _mapStyle = string;
//     });
//     super.initState();
//   }

//   void getPosition() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (args != null) _timer.cancel();
//       locator
//           .get<EventRepo>()
//           .getEventById(args.eventId.toString())
//           .then((event) => {
//                 locator
//                     .get<EventRepo>()
//                     .getPositionById(
//                         event.positionId!.toString(), event.deviceId.toString())
//                     .then((value) => {addMarkers(value.single, event)})
//               });
//     });
//   }

//   void addMarkers(PositionModel pos, Event e) async {
//     position = pos;
//     event = e;
//     _postsController.add(1);
//     CameraPosition cPosition = CameraPosition(
//       target: LatLng(pos.latitude!, pos.longitude!),
//       zoom: 16,
//     );
//     final GoogleMapController controller = await _controller.future;
//     controller.moveCamera(CameraUpdate.newCameraPosition(cPosition));
//     var iconPath;
//     if (event.type == 'alarm') {
//       iconPath = 'images/alarm_event.png';
//     } else {
//       iconPath = 'images/normal_event.png';
//     }
//     final Uint8List? markerIcon = await getBytesFromAsset(iconPath, 70);
//     _markers = Set<Marker>();
//     _markers.add(Marker(
//       markerId: MarkerId(pos.deviceId.toString()),
//       position: LatLng(pos.latitude!, pos.longitude!), // updated position
//       icon: BitmapDescriptor.fromBytes(markerIcon!),
//     ));
//     setState(() {});
//   }

//   static const CameraPosition _initialRegion = CameraPosition(
//     target: LatLng(0, 0),
//     zoom: 0,
//   );

//   @override
//   void dispose() {
//     if (_timer.isActive) {
//       _timer.cancel();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     args = ModalRoute.of(context)?.settings.arguments as ReportEventArgument;
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: Text(args.name, style: const TextStyle(color: Colors.black)),
//           iconTheme: const IconThemeData(
//             color: Colors.black, //change your color here
//           ),
//         ),
//         body: streamLoad());
//   }

//   Widget streamLoad() {
//     return StreamBuilder<int>(
//         stream: _postsController.stream,
//         builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//           if (snapshot.hasData) {
//             return loadMap();
//           } else if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             return Center(
//               child: Text(context.locale.noData),
//             );
//           }
//         });
//   }

//   Widget loadMap() {
//     return Stack(
//       children: <Widget>[
//         GoogleMap(
//           mapType: _currentMapType,
//           initialCameraPosition: _initialRegion,
//           // myLocationButtonEnabled: false,
//           // myLocationEnabled: true,
//           // onMapCreated: (GoogleMapController controller) {
//           //   controller.setMapStyle(_mapStyle);
//           //   _controller.complete(controller);
//           //   mapController = controller;
//           // },
//           // markers: _markers,
//           // onTap: (LatLng latLng) {},
//         ),
//         position != null ? bottomWindow() : Container()
//       ],
//     );
//   }

//   Widget bottomWindow() {
//     String result;
//     if (event.attributes?.containsKey('result') == true) {
//       result = event.attributes!['result'];
//     } else {
//       result = '';
//     }
//     return Positioned(
//         bottom: 0,
//         right: 0,
//         left: 0,
//         child: Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//                 //margin: EdgeInsets.all(10),
//                 margin: const EdgeInsets.fromLTRB(10, 0, 10, 30),
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: const BorderRadius.all(Radius.circular(10)),
//                     boxShadow: <BoxShadow>[
//                       BoxShadow(
//                           blurRadius: 20,
//                           offset: Offset.zero,
//                           color: Colors.grey.withOpacity(0.5))
//                     ]),
//                 child: Column(
//                   children: <Widget>[
//                     IntrinsicHeight(
//                       child: Row(
//                         children: [
//                           Container(
//                               padding:
//                                   const EdgeInsets.only(top: 3.0, left: 5.0),
//                               child: Row(
//                                 children: <Widget>[
//                                   Container(
//                                     padding: const EdgeInsets.only(left: 3.0),
//                                     child: Icon(Icons.event_note,
//                                         color: AppColors.primaryColor,
//                                         size: 25.0),
//                                   ),
//                                 ],
//                               )),
//                           Container(
//                             padding: const EdgeInsets.only(
//                                 top: 5.0, left: 5.0, right: 10.0),
//                             child: Text(
//                               event.type ?? '',
//                               style: const TextStyle(fontSize: 20.0),
//                             ),
//                           ),
//                           // VerticalDivider(),
//                         ],
//                       ),
//                     ),
//                     const Divider(),
//                     position.address != null
//                         ? Row(
//                             children: <Widget>[
//                               Icon(LineIcons.mapPin,
//                                   color: AppColors.primaryColor, size: 22.0),
//                               Container(
//                                 width: MediaQuery.of(context).size.width * 0.75,
//                                 child: Text(
//                                   position.address ?? '',
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                       fontSize: 15, color: Colors.blue[600]),
//                                 ),
//                               )
//                             ],
//                           )
//                         : Container(),
//                     // result.isNotEmpty
//                     //     ? Row(
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: <Widget>[
//                     //           Container(
//                     //             padding: EdgeInsets.only(left: 5.0),
//                     //             child: Icon(Icons.comment,
//                     //                 color: AppColors.primaryColor,
//                     //                 size: 20.0),
//                     //           ),
//                     //           Expanded(
//                     //             child: Column(children: [
//                     //               Padding(
//                     //                   padding: EdgeInsets.only(
//                     //                       top: 10.0, left: 5.0, right: 0),
//                     //                   child: Text(
//                     //                     result,
//                     //                     maxLines: 7,
//                     //                     overflow: TextOverflow.ellipsis,
//                     //                   )),
//                     //             ]),
//                     //           )
//                     //         ],
//                     //       )
//                     //     : new Container(),
//                     Row(
//                       children: [
//                         Container(
//                             padding: const EdgeInsets.only(top: 3.0, left: 0.0),
//                             child: Row(
//                               children: <Widget>[
//                                 Container(
//                                   padding: const EdgeInsets.only(left: 5.0),
//                                   child: Icon(Icons.access_time_outlined,
//                                       color: AppColors.primaryColor,
//                                       size: 15.0),
//                                 ),
//                               ],
//                             )),
//                         Container(
//                             padding: const EdgeInsets.only(
//                                 top: 5.0, left: 5.0, right: 10.0),
//                             child: Text(
//                               formatTime(position.serverTime),
//                               style: TextStyle(
//                                   fontSize: 13, color: Colors.grey[600]),
//                             )),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                             padding: const EdgeInsets.only(top: 3.0, left: 0.0),
//                             child: Row(
//                               children: <Widget>[
//                                 Container(
//                                   padding: const EdgeInsets.only(left: 3.0),
//                                   child: Icon(Icons.speed,
//                                       color: AppColors.primaryColor,
//                                       size: 20.0),
//                                 ),
//                               ],
//                             )),
//                         Container(
//                             padding: const EdgeInsets.only(
//                                 top: 5.0, left: 5.0, right: 10.0),
//                             child: Text(convertSpeed(position.speed!))),
//                       ],
//                     ),
//                   ],
//                 ))));
//   }
// }
