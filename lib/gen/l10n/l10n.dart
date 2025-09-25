// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: '', args: []);
  }

  /// `Acceleration`
  String get acceleration {
    return Intl.message(
      'Acceleration',
      name: 'acceleration',
      desc: '',
      args: [],
    );
  }

  /// `Account Expired`
  String get accountExpired {
    return Intl.message(
      'Account Expired',
      name: 'accountExpired',
      desc: '',
      args: [],
    );
  }

  /// `Accuracy`
  String get accuracy {
    return Intl.message('Accuracy', name: 'accuracy', desc: '', args: []);
  }

  /// `Add Geofence`
  String get addGeofence {
    return Intl.message(
      'Add Geofence',
      name: 'addGeofence',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Address not found ....!`
  String get address_not_found {
    return Intl.message(
      'Address not found ....!',
      name: 'address_not_found',
      desc: '',
      args: [],
    );
  }

  /// `After Installation:`
  String get afterInstallation {
    return Intl.message(
      'After Installation:',
      name: 'afterInstallation',
      desc: '',
      args: [],
    );
  }

  /// `Installation is completed as per video illustration`
  String get afterInstallationNote1 {
    return Intl.message(
      'Installation is completed as per video illustration',
      name: 'afterInstallationNote1',
      desc: '',
      args: [],
    );
  }

  /// `LED (satellite) is stable`
  String get afterInstallationNote2 {
    return Intl.message(
      'LED (satellite) is stable',
      name: 'afterInstallationNote2',
      desc: '',
      args: [],
    );
  }

  /// `LED (network) is stable`
  String get afterInstallationNote3 {
    return Intl.message(
      'LED (network) is stable',
      name: 'afterInstallationNote3',
      desc: '',
      args: [],
    );
  }

  /// `Alarm`
  String get alarm {
    return Intl.message('Alarm', name: 'alarm', desc: '', args: []);
  }

  /// `Accident`
  String get alarmAccident {
    return Intl.message('Accident', name: 'alarmAccident', desc: '', args: []);
  }

  /// `Arm Alarm`
  String get alarmArm {
    return Intl.message('Arm Alarm', name: 'alarmArm', desc: '', args: []);
  }

  /// `Bonnet`
  String get alarmBonnet {
    return Intl.message('Bonnet', name: 'alarmBonnet', desc: '', args: []);
  }

  /// `Disarm Alarm`
  String get alarmDisarm {
    return Intl.message(
      'Disarm Alarm',
      name: 'alarmDisarm',
      desc: '',
      args: [],
    );
  }

  /// `Dismiss Alarm`
  String get alarmDismiss {
    return Intl.message(
      'Dismiss Alarm',
      name: 'alarmDismiss',
      desc: '',
      args: [],
    );
  }

  /// `Door`
  String get alarmDoor {
    return Intl.message('Door', name: 'alarmDoor', desc: '', args: []);
  }

  /// `Fall Down`
  String get alarmFallDown {
    return Intl.message('Fall Down', name: 'alarmFallDown', desc: '', args: []);
  }

  /// `Fatigue Driving`
  String get alarmFatigueDriving {
    return Intl.message(
      'Fatigue Driving',
      name: 'alarmFatigueDriving',
      desc: '',
      args: [],
    );
  }

  /// `Fault`
  String get alarmFault {
    return Intl.message('Fault', name: 'alarmFault', desc: '', args: []);
  }

  /// `Foot Brake`
  String get alarmFootBrake {
    return Intl.message(
      'Foot Brake',
      name: 'alarmFootBrake',
      desc: '',
      args: [],
    );
  }

  /// `Fuel Leak`
  String get alarmFuelLeak {
    return Intl.message('Fuel Leak', name: 'alarmFuelLeak', desc: '', args: []);
  }

  /// `General`
  String get alarmGeneral {
    return Intl.message('General', name: 'alarmGeneral', desc: '', args: []);
  }

  /// `Geofence`
  String get alarmGeofence {
    return Intl.message('Geofence', name: 'alarmGeofence', desc: '', args: []);
  }

  /// `Geofence Enter`
  String get alarmGeofenceEnter {
    return Intl.message(
      'Geofence Enter',
      name: 'alarmGeofenceEnter',
      desc: '',
      args: [],
    );
  }

  /// `Geofence Exit`
  String get alarmGeofenceExit {
    return Intl.message(
      'Geofence Exit',
      name: 'alarmGeofenceExit',
      desc: '',
      args: [],
    );
  }

  /// `GPS Antenna Cut`
  String get alarmGpsAntennaCut {
    return Intl.message(
      'GPS Antenna Cut',
      name: 'alarmGpsAntennaCut',
      desc: '',
      args: [],
    );
  }

  /// `Hard Acceleration`
  String get alarmHardAcceleration {
    return Intl.message(
      'Hard Acceleration',
      name: 'alarmHardAcceleration',
      desc: '',
      args: [],
    );
  }

  /// `Hard Braking`
  String get alarmHardBraking {
    return Intl.message(
      'Hard Braking',
      name: 'alarmHardBraking',
      desc: '',
      args: [],
    );
  }

  /// `Hard Cornering`
  String get alarmHardCornering {
    return Intl.message(
      'Hard Cornering',
      name: 'alarmHardCornering',
      desc: '',
      args: [],
    );
  }

  /// `High RPM`
  String get alarmHighRpm {
    return Intl.message('High RPM', name: 'alarmHighRpm', desc: '', args: []);
  }

  /// `Idle`
  String get alarmIdle {
    return Intl.message('Idle', name: 'alarmIdle', desc: '', args: []);
  }

  /// `Jamming`
  String get alarmJamming {
    return Intl.message('Jamming', name: 'alarmJamming', desc: '', args: []);
  }

  /// `Lane Change`
  String get alarmLaneChange {
    return Intl.message(
      'Lane Change',
      name: 'alarmLaneChange',
      desc: '',
      args: [],
    );
  }

  /// `Lock`
  String get alarmLock {
    return Intl.message('Lock', name: 'alarmLock', desc: '', args: []);
  }

  /// `Low Battery`
  String get alarmLowBattery {
    return Intl.message(
      'Low Battery',
      name: 'alarmLowBattery',
      desc: '',
      args: [],
    );
  }

  /// `Low Power`
  String get alarmLowPower {
    return Intl.message('Low Power', name: 'alarmLowPower', desc: '', args: []);
  }

  /// `Low Speed`
  String get alarmLowspeed {
    return Intl.message('Low Speed', name: 'alarmLowspeed', desc: '', args: []);
  }

  /// `Movement`
  String get alarmMovement {
    return Intl.message('Movement', name: 'alarmMovement', desc: '', args: []);
  }

  /// `Overspeed`
  String get alarmOverspeed {
    return Intl.message(
      'Overspeed',
      name: 'alarmOverspeed',
      desc: '',
      args: [],
    );
  }

  /// `Parking`
  String get alarmParking {
    return Intl.message('Parking', name: 'alarmParking', desc: '', args: []);
  }

  /// `Power Cut`
  String get alarmPowerCut {
    return Intl.message('Power Cut', name: 'alarmPowerCut', desc: '', args: []);
  }

  /// `Power Off`
  String get alarmPowerOff {
    return Intl.message('Power Off', name: 'alarmPowerOff', desc: '', args: []);
  }

  /// `Power On`
  String get alarmPowerOn {
    return Intl.message('Power On', name: 'alarmPowerOn', desc: '', args: []);
  }

  /// `Power Restored`
  String get alarmPowerRestored {
    return Intl.message(
      'Power Restored',
      name: 'alarmPowerRestored',
      desc: '',
      args: [],
    );
  }

  /// `Removing`
  String get alarmRemoving {
    return Intl.message('Removing', name: 'alarmRemoving', desc: '', args: []);
  }

  /// `Shock`
  String get alarmShock {
    return Intl.message('Shock', name: 'alarmShock', desc: '', args: []);
  }

  /// `SOS`
  String get alarmSos {
    return Intl.message('SOS', name: 'alarmSos', desc: '', args: []);
  }

  /// `Tampering`
  String get alarmTampering {
    return Intl.message(
      'Tampering',
      name: 'alarmTampering',
      desc: '',
      args: [],
    );
  }

  /// `Temperature`
  String get alarmTemperature {
    return Intl.message(
      'Temperature',
      name: 'alarmTemperature',
      desc: '',
      args: [],
    );
  }

  /// `Tow`
  String get alarmTow {
    return Intl.message('Tow', name: 'alarmTow', desc: '', args: []);
  }

  /// `Unlock`
  String get alarmUnlock {
    return Intl.message('Unlock', name: 'alarmUnlock', desc: '', args: []);
  }

  /// `Vibration`
  String get alarmVibration {
    return Intl.message(
      'Vibration',
      name: 'alarmVibration',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Altitude`
  String get altitude {
    return Intl.message('Altitude', name: 'altitude', desc: '', args: []);
  }

  /// `Anti-theft`
  String get antitheft {
    return Intl.message('Anti-theft', name: 'antitheft', desc: '', args: []);
  }

  /// `''Antitheft mode is a security feature. It triggers an alarm on your phone(s) in two cases:!\n      • If vehicle's ignition is turned on.\n      • if vehicle is moved out of the Anti theft safe zone by towing/pushing or any other means.''`
  String get antitheftImportantMessage {
    return Intl.message(
      '\'\'Antitheft mode is a security feature. It triggers an alarm on your phone(s) in two cases:!\n      • If vehicle\'s ignition is turned on.\n      • if vehicle is moved out of the Anti theft safe zone by towing/pushing or any other means.\'\'',
      name: 'antitheftImportantMessage',
      desc: '',
      args: [],
    );
  }

  /// `Approximate`
  String get approximate {
    return Intl.message('Approximate', name: 'approximate', desc: '', args: []);
  }

  /// `Archive`
  String get archive {
    return Intl.message('Archive', name: 'archive', desc: '', args: []);
  }

  /// `Are you sure?`
  String get areYouSure {
    return Intl.message(
      'Are you sure?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Armed`
  String get armed {
    return Intl.message('Armed', name: 'armed', desc: '', args: []);
  }

  /// `Audio`
  String get audio {
    return Intl.message('Audio', name: 'audio', desc: '', args: []);
  }

  /// `Battery`
  String get battery {
    return Intl.message('Battery', name: 'battery', desc: '', args: []);
  }

  /// `Battery Level`
  String get batteryLevel {
    return Intl.message(
      'Battery Level',
      name: 'batteryLevel',
      desc: '',
      args: [],
    );
  }

  /// `Blocked`
  String get blocked {
    return Intl.message('Blocked', name: 'blocked', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Cannot add this device, contact support.`
  String get cannotAddThisDeviceContactSupport {
    return Intl.message(
      'Cannot add this device, contact support.',
      name: 'cannotAddThisDeviceContactSupport',
      desc: '',
      args: [],
    );
  }

  /// `Animal`
  String get categoryAnimal {
    return Intl.message('Animal', name: 'categoryAnimal', desc: '', args: []);
  }

  /// `Arrow`
  String get categoryArrow {
    return Intl.message('Arrow', name: 'categoryArrow', desc: '', args: []);
  }

  /// `Bicycle`
  String get categoryBicycle {
    return Intl.message('Bicycle', name: 'categoryBicycle', desc: '', args: []);
  }

  /// `Boat`
  String get categoryBoat {
    return Intl.message('Boat', name: 'categoryBoat', desc: '', args: []);
  }

  /// `Bus`
  String get categoryBus {
    return Intl.message('Bus', name: 'categoryBus', desc: '', args: []);
  }

  /// `Car`
  String get categoryCar {
    return Intl.message('Car', name: 'categoryCar', desc: '', args: []);
  }

  /// `Crane`
  String get categoryCrane {
    return Intl.message('Crane', name: 'categoryCrane', desc: '', args: []);
  }

  /// `Default`
  String get categoryDefault {
    return Intl.message('Default', name: 'categoryDefault', desc: '', args: []);
  }

  /// `Helicopter`
  String get categoryHelicopter {
    return Intl.message(
      'Helicopter',
      name: 'categoryHelicopter',
      desc: '',
      args: [],
    );
  }

  /// `Motorcycle`
  String get categoryMotorcycle {
    return Intl.message(
      'Motorcycle',
      name: 'categoryMotorcycle',
      desc: '',
      args: [],
    );
  }

  /// `Offroad`
  String get categoryOffroad {
    return Intl.message('Offroad', name: 'categoryOffroad', desc: '', args: []);
  }

  /// `Person`
  String get categoryPerson {
    return Intl.message('Person', name: 'categoryPerson', desc: '', args: []);
  }

  /// `Pickup`
  String get categoryPickup {
    return Intl.message('Pickup', name: 'categoryPickup', desc: '', args: []);
  }

  /// `Plane`
  String get categoryPlane {
    return Intl.message('Plane', name: 'categoryPlane', desc: '', args: []);
  }

  /// `Scooter`
  String get categoryScooter {
    return Intl.message('Scooter', name: 'categoryScooter', desc: '', args: []);
  }

  /// `Ship`
  String get categoryShip {
    return Intl.message('Ship', name: 'categoryShip', desc: '', args: []);
  }

  /// `Tractor`
  String get categoryTractor {
    return Intl.message('Tractor', name: 'categoryTractor', desc: '', args: []);
  }

  /// `Train`
  String get categoryTrain {
    return Intl.message('Train', name: 'categoryTrain', desc: '', args: []);
  }

  /// `Tram`
  String get categoryTram {
    return Intl.message('Tram', name: 'categoryTram', desc: '', args: []);
  }

  /// `Trolleybus`
  String get categoryTrolleybus {
    return Intl.message(
      'Trolleybus',
      name: 'categoryTrolleybus',
      desc: '',
      args: [],
    );
  }

  /// `Truck`
  String get categoryTruck {
    return Intl.message('Truck', name: 'categoryTruck', desc: '', args: []);
  }

  /// `Van`
  String get categoryVan {
    return Intl.message('Van', name: 'categoryVan', desc: '', args: []);
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Charge`
  String get charge {
    return Intl.message('Charge', name: 'charge', desc: '', args: []);
  }

  /// `CHECK THE BACK SIDE OF THE DEVICE`
  String get checkTheBackSideOfTheDevice {
    return Intl.message(
      'CHECK THE BACK SIDE OF THE DEVICE',
      name: 'checkTheBackSideOfTheDevice',
      desc: '',
      args: [],
    );
  }

  /// `Click here`
  String get clickHereToScanBarCodePart1 {
    return Intl.message(
      'Click here',
      name: 'clickHereToScanBarCodePart1',
      desc: '',
      args: [],
    );
  }

  /// `to scan bar code`
  String get clickHereToScanBarCodePart2 {
    return Intl.message(
      'to scan bar code',
      name: 'clickHereToScanBarCodePart2',
      desc: '',
      args: [],
    );
  }

  /// `Command`
  String get command {
    return Intl.message('Command', name: 'command', desc: '', args: []);
  }

  /// `Command Sent`
  String get command_sent {
    return Intl.message(
      'Command Sent',
      name: 'command_sent',
      desc: '',
      args: [],
    );
  }

  /// `Device Identification`
  String get commandDeviceIdentification {
    return Intl.message(
      'Device Identification',
      name: 'commandDeviceIdentification',
      desc: '',
      args: [],
    );
  }

  /// `Periodic Reporting`
  String get commandPositionPeriodic {
    return Intl.message(
      'Periodic Reporting',
      name: 'commandPositionPeriodic',
      desc: '',
      args: [],
    );
  }

  /// `Single Reporting`
  String get commandPositionSingle {
    return Intl.message(
      'Single Reporting',
      name: 'commandPositionSingle',
      desc: '',
      args: [],
    );
  }

  /// `Stop Reporting`
  String get commandPositionStop {
    return Intl.message(
      'Stop Reporting',
      name: 'commandPositionStop',
      desc: '',
      args: [],
    );
  }

  /// `Command queued`
  String get commandQueued {
    return Intl.message(
      'Command queued',
      name: 'commandQueued',
      desc: '',
      args: [],
    );
  }

  /// `Command result`
  String get commandResult {
    return Intl.message(
      'Command result',
      name: 'commandResult',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get commandSend {
    return Intl.message('Send', name: 'commandSend', desc: '', args: []);
  }

  /// `Command sent`
  String get commandSent {
    return Intl.message(
      'Command sent',
      name: 'commandSent',
      desc: '',
      args: [],
    );
  }

  /// `Command`
  String get commandTitle {
    return Intl.message('Command', name: 'commandTitle', desc: '', args: []);
  }

  /// `Unit`
  String get commandUnit {
    return Intl.message('Unit', name: 'commandUnit', desc: '', args: []);
  }

  /// `Configuration`
  String get configuration {
    return Intl.message(
      'Configuration',
      name: 'configuration',
      desc: '',
      args: [],
    );
  }

  /// `Course`
  String get course {
    return Intl.message('Course', name: 'course', desc: '', args: []);
  }

  /// `Custom command`
  String get customCommand {
    return Intl.message(
      'Custom command',
      name: 'customCommand',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message('Dashboard', name: 'dashboard', desc: '', args: []);
  }

  /// `Data`
  String get data {
    return Intl.message('Data', name: 'data', desc: '', args: []);
  }

  /// `Device Dashboard`
  String get device_dashboard {
    return Intl.message(
      'Device Dashboard',
      name: 'device_dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Device Info`
  String get device_info {
    return Intl.message('Device Info', name: 'device_info', desc: '', args: []);
  }

  /// `Category`
  String get deviceCategory {
    return Intl.message('Category', name: 'deviceCategory', desc: '', args: []);
  }

  /// `Command`
  String get deviceCommand {
    return Intl.message('Command', name: 'deviceCommand', desc: '', args: []);
  }

  /// `Contact`
  String get deviceContact {
    return Intl.message('Contact', name: 'deviceContact', desc: '', args: []);
  }

  /// `Follow`
  String get deviceFollow {
    return Intl.message('Follow', name: 'deviceFollow', desc: '', args: []);
  }

  /// `Fuel drop`
  String get deviceFuelDrop {
    return Intl.message(
      'Fuel drop',
      name: 'deviceFuelDrop',
      desc: '',
      args: [],
    );
  }

  /// `Identifier`
  String get deviceIdentifier {
    return Intl.message(
      'Identifier',
      name: 'deviceIdentifier',
      desc: '',
      args: [],
    );
  }

  /// `Device inactive`
  String get deviceInactive {
    return Intl.message(
      'Device inactive',
      name: 'deviceInactive',
      desc: '',
      args: [],
    );
  }

  /// `Last Update`
  String get deviceLastUpdate {
    return Intl.message(
      'Last Update',
      name: 'deviceLastUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Model`
  String get deviceModel {
    return Intl.message('Model', name: 'deviceModel', desc: '', args: []);
  }

  /// `Device moving`
  String get deviceMoving {
    return Intl.message(
      'Device moving',
      name: 'deviceMoving',
      desc: '',
      args: [],
    );
  }

  /// `Status offline`
  String get deviceOffline {
    return Intl.message(
      'Status offline',
      name: 'deviceOffline',
      desc: '',
      args: [],
    );
  }

  /// `Status online`
  String get deviceOnline {
    return Intl.message(
      'Status online',
      name: 'deviceOnline',
      desc: '',
      args: [],
    );
  }

  /// `Speed limit exceeded`
  String get deviceOverspeed {
    return Intl.message(
      'Speed limit exceeded',
      name: 'deviceOverspeed',
      desc: '',
      args: [],
    );
  }

  /// `Device Registered`
  String get deviceRegistered {
    return Intl.message(
      'Device Registered',
      name: 'deviceRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Devices and State`
  String get devicesAndState {
    return Intl.message(
      'Devices and State',
      name: 'devicesAndState',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get deviceStatus {
    return Intl.message('Status', name: 'deviceStatus', desc: '', args: []);
  }

  /// `Offline`
  String get deviceStatusOffline {
    return Intl.message(
      'Offline',
      name: 'deviceStatusOffline',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get deviceStatusOnline {
    return Intl.message(
      'Online',
      name: 'deviceStatusOnline',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get deviceStatusUnknown {
    return Intl.message(
      'Unknown',
      name: 'deviceStatusUnknown',
      desc: '',
      args: [],
    );
  }

  /// `Device stopped`
  String get deviceStopped {
    return Intl.message(
      'Device stopped',
      name: 'deviceStopped',
      desc: '',
      args: [],
    );
  }

  /// `Device Temperature`
  String get deviceTemp {
    return Intl.message(
      'Device Temperature',
      name: 'deviceTemp',
      desc: '',
      args: [],
    );
  }

  /// `Devices`
  String get deviceTitle {
    return Intl.message('Devices', name: 'deviceTitle', desc: '', args: []);
  }

  /// `Total Distance`
  String get deviceTotalDistance {
    return Intl.message(
      'Total Distance',
      name: 'deviceTotalDistance',
      desc: '',
      args: [],
    );
  }

  /// `Device Type`
  String get deviceType {
    return Intl.message('Device Type', name: 'deviceType', desc: '', args: []);
  }

  /// `Status unknown`
  String get deviceUnknown {
    return Intl.message(
      'Status unknown',
      name: 'deviceUnknown',
      desc: '',
      args: [],
    );
  }

  /// `Disable Popup Notifications`
  String get diablePopupNotification {
    return Intl.message(
      'Disable Popup Notifications',
      name: 'diablePopupNotification',
      desc: '',
      args: [],
    );
  }

  /// `Distance`
  String get distance {
    return Intl.message('Distance', name: 'distance', desc: '', args: []);
  }

  /// `Distance Length`
  String get distanceLength {
    return Intl.message(
      'Distance Length',
      name: 'distanceLength',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `Driver changed`
  String get driverChanged {
    return Intl.message(
      'Driver changed',
      name: 'driverChanged',
      desc: '',
      args: [],
    );
  }

  /// `Driver Unique Id`
  String get driverUniqueId {
    return Intl.message(
      'Driver Unique Id',
      name: 'driverUniqueId',
      desc: '',
      args: [],
    );
  }

  /// `DTCs`
  String get dtcs {
    return Intl.message('DTCs', name: 'dtcs', desc: '', args: []);
  }

  /// `Enter your Email`
  String get emailTextfieldHint {
    return Intl.message(
      'Enter your Email',
      name: 'emailTextfieldHint',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailTextfieldTitle {
    return Intl.message(
      'Email',
      name: 'emailTextfieldTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enable`
  String get enable {
    return Intl.message('Enable', name: 'enable', desc: '', args: []);
  }

  /// `Engine Resume`
  String get engineResume {
    return Intl.message(
      'Engine Resume',
      name: 'engineResume',
      desc: '',
      args: [],
    );
  }

  /// `Engine Stop`
  String get engineStop {
    return Intl.message('Engine Stop', name: 'engineStop', desc: '', args: []);
  }

  /// `Enter Fence Name`
  String get enterFenceName {
    return Intl.message(
      'Enter Fence Name',
      name: 'enterFenceName',
      desc: '',
      args: [],
    );
  }

  /// `Enter sim Number`
  String get enterSimNumber {
    return Intl.message(
      'Enter sim Number',
      name: 'enterSimNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter vehicle Model`
  String get enterVehicleModel {
    return Intl.message(
      'Enter vehicle Model',
      name: 'enterVehicleModel',
      desc: '',
      args: [],
    );
  }

  /// `Enter vehicle Name`
  String get enterVehicleName {
    return Intl.message(
      'Enter vehicle Name',
      name: 'enterVehicleName',
      desc: '',
      args: [],
    );
  }

  /// `Something Went Wrong`
  String get errorMsg {
    return Intl.message(
      'Something Went Wrong',
      name: 'errorMsg',
      desc: '',
      args: [],
    );
  }

  /// `Error on adding geofence.`
  String get errorOnAddingGeofence {
    return Intl.message(
      'Error on adding geofence.',
      name: 'errorOnAddingGeofence',
      desc: '',
      args: [],
    );
  }

  /// `Error on deleting Geofence.`
  String get errorOnDeletingGeofence {
    return Intl.message(
      'Error on deleting Geofence.',
      name: 'errorOnDeletingGeofence',
      desc: '',
      args: [],
    );
  }

  /// `Error on removing geofence.`
  String get errorOnRemovingGeofence {
    return Intl.message(
      'Error on removing geofence.',
      name: 'errorOnRemovingGeofence',
      desc: '',
      args: [],
    );
  }

  /// `Event`
  String get event {
    return Intl.message('Event', name: 'event', desc: '', args: []);
  }

  /// `Scroll To Last`
  String get eventsScrollToLast {
    return Intl.message(
      'Scroll To Last',
      name: 'eventsScrollToLast',
      desc: '',
      args: [],
    );
  }

  /// `Failed`
  String get failed {
    return Intl.message('Failed', name: 'failed', desc: '', args: []);
  }

  /// `Fast`
  String get fast {
    return Intl.message('Fast', name: 'fast', desc: '', args: []);
  }

  /// `Engine Lock`
  String get engineLockTitle {
    return Intl.message(
      'Engine Lock',
      name: 'engineLockTitle',
      desc: '',
      args: [],
    );
  }

  /// `Stopped`
  String get stopped {
    return Intl.message('Stopped', name: 'stopped', desc: '', args: []);
  }

  /// `Running`
  String get running {
    return Intl.message('Running', name: 'running', desc: '', args: []);
  }

  /// `Vehicle Status:  `
  String get vehicleStatusLabel {
    return Intl.message(
      'Vehicle Status:  ',
      name: 'vehicleStatusLabel',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle is currently idle. You can proceed with engine lock.`
  String get vehicleIdleMessage {
    return Intl.message(
      'Vehicle is currently idle. You can proceed with engine lock.',
      name: 'vehicleIdleMessage',
      desc: '',
      args: [],
    );
  }

  /// `Engine Lock cannot be initiated while the vehicle is moving.`
  String get vehicleMovingMessage {
    return Intl.message(
      'Engine Lock cannot be initiated while the vehicle is moving.',
      name: 'vehicleMovingMessage',
      desc: '',
      args: [],
    );
  }

  /// `Important Notice`
  String get importantNotice {
    return Intl.message(
      'Important Notice',
      name: 'importantNotice',
      desc: '',
      args: [],
    );
  }

  /// `• You are about to disable the vehicle’s electrical system.`
  String get importantNoticeLine1 {
    return Intl.message(
      '• You are about to disable the vehicle’s electrical system.',
      name: 'importantNoticeLine1',
      desc: '',
      args: [],
    );
  }

  /// `• You’ll need to unlock it again before the next ride.`
  String get importantNoticeLine2 {
    return Intl.message(
      '• You’ll need to unlock it again before the next ride.',
      name: 'importantNoticeLine2',
      desc: '',
      args: [],
    );
  }

  /// `Unlock`
  String get unlockEngine {
    return Intl.message('Unlock', name: 'unlockEngine', desc: '', args: []);
  }

  /// `Lock Engine`
  String get lockEngine {
    return Intl.message('Lock Engine', name: 'lockEngine', desc: '', args: []);
  }

  /// `The vehicle status is updated in real time.`
  String get realtimeStatusNote {
    return Intl.message(
      'The vehicle status is updated in real time.',
      name: 'realtimeStatusNote',
      desc: '',
      args: [],
    );
  }

  /// `Refresh if you suspect the status is outdated.`
  String get realtimeStatusNoteRefresh {
    return Intl.message(
      'Refresh if you suspect the status is outdated.',
      name: 'realtimeStatusNoteRefresh',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Lock?`
  String get confirmLockTitle {
    return Intl.message(
      'Confirm Lock?',
      name: 'confirmLockTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to {action} the engine for {vehicleName}?`
  String confirmLockMessage(Object action, Object vehicleName) {
    return Intl.message(
      'Are you sure you want to $action the engine for $vehicleName?',
      name: 'confirmLockMessage',
      desc: '',
      args: [action, vehicleName],
    );
  }

  /// `This will restore the vehicle’s electrical systems.`
  String get confirmLockNoteUnlock {
    return Intl.message(
      'This will restore the vehicle’s electrical systems.',
      name: 'confirmLockNoteUnlock',
      desc: '',
      args: [],
    );
  }

  /// `This will disable the vehicle's electrical systems until unlocked.`
  String get confirmLockNoteLock {
    return Intl.message(
      'This will disable the vehicle\'s electrical systems until unlocked.',
      name: 'confirmLockNoteLock',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected Error Occurred, Please Try Again`
  String get unexpectedError {
    return Intl.message(
      'Unexpected Error Occurred, Please Try Again',
      name: 'unexpectedError',
      desc: '',
      args: [],
    );
  }

  /// `Geofence Linked`
  String get fenceAddedSuccessfully {
    return Intl.message(
      'Geofence Linked',
      name: 'fenceAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Fence Name`
  String get fenceName {
    return Intl.message('Fence Name', name: 'fenceName', desc: '', args: []);
  }

  /// `Geofence Unlinked`
  String get fenceRemovedSuccessfully {
    return Intl.message(
      'Geofence Unlinked',
      name: 'fenceRemovedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Update Firmware`
  String get firmwareUpdate {
    return Intl.message(
      'Update Firmware',
      name: 'firmwareUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Flags`
  String get flags {
    return Intl.message('Flags', name: 'flags', desc: '', args: []);
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Frequency`
  String get frequency {
    return Intl.message('Frequency', name: 'frequency', desc: '', args: []);
  }

  /// `Fuel`
  String get fuel {
    return Intl.message('Fuel', name: 'fuel', desc: '', args: []);
  }

  /// `Fuel Consumption`
  String get fuelConsumption {
    return Intl.message(
      'Fuel Consumption',
      name: 'fuelConsumption',
      desc: '',
      args: [],
    );
  }

  /// `Fuel Cut`
  String get fuelCutOff {
    return Intl.message('Fuel Cut', name: 'fuelCutOff', desc: '', args: []);
  }

  /// `Geofence entered`
  String get geofenceEnter {
    return Intl.message(
      'Geofence entered',
      name: 'geofenceEnter',
      desc: '',
      args: [],
    );
  }

  /// `Geofence exited`
  String get geofenceExit {
    return Intl.message(
      'Geofence exited',
      name: 'geofenceExit',
      desc: '',
      args: [],
    );
  }

  /// `Get Version`
  String get getVersion {
    return Intl.message('Get Version', name: 'getVersion', desc: '', args: []);
  }

  /// `GPS`
  String get gps {
    return Intl.message('GPS', name: 'gps', desc: '', args: []);
  }

  /// `HDOP`
  String get hdop {
    return Intl.message('HDOP', name: 'hdop', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `h`
  String get hours {
    return Intl.message('h', name: 'hours', desc: '', args: []);
  }

  /// `Ignition`
  String get ignition {
    return Intl.message('Ignition', name: 'ignition', desc: '', args: []);
  }

  /// `Ignition off`
  String get ignitionOff {
    return Intl.message(
      'Ignition off',
      name: 'ignitionOff',
      desc: '',
      args: [],
    );
  }

  /// `Ignition on`
  String get ignitionOn {
    return Intl.message('Ignition on', name: 'ignitionOn', desc: '', args: []);
  }

  /// `Image`
  String get image {
    return Intl.message('Image', name: 'image', desc: '', args: []);
  }

  /// `Important`
  String get important {
    return Intl.message('Important', name: 'important', desc: '', args: []);
  }

  /// `Index`
  String get index {
    return Intl.message('Index', name: 'index', desc: '', args: []);
  }

  /// `Info`
  String get info {
    return Intl.message('Info', name: 'info', desc: '', args: []);
  }

  /// `Input`
  String get input {
    return Intl.message('Input', name: 'input', desc: '', args: []);
  }

  /// `IP`
  String get ip {
    return Intl.message('IP', name: 'ip', desc: '', args: []);
  }

  /// `Last Update`
  String get lastUpdate {
    return Intl.message('Last Update', name: 'lastUpdate', desc: '', args: []);
  }

  /// `Latitude`
  String get latitude {
    return Intl.message('Latitude', name: 'latitude', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `New user has been registered`
  String get loginCreated {
    return Intl.message(
      'New user has been registered',
      name: 'loginCreated',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect email address or password`
  String get loginFailed {
    return Intl.message(
      'Incorrect email address or password',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get loginLanguage {
    return Intl.message('Language', name: 'loginLanguage', desc: '', args: []);
  }

  /// `Login`
  String get loginLogin {
    return Intl.message('Login', name: 'loginLogin', desc: '', args: []);
  }

  /// `Logout`
  String get loginLogout {
    return Intl.message('Logout', name: 'loginLogout', desc: '', args: []);
  }

  /// `Register`
  String get loginRegister {
    return Intl.message('Register', name: 'loginRegister', desc: '', args: []);
  }

  /// `Login`
  String get loginTitle {
    return Intl.message('Login', name: 'loginTitle', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Longitude`
  String get longitude {
    return Intl.message('Longitude', name: 'longitude', desc: '', args: []);
  }

  /// `Maintenance required`
  String get maintenance {
    return Intl.message(
      'Maintenance required',
      name: 'maintenance',
      desc: '',
      args: [],
    );
  }

  /// `Period`
  String get maintenancePeriod {
    return Intl.message(
      'Period',
      name: 'maintenancePeriod',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get maintenanceStart {
    return Intl.message('Start', name: 'maintenanceStart', desc: '', args: []);
  }

  /// `Medium`
  String get medium {
    return Intl.message('Medium', name: 'medium', desc: '', args: []);
  }

  /// `Message`
  String get message {
    return Intl.message('Message', name: 'message', desc: '', args: []);
  }

  /// `Micro Installation`
  String get microInstallation {
    return Intl.message(
      'Micro Installation',
      name: 'microInstallation',
      desc: '',
      args: [],
    );
  }

  /// `Micro+ Installation`
  String get microPlusInstallation {
    return Intl.message(
      'Micro+ Installation',
      name: 'microPlusInstallation',
      desc: '',
      args: [],
    );
  }

  /// `Modify Deep Sleep`
  String get modeDeepSleep {
    return Intl.message(
      'Modify Deep Sleep',
      name: 'modeDeepSleep',
      desc: '',
      args: [],
    );
  }

  /// `Modify Power Saving`
  String get modePowerSaving {
    return Intl.message(
      'Modify Power Saving',
      name: 'modePowerSaving',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Motion`
  String get motion {
    return Intl.message('Motion', name: 'motion', desc: '', args: []);
  }

  /// `Movement Alarm`
  String get movementAlarm {
    return Intl.message(
      'Movement Alarm',
      name: 'movementAlarm',
      desc: '',
      args: [],
    );
  }

  /// `New Fence`
  String get newFence {
    return Intl.message('New Fence', name: 'newFence', desc: '', args: []);
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `No Data!`
  String get noData {
    return Intl.message('No Data!', name: 'noData', desc: '', args: []);
  }

  /// `No device found`
  String get noDeviceFound {
    return Intl.message(
      'No device found',
      name: 'noDeviceFound',
      desc: '',
      args: [],
    );
  }

  /// `No Fence Found`
  String get noFence {
    return Intl.message('No Fence Found', name: 'noFence', desc: '', args: []);
  }

  /// `No geofences available.`
  String get noGeofencesAvailable {
    return Intl.message(
      'No geofences available.',
      name: 'noGeofencesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message('Note', name: 'note', desc: '', args: []);
  }

  /// `Notifications`
  String get notification {
    return Intl.message(
      'Notifications',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `OBD Odometer`
  String get obdOdometer {
    return Intl.message(
      'OBD Odometer',
      name: 'obdOdometer',
      desc: '',
      args: [],
    );
  }

  /// `OBD Speed`
  String get obdSpeed {
    return Intl.message('OBD Speed', name: 'obdSpeed', desc: '', args: []);
  }

  /// `Odometer`
  String get odometer {
    return Intl.message('Odometer', name: 'odometer', desc: '', args: []);
  }

  /// `OFF`
  String get off {
    return Intl.message('OFF', name: 'off', desc: '', args: []);
  }

  /// `Offline`
  String get offline {
    return Intl.message('Offline', name: 'offline', desc: '', args: []);
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `ON`
  String get on {
    return Intl.message('ON', name: 'on', desc: '', args: []);
  }

  /// `Online`
  String get online {
    return Intl.message('Online', name: 'online', desc: '', args: []);
  }

  /// `Operator`
  String get operator {
    return Intl.message('Operator', name: 'operator', desc: '', args: []);
  }

  /// `OR`
  String get or {
    return Intl.message('OR', name: 'or', desc: '', args: []);
  }

  /// `Output`
  String get output {
    return Intl.message('Output', name: 'output', desc: '', args: []);
  }

  /// `Output Control`
  String get outputControl {
    return Intl.message(
      'Output Control',
      name: 'outputControl',
      desc: '',
      args: [],
    );
  }

  /// `Password Not Same`
  String get passwordNotSame {
    return Intl.message(
      'Password Not Same',
      name: 'passwordNotSame',
      desc: '',
      args: [],
    );
  }

  /// `Password Updated Successfully`
  String get passwordUpdatedSuccessfully {
    return Intl.message(
      'Password Updated Successfully',
      name: 'passwordUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `PDOP`
  String get pdop {
    return Intl.message('PDOP', name: 'pdop', desc: '', args: []);
  }

  /// `Phone Number`
  String get phone {
    return Intl.message('Phone Number', name: 'phone', desc: '', args: []);
  }

  /// `Playback`
  String get playback {
    return Intl.message('Playback', name: 'playback', desc: '', args: []);
  }

  /// `Please enter IMEI or SN`
  String get pleaseEnterImeiOrSn {
    return Intl.message(
      'Please enter IMEI or SN',
      name: 'pleaseEnterImeiOrSn',
      desc: '',
      args: [],
    );
  }

  /// `Port`
  String get port {
    return Intl.message('Port', name: 'port', desc: '', args: []);
  }

  /// `Acceleration`
  String get positionAcceleration {
    return Intl.message(
      'Acceleration',
      name: 'positionAcceleration',
      desc: '',
      args: [],
    );
  }

  /// `Accuracy`
  String get positionAccuracy {
    return Intl.message(
      'Accuracy',
      name: 'positionAccuracy',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get positionAddress {
    return Intl.message('Address', name: 'positionAddress', desc: '', args: []);
  }

  /// `Alarm`
  String get positionAlarm {
    return Intl.message('Alarm', name: 'positionAlarm', desc: '', args: []);
  }

  /// `Altitude`
  String get positionAltitude {
    return Intl.message(
      'Altitude',
      name: 'positionAltitude',
      desc: '',
      args: [],
    );
  }

  /// `Approximate`
  String get positionApproximate {
    return Intl.message(
      'Approximate',
      name: 'positionApproximate',
      desc: '',
      args: [],
    );
  }

  /// `Archive`
  String get positionArchive {
    return Intl.message('Archive', name: 'positionArchive', desc: '', args: []);
  }

  /// `Armed`
  String get positionArmed {
    return Intl.message('Armed', name: 'positionArmed', desc: '', args: []);
  }

  /// `Audio`
  String get positionAudio {
    return Intl.message('Audio', name: 'positionAudio', desc: '', args: []);
  }

  /// `Battery`
  String get positionBattery {
    return Intl.message('Battery', name: 'positionBattery', desc: '', args: []);
  }

  /// `Battery Level`
  String get positionBatteryLevel {
    return Intl.message(
      'Battery Level',
      name: 'positionBatteryLevel',
      desc: '',
      args: [],
    );
  }

  /// `Blocked`
  String get positionBlocked {
    return Intl.message('Blocked', name: 'positionBlocked', desc: '', args: []);
  }

  /// `Charge`
  String get positionCharge {
    return Intl.message('Charge', name: 'positionCharge', desc: '', args: []);
  }

  /// `Command`
  String get positionCommand {
    return Intl.message('Command', name: 'positionCommand', desc: '', args: []);
  }

  /// `Course`
  String get positionCourse {
    return Intl.message('Course', name: 'positionCourse', desc: '', args: []);
  }

  /// `Device Temperature`
  String get positionDeviceTemp {
    return Intl.message(
      'Device Temperature',
      name: 'positionDeviceTemp',
      desc: '',
      args: [],
    );
  }

  /// `Distance`
  String get positionDistance {
    return Intl.message(
      'Distance',
      name: 'positionDistance',
      desc: '',
      args: [],
    );
  }

  /// `Driver Unique Id`
  String get positionDriverUniqueId {
    return Intl.message(
      'Driver Unique Id',
      name: 'positionDriverUniqueId',
      desc: '',
      args: [],
    );
  }

  /// `DTCs`
  String get positionDtcs {
    return Intl.message('DTCs', name: 'positionDtcs', desc: '', args: []);
  }

  /// `Event`
  String get positionEvent {
    return Intl.message('Event', name: 'positionEvent', desc: '', args: []);
  }

  /// `Time`
  String get positionFixTime {
    return Intl.message('Time', name: 'positionFixTime', desc: '', args: []);
  }

  /// `Flags`
  String get positionFlags {
    return Intl.message('Flags', name: 'positionFlags', desc: '', args: []);
  }

  /// `Fuel`
  String get positionFuel {
    return Intl.message('Fuel', name: 'positionFuel', desc: '', args: []);
  }

  /// `Fuel Consumption`
  String get positionFuelConsumption {
    return Intl.message(
      'Fuel Consumption',
      name: 'positionFuelConsumption',
      desc: '',
      args: [],
    );
  }

  /// `GPS`
  String get positionGps {
    return Intl.message('GPS', name: 'positionGps', desc: '', args: []);
  }

  /// `HDOP`
  String get positionHdop {
    return Intl.message('HDOP', name: 'positionHdop', desc: '', args: []);
  }

  /// `Hours`
  String get positionHours {
    return Intl.message('Hours', name: 'positionHours', desc: '', args: []);
  }

  /// `Ignition`
  String get positionIgnition {
    return Intl.message(
      'Ignition',
      name: 'positionIgnition',
      desc: '',
      args: [],
    );
  }

  /// `Image`
  String get positionImage {
    return Intl.message('Image', name: 'positionImage', desc: '', args: []);
  }

  /// `Index`
  String get positionIndex {
    return Intl.message('Index', name: 'positionIndex', desc: '', args: []);
  }

  /// `Input`
  String get positionInput {
    return Intl.message('Input', name: 'positionInput', desc: '', args: []);
  }

  /// `IP`
  String get positionIp {
    return Intl.message('IP', name: 'positionIp', desc: '', args: []);
  }

  /// `Latitude`
  String get positionLatitude {
    return Intl.message(
      'Latitude',
      name: 'positionLatitude',
      desc: '',
      args: [],
    );
  }

  /// `Longitude`
  String get positionLongitude {
    return Intl.message(
      'Longitude',
      name: 'positionLongitude',
      desc: '',
      args: [],
    );
  }

  /// `Motion`
  String get positionMotion {
    return Intl.message('Motion', name: 'positionMotion', desc: '', args: []);
  }

  /// `OBD Odometer`
  String get positionObdOdometer {
    return Intl.message(
      'OBD Odometer',
      name: 'positionObdOdometer',
      desc: '',
      args: [],
    );
  }

  /// `OBD Speed`
  String get positionObdSpeed {
    return Intl.message(
      'OBD Speed',
      name: 'positionObdSpeed',
      desc: '',
      args: [],
    );
  }

  /// `Odometer`
  String get positionOdometer {
    return Intl.message(
      'Odometer',
      name: 'positionOdometer',
      desc: '',
      args: [],
    );
  }

  /// `Operator`
  String get positionOperator {
    return Intl.message(
      'Operator',
      name: 'positionOperator',
      desc: '',
      args: [],
    );
  }

  /// `Output`
  String get positionOutput {
    return Intl.message('Output', name: 'positionOutput', desc: '', args: []);
  }

  /// `PDOP`
  String get positionPdop {
    return Intl.message('PDOP', name: 'positionPdop', desc: '', args: []);
  }

  /// `Power`
  String get positionPower {
    return Intl.message('Power', name: 'positionPower', desc: '', args: []);
  }

  /// `Protocol`
  String get positionProtocol {
    return Intl.message(
      'Protocol',
      name: 'positionProtocol',
      desc: '',
      args: [],
    );
  }

  /// `Raw`
  String get positionRaw {
    return Intl.message('Raw', name: 'positionRaw', desc: '', args: []);
  }

  /// `RFID`
  String get positionRfid {
    return Intl.message('RFID', name: 'positionRfid', desc: '', args: []);
  }

  /// `Roaming`
  String get positionRoaming {
    return Intl.message('Roaming', name: 'positionRoaming', desc: '', args: []);
  }

  /// `RPM`
  String get positionRpm {
    return Intl.message('RPM', name: 'positionRpm', desc: '', args: []);
  }

  /// `RSSI`
  String get positionRssi {
    return Intl.message('RSSI', name: 'positionRssi', desc: '', args: []);
  }

  /// `Satellites`
  String get positionSat {
    return Intl.message('Satellites', name: 'positionSat', desc: '', args: []);
  }

  /// `Visible Satellites`
  String get positionSatVisible {
    return Intl.message(
      'Visible Satellites',
      name: 'positionSatVisible',
      desc: '',
      args: [],
    );
  }

  /// `Service Odometer`
  String get positionServiceOdometer {
    return Intl.message(
      'Service Odometer',
      name: 'positionServiceOdometer',
      desc: '',
      args: [],
    );
  }

  /// `Speed`
  String get positionSpeed {
    return Intl.message('Speed', name: 'positionSpeed', desc: '', args: []);
  }

  /// `Status`
  String get positionStatus {
    return Intl.message('Status', name: 'positionStatus', desc: '', args: []);
  }

  /// `Steps`
  String get positionSteps {
    return Intl.message('Steps', name: 'positionSteps', desc: '', args: []);
  }

  /// `Throttle`
  String get positionThrottle {
    return Intl.message(
      'Throttle',
      name: 'positionThrottle',
      desc: '',
      args: [],
    );
  }

  /// `Trip Odometer`
  String get positionTripOdometer {
    return Intl.message(
      'Trip Odometer',
      name: 'positionTripOdometer',
      desc: '',
      args: [],
    );
  }

  /// `Valid`
  String get positionValid {
    return Intl.message('Valid', name: 'positionValid', desc: '', args: []);
  }

  /// `VDOP`
  String get positionVdop {
    return Intl.message('VDOP', name: 'positionVdop', desc: '', args: []);
  }

  /// `Firmware Version`
  String get positionVersionFw {
    return Intl.message(
      'Firmware Version',
      name: 'positionVersionFw',
      desc: '',
      args: [],
    );
  }

  /// `Hardware Version`
  String get positionVersionHw {
    return Intl.message(
      'Hardware Version',
      name: 'positionVersionHw',
      desc: '',
      args: [],
    );
  }

  /// `VIN`
  String get positionVin {
    return Intl.message('VIN', name: 'positionVin', desc: '', args: []);
  }

  /// `Power`
  String get power {
    return Intl.message('Power', name: 'power', desc: '', args: []);
  }

  /// `Power Off Device`
  String get powerOff {
    return Intl.message(
      'Power Off Device',
      name: 'powerOff',
      desc: '',
      args: [],
    );
  }

  /// `Protocol`
  String get protocol {
    return Intl.message('Protocol', name: 'protocol', desc: '', args: []);
  }

  /// `Radius`
  String get radius {
    return Intl.message('Radius', name: 'radius', desc: '', args: []);
  }

  /// `Raw`
  String get raw {
    return Intl.message('Raw', name: 'raw', desc: '', args: []);
  }

  /// `Reboot Device`
  String get rebootDevice {
    return Intl.message(
      'Reboot Device',
      name: 'rebootDevice',
      desc: '',
      args: [],
    );
  }

  /// `Recent Events`
  String get recentEvents {
    return Intl.message(
      'Recent Events',
      name: 'recentEvents',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Report`
  String get report {
    return Intl.message('Report', name: 'report', desc: '', args: []);
  }

  /// `Avg Speed`
  String get reportAverageSpeed {
    return Intl.message(
      'Avg Speed',
      name: 'reportAverageSpeed',
      desc: '',
      args: [],
    );
  }

  /// `Custom`
  String get reportCustom {
    return Intl.message('Custom', name: 'reportCustom', desc: '', args: []);
  }

  /// `Report Dashboard`
  String get reportDashboard {
    return Intl.message(
      'Report Dashboard',
      name: 'reportDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Device Name`
  String get reportDeviceName {
    return Intl.message(
      'Device Name',
      name: 'reportDeviceName',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get reportDuration {
    return Intl.message('Duration', name: 'reportDuration', desc: '', args: []);
  }

  /// `End Address`
  String get reportEndAddress {
    return Intl.message(
      'End Address',
      name: 'reportEndAddress',
      desc: '',
      args: [],
    );
  }

  /// `End Date`
  String get reportEndDate {
    return Intl.message('End Date', name: 'reportEndDate', desc: '', args: []);
  }

  /// `Odometer End`
  String get reportEndOdometer {
    return Intl.message(
      'Odometer End',
      name: 'reportEndOdometer',
      desc: '',
      args: [],
    );
  }

  /// `End Time`
  String get reportEndTime {
    return Intl.message('End Time', name: 'reportEndTime', desc: '', args: []);
  }

  /// `Engine Hours`
  String get reportEngineHours {
    return Intl.message(
      'Engine Hours',
      name: 'reportEngineHours',
      desc: '',
      args: [],
    );
  }

  /// `Events`
  String get reportEvents {
    return Intl.message('Events', name: 'reportEvents', desc: '', args: []);
  }

  /// `Max Speed`
  String get reportMaximumSpeed {
    return Intl.message(
      'Max Speed',
      name: 'reportMaximumSpeed',
      desc: '',
      args: [],
    );
  }

  /// `Previous Month`
  String get reportPreviousMonth {
    return Intl.message(
      'Previous Month',
      name: 'reportPreviousMonth',
      desc: '',
      args: [],
    );
  }

  /// `Previous Week`
  String get reportPreviousWeek {
    return Intl.message(
      'Previous Week',
      name: 'reportPreviousWeek',
      desc: '',
      args: [],
    );
  }

  /// `Route`
  String get reportRoute {
    return Intl.message('Route', name: 'reportRoute', desc: '', args: []);
  }

  /// `Spent Fuel`
  String get reportSpentFuel {
    return Intl.message(
      'Spent Fuel',
      name: 'reportSpentFuel',
      desc: '',
      args: [],
    );
  }

  /// `Start Address`
  String get reportStartAddress {
    return Intl.message(
      'Start Address',
      name: 'reportStartAddress',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get reportStartDate {
    return Intl.message(
      'Start Date',
      name: 'reportStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Odometer Start`
  String get reportStartOdometer {
    return Intl.message(
      'Odometer Start',
      name: 'reportStartOdometer',
      desc: '',
      args: [],
    );
  }

  /// `Start Time`
  String get reportStartTime {
    return Intl.message(
      'Start Time',
      name: 'reportStartTime',
      desc: '',
      args: [],
    );
  }

  /// `Stops`
  String get reportStops {
    return Intl.message('Stops', name: 'reportStops', desc: '', args: []);
  }

  /// `Summary`
  String get reportSummary {
    return Intl.message('Summary', name: 'reportSummary', desc: '', args: []);
  }

  /// `This Month`
  String get reportThisMonth {
    return Intl.message(
      'This Month',
      name: 'reportThisMonth',
      desc: '',
      args: [],
    );
  }

  /// `This Week`
  String get reportThisWeek {
    return Intl.message(
      'This Week',
      name: 'reportThisWeek',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get reportToday {
    return Intl.message('Today', name: 'reportToday', desc: '', args: []);
  }

  /// `Trips`
  String get reportTrips {
    return Intl.message('Trips', name: 'reportTrips', desc: '', args: []);
  }

  /// `Yesterday`
  String get reportYesterday {
    return Intl.message(
      'Yesterday',
      name: 'reportYesterday',
      desc: '',
      args: [],
    );
  }

  /// `Request Photo`
  String get requestPhoto {
    return Intl.message(
      'Request Photo',
      name: 'requestPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: '', args: []);
  }

  /// `Retype Password`
  String get retypePassword {
    return Intl.message(
      'Retype Password',
      name: 'retypePassword',
      desc: '',
      args: [],
    );
  }

  /// `RFID`
  String get rfid {
    return Intl.message('RFID', name: 'rfid', desc: '', args: []);
  }

  /// `Roaming`
  String get roaming {
    return Intl.message('Roaming', name: 'roaming', desc: '', args: []);
  }

  /// `RPM`
  String get rpm {
    return Intl.message('RPM', name: 'rpm', desc: '', args: []);
  }

  /// `RSSI`
  String get rssi {
    return Intl.message('RSSI', name: 'rssi', desc: '', args: []);
  }

  /// `Satellites`
  String get sat {
    return Intl.message('Satellites', name: 'sat', desc: '', args: []);
  }

  /// `Visible Satellites`
  String get satVisible {
    return Intl.message(
      'Visible Satellites',
      name: 'satVisible',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Select Command`
  String get select_command {
    return Intl.message(
      'Select Command',
      name: 'select_command',
      desc: '',
      args: [],
    );
  }

  /// `Send Command`
  String get send_command {
    return Intl.message(
      'Send Command',
      name: 'send_command',
      desc: '',
      args: [],
    );
  }

  /// `Send SMS`
  String get sendSms {
    return Intl.message('Send SMS', name: 'sendSms', desc: '', args: []);
  }

  /// `Send USSD`
  String get sendUssd {
    return Intl.message('Send USSD', name: 'sendUssd', desc: '', args: []);
  }

  /// `Serial number (SN/IMEI) of the device`
  String get serialNumberOfTheDevice {
    return Intl.message(
      'Serial number (SN/IMEI) of the device',
      name: 'serialNumberOfTheDevice',
      desc: '',
      args: [],
    );
  }

  /// `Server`
  String get server {
    return Intl.message('Server', name: 'server', desc: '', args: []);
  }

  /// `Server URL`
  String get serverURl {
    return Intl.message('Server URL', name: 'serverURl', desc: '', args: []);
  }

  /// `Service Odometer`
  String get serviceOdometer {
    return Intl.message(
      'Service Odometer',
      name: 'serviceOdometer',
      desc: '',
      args: [],
    );
  }

  /// `Set AGPS`
  String get setAgps {
    return Intl.message('Set AGPS', name: 'setAgps', desc: '', args: []);
  }

  /// `Set Connection`
  String get setConnection {
    return Intl.message(
      'Set Connection',
      name: 'setConnection',
      desc: '',
      args: [],
    );
  }

  /// `Get Device Status`
  String get setDeviceStatus {
    return Intl.message(
      'Get Device Status',
      name: 'setDeviceStatus',
      desc: '',
      args: [],
    );
  }

  /// `Set Indicator`
  String get setIndicator {
    return Intl.message(
      'Set Indicator',
      name: 'setIndicator',
      desc: '',
      args: [],
    );
  }

  /// `Get Modem Status`
  String get setModemStatus {
    return Intl.message(
      'Get Modem Status',
      name: 'setModemStatus',
      desc: '',
      args: [],
    );
  }

  /// `Set Odometer`
  String get setOdometer {
    return Intl.message(
      'Set Odometer',
      name: 'setOdometer',
      desc: '',
      args: [],
    );
  }

  /// `Set Phonebook`
  String get setPhonebook {
    return Intl.message(
      'Set Phonebook',
      name: 'setPhonebook',
      desc: '',
      args: [],
    );
  }

  /// `Set Timezone`
  String get setTimezone {
    return Intl.message(
      'Set Timezone',
      name: 'setTimezone',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Please Wait...`
  String get sharedLoading {
    return Intl.message(
      'Please Wait...',
      name: 'sharedLoading',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance`
  String get sharedMaintenance {
    return Intl.message(
      'Maintenance',
      name: 'sharedMaintenance',
      desc: '',
      args: [],
    );
  }

  /// `Showing all Devices`
  String get showingAllDevices {
    return Intl.message(
      'Showing all Devices',
      name: 'showingAllDevices',
      desc: '',
      args: [],
    );
  }

  /// `Set Silence Time`
  String get silenceTime {
    return Intl.message(
      'Set Silence Time',
      name: 'silenceTime',
      desc: '',
      args: [],
    );
  }

  /// `Sim Number`
  String get simNumber {
    return Intl.message('Sim Number', name: 'simNumber', desc: '', args: []);
  }

  /// `Slow`
  String get slow {
    return Intl.message('Slow', name: 'slow', desc: '', args: []);
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Somthing went wrong!`
  String get somthingWentWrong {
    return Intl.message(
      'Somthing went wrong!',
      name: 'somthingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Set SOS Number`
  String get sosNumber {
    return Intl.message(
      'Set SOS Number',
      name: 'sosNumber',
      desc: '',
      args: [],
    );
  }

  /// `Speed`
  String get speed {
    return Intl.message('Speed', name: 'speed', desc: '', args: []);
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `Steps`
  String get steps {
    return Intl.message('Steps', name: 'steps', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Tap anywhere inside map to add fence`
  String get tapToAddFence {
    return Intl.message(
      'Tap anywhere inside map to add fence',
      name: 'tapToAddFence',
      desc: '',
      args: [],
    );
  }

  /// `Test`
  String get test {
    return Intl.message('Test', name: 'test', desc: '', args: []);
  }

  /// `Text message received`
  String get textMessage {
    return Intl.message(
      'Text message received',
      name: 'textMessage',
      desc: '',
      args: [],
    );
  }

  /// `Throttle`
  String get throttle {
    return Intl.message('Throttle', name: 'throttle', desc: '', args: []);
  }

  /// `Timezone Offset`
  String get timezone {
    return Intl.message(
      'Timezone Offset',
      name: 'timezone',
      desc: '',
      args: [],
    );
  }

  /// `Total Distance`
  String get totalDistance {
    return Intl.message(
      'Total Distance',
      name: 'totalDistance',
      desc: '',
      args: [],
    );
  }

  /// `Trip Odometer`
  String get tripOdometer {
    return Intl.message(
      'Trip Odometer',
      name: 'tripOdometer',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message('Type', name: 'type', desc: '', args: []);
  }

  /// `Unavailable`
  String get unavailable {
    return Intl.message('Unavailable', name: 'unavailable', desc: '', args: []);
  }

  /// `Unknown`
  String get unknown {
    return Intl.message('Unknown', name: 'unknown', desc: '', args: []);
  }

  /// `Admin`
  String get userAdmin {
    return Intl.message('Admin', name: 'userAdmin', desc: '', args: []);
  }

  /// `Device Limit`
  String get userDeviceLimit {
    return Intl.message(
      'Device Limit',
      name: 'userDeviceLimit',
      desc: '',
      args: [],
    );
  }

  /// `Device Readonly`
  String get userDeviceReadonly {
    return Intl.message(
      'Device Readonly',
      name: 'userDeviceReadonly',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get userEmail {
    return Intl.message('Email', name: 'userEmail', desc: '', args: []);
  }

  /// `Expiration`
  String get userExpirationTime {
    return Intl.message(
      'Expiration',
      name: 'userExpirationTime',
      desc: '',
      args: [],
    );
  }

  /// `Limit Commands`
  String get userLimitCommands {
    return Intl.message(
      'Limit Commands',
      name: 'userLimitCommands',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `Password`
  String get userPassword {
    return Intl.message('Password', name: 'userPassword', desc: '', args: []);
  }

  /// `Remember`
  String get userRemember {
    return Intl.message('Remember', name: 'userRemember', desc: '', args: []);
  }

  /// `Token`
  String get userToken {
    return Intl.message('Token', name: 'userToken', desc: '', args: []);
  }

  /// `User Limit`
  String get userUserLimit {
    return Intl.message(
      'User Limit',
      name: 'userUserLimit',
      desc: '',
      args: [],
    );
  }

  /// `VDOP`
  String get vdop {
    return Intl.message('VDOP', name: 'vdop', desc: '', args: []);
  }

  /// `Make sure the vehicle is under open sky exposure during installation`
  String get vehicleActivateStepNote1 {
    return Intl.message(
      'Make sure the vehicle is under open sky exposure during installation',
      name: 'vehicleActivateStepNote1',
      desc: '',
      args: [],
    );
  }

  /// `Take the product to any Local Garage near you to get the installation with the help of video/manual/callsupport`
  String get vehicleActivateStepNote2 {
    return Intl.message(
      'Take the product to any Local Garage near you to get the installation with the help of video/manual/callsupport',
      name: 'vehicleActivateStepNote2',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Icon`
  String get vehicleIcon {
    return Intl.message(
      'Vehicle Icon',
      name: 'vehicleIcon',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Model`
  String get vehicleModel {
    return Intl.message(
      'Vehicle Model',
      name: 'vehicleModel',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Name`
  String get vehicleName {
    return Intl.message(
      'Vehicle Name',
      name: 'vehicleName',
      desc: '',
      args: [],
    );
  }

  /// `Firmware Version`
  String get versionFw {
    return Intl.message(
      'Firmware Version',
      name: 'versionFw',
      desc: '',
      args: [],
    );
  }

  /// `Hardware Version`
  String get versionHw {
    return Intl.message(
      'Hardware Version',
      name: 'versionHw',
      desc: '',
      args: [],
    );
  }

  /// `VIN`
  String get vin {
    return Intl.message('VIN', name: 'vin', desc: '', args: []);
  }

  /// `Voice Message`
  String get voiceMessage {
    return Intl.message(
      'Voice Message',
      name: 'voiceMessage',
      desc: '',
      args: [],
    );
  }

  /// `Voice Monitoring`
  String get voiceMonitoring {
    return Intl.message(
      'Voice Monitoring',
      name: 'voiceMonitoring',
      desc: '',
      args: [],
    );
  }

  /// `Watch Installation Videos On Youtube`
  String get watchInstallationVideosOnYoutube {
    return Intl.message(
      'Watch Installation Videos On Youtube',
      name: 'watchInstallationVideosOnYoutube',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No Playback Data Found`
  String get noPlayBackDataFound {
    return Intl.message(
      'No Playback Data Found',
      name: 'noPlayBackDataFound',
      desc: '',
      args: [],
    );
  }

  /// `You are about to enable location sharing, allowing your family and friends to see your movements while riding. You will receive a link for device sharing, which you can share across all messaging platforms with your chosen contacts. Please double-check before sharing.`
  String get youAreAboutToEnable {
    return Intl.message(
      'You are about to enable location sharing, allowing your family and friends to see your movements while riding. You will receive a link for device sharing, which you can share across all messaging platforms with your chosen contacts. Please double-check before sharing.',
      name: 'youAreAboutToEnable',
      desc: '',
      args: [],
    );
  }

  /// `Playback Not Availble!`
  String get playbackNotAvailble {
    return Intl.message(
      'Playback Not Availble!',
      name: 'playbackNotAvailble',
      desc: '',
      args: [],
    );
  }

  /// `Not Available`
  String get notAvailable {
    return Intl.message(
      'Not Available',
      name: 'notAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Registration Number`
  String get registrationNumber {
    return Intl.message(
      'Registration Number',
      name: 'registrationNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter Registration Number`
  String get enterRegistrationNumber {
    return Intl.message(
      'Enter Registration Number',
      name: 'enterRegistrationNumber',
      desc: '',
      args: [],
    );
  }

  /// `No Events data found`
  String get noEventsDataFound {
    return Intl.message(
      'No Events data found',
      name: 'noEventsDataFound',
      desc: '',
      args: [],
    );
  }

  /// `No Trip data found`
  String get noTripDataFound {
    return Intl.message(
      'No Trip data found',
      name: 'noTripDataFound',
      desc: '',
      args: [],
    );
  }

  /// `Review Playback`
  String get review_playback {
    return Intl.message(
      'Review Playback',
      name: 'review_playback',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Device`
  String get unknown_device {
    return Intl.message(
      'Unknown Device',
      name: 'unknown_device',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get statistics {
    return Intl.message('Statistics', name: 'statistics', desc: '', args: []);
  }

  /// `Route Length`
  String get route_length {
    return Intl.message(
      'Route Length',
      name: 'route_length',
      desc: '',
      args: [],
    );
  }

  /// `Avg. Speed`
  String get avg_speed {
    return Intl.message('Avg. Speed', name: 'avg_speed', desc: '', args: []);
  }

  /// `Spent Fuel`
  String get spent_fuel {
    return Intl.message('Spent Fuel', name: 'spent_fuel', desc: '', args: []);
  }

  /// `Engine Duration`
  String get engine_duration {
    return Intl.message(
      'Engine Duration',
      name: 'engine_duration',
      desc: '',
      args: [],
    );
  }

  /// `Move Duration`
  String get move_duration {
    return Intl.message(
      'Move Duration',
      name: 'move_duration',
      desc: '',
      args: [],
    );
  }

  /// `Stop Duration`
  String get stop_duration {
    return Intl.message(
      'Stop Duration',
      name: 'stop_duration',
      desc: '',
      args: [],
    );
  }

  /// `km`
  String get km {
    return Intl.message('km', name: 'km', desc: '', args: []);
  }

  /// `km/h`
  String get km_per_hour {
    return Intl.message('km/h', name: 'km_per_hour', desc: '', args: []);
  }

  /// `L`
  String get litre {
    return Intl.message('L', name: 'litre', desc: '', args: []);
  }

  /// `hr`
  String get hour {
    return Intl.message('hr', name: 'hour', desc: '', args: []);
  }

  /// `min`
  String get minute {
    return Intl.message('min', name: 'minute', desc: '', args: []);
  }

  /// `Runtime`
  String get runTime {
    return Intl.message('Runtime', name: 'runTime', desc: '', args: []);
  }

  /// `Stop Duration`
  String get stopDuration {
    return Intl.message(
      'Stop Duration',
      name: 'stopDuration',
      desc: '',
      args: [],
    );
  }

  /// `sec`
  String get second {
    return Intl.message('sec', name: 'second', desc: '', args: []);
  }

  /// `Trip Count`
  String get trip_count {
    return Intl.message('Trip Count', name: 'trip_count', desc: '', args: []);
  }

  /// `Stop Count`
  String get stop_count {
    return Intl.message('Stop Count', name: 'stop_count', desc: '', args: []);
  }

  /// `Average Speed`
  String get averageSpeed {
    return Intl.message(
      'Average Speed',
      name: 'averageSpeed',
      desc: '',
      args: [],
    );
  }

  /// `Top Speed`
  String get topSpeed {
    return Intl.message('Top Speed', name: 'topSpeed', desc: '', args: []);
  }

  /// `Covered`
  String get covered {
    return Intl.message('Covered', name: 'covered', desc: '', args: []);
  }

  /// `Longest Distance`
  String get longestDistance {
    return Intl.message(
      'Longest Distance',
      name: 'longestDistance',
      desc: '',
      args: [],
    );
  }

  /// `Engine Runtime (mins)`
  String get engineRuntime {
    return Intl.message(
      'Engine Runtime (mins)',
      name: 'engineRuntime',
      desc: '',
      args: [],
    );
  }

  /// `Total Runtime`
  String get totalRuntime {
    return Intl.message(
      'Total Runtime',
      name: 'totalRuntime',
      desc: '',
      args: [],
    );
  }

  /// `Longest Runtime`
  String get longestRuntime {
    return Intl.message(
      'Longest Runtime',
      name: 'longestRuntime',
      desc: '',
      args: [],
    );
  }

  /// `mins`
  String get mins {
    return Intl.message('mins', name: 'mins', desc: '', args: []);
  }

  /// `Today`
  String get today {
    return Intl.message('Today', name: 'today', desc: '', args: []);
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message('Yesterday', name: 'yesterday', desc: '', args: []);
  }

  /// `This Week`
  String get thisWeek {
    return Intl.message('This Week', name: 'thisWeek', desc: '', args: []);
  }

  /// `Last Week`
  String get lastWeek {
    return Intl.message('Last Week', name: 'lastWeek', desc: '', args: []);
  }

  /// `This Month`
  String get thisMonth {
    return Intl.message('This Month', name: 'thisMonth', desc: '', args: []);
  }

  /// `Last Month`
  String get lastMonth {
    return Intl.message('Last Month', name: 'lastMonth', desc: '', args: []);
  }

  /// `Change`
  String get change {
    return Intl.message('Change', name: 'change', desc: '', args: []);
  }

  /// `No Stops data found`
  String get noStopDataFound {
    return Intl.message(
      'No Stops data found',
      name: 'noStopDataFound',
      desc: '',
      args: [],
    );
  }

  /// `No valid QR code found. Please try again.`
  String get noValidQRCode {
    return Intl.message(
      'No valid QR code found. Please try again.',
      name: 'noValidQRCode',
      desc: '',
      args: [],
    );
  }

  /// `Camera permission is required to scan QR codes.`
  String get cameraPermissionRequired {
    return Intl.message(
      'Camera permission is required to scan QR codes.',
      name: 'cameraPermissionRequired',
      desc: '',
      args: [],
    );
  }

  /// `Open Settings`
  String get openSettings {
    return Intl.message(
      'Open Settings',
      name: 'openSettings',
      desc: '',
      args: [],
    );
  }

  /// `Trackon Shop`
  String get trackonShop {
    return Intl.message(
      'Trackon Shop',
      name: 'trackonShop',
      desc: '',
      args: [],
    );
  }

  /// `Scan Device IMEI`
  String get scanDeviceIMEI {
    return Intl.message(
      'Scan Device IMEI',
      name: 'scanDeviceIMEI',
      desc: '',
      args: [],
    );
  }

  /// `Enter Device IMEI`
  String get enterDeviceIMEI {
    return Intl.message(
      'Enter Device IMEI',
      name: 'enterDeviceIMEI',
      desc: '',
      args: [],
    );
  }

  /// `Scan the QR code located inside your tracking device to register it in your account.`
  String get imeiInstructions {
    return Intl.message(
      'Scan the QR code located inside your tracking device to register it in your account.',
      name: 'imeiInstructions',
      desc: '',
      args: [],
    );
  }

  /// `16-digit IMEI number`
  String get imeiHint {
    return Intl.message(
      '16-digit IMEI number',
      name: 'imeiHint',
      desc: '',
      args: [],
    );
  }

  /// `16-digit IMEI number`
  String get imeiLabel {
    return Intl.message(
      '16-digit IMEI number',
      name: 'imeiLabel',
      desc: '',
      args: [],
    );
  }

  /// `IMEI cannot be more than 16 digits`
  String get imeiTooLong {
    return Intl.message(
      'IMEI cannot be more than 16 digits',
      name: 'imeiTooLong',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_btn {
    return Intl.message('Continue', name: 'continue_btn', desc: '', args: []);
  }

  /// `Add Vehicle Information`
  String get add_vehicle_information {
    return Intl.message(
      'Add Vehicle Information',
      name: 'add_vehicle_information',
      desc: '',
      args: [],
    );
  }

  /// `Basic Info`
  String get basicInfo {
    return Intl.message('Basic Info', name: 'basicInfo', desc: '', args: []);
  }

  /// `Choose Vehicle Icon`
  String get chooseVehicleIcon {
    return Intl.message(
      'Choose Vehicle Icon',
      name: 'chooseVehicleIcon',
      desc: '',
      args: [],
    );
  }

  /// `Activation`
  String get activation {
    return Intl.message('Activation', name: 'activation', desc: '', args: []);
  }

  /// `Note:`
  String get note_ {
    return Intl.message('Note:', name: 'note_', desc: '', args: []);
  }

  /// `Watch Installation Videos on YouTube:`
  String get watchInstallationVideos {
    return Intl.message(
      'Watch Installation Videos on YouTube:',
      name: 'watchInstallationVideos',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle added successfully!`
  String get vehicleAddedSuccess {
    return Intl.message(
      'Vehicle added successfully!',
      name: 'vehicleAddedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Activate`
  String get activate {
    return Intl.message('Activate', name: 'activate', desc: '', args: []);
  }

  /// `Welcome, {name}`
  String welcomeUser(Object name) {
    return Intl.message(
      'Welcome, $name',
      name: 'welcomeUser',
      desc: '',
      args: [name],
    );
  }

  /// `Welcome to Trackon`
  String get welcomeTrackon {
    return Intl.message(
      'Welcome to Trackon',
      name: 'welcomeTrackon',
      desc: '',
      args: [],
    );
  }

  /// `You’re almost there - add your first vehicle to get started with Trackon GPS and start tracking & managing your fleet.`
  String get welcomeMessage {
    return Intl.message(
      'You’re almost there - add your first vehicle to get started with Trackon GPS and start tracking & managing your fleet.',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Add your Vehicle`
  String get addYourVehicle {
    return Intl.message(
      'Add your Vehicle',
      name: 'addYourVehicle',
      desc: '',
      args: [],
    );
  }

  /// `Buy New Device`
  String get buyNewDevice {
    return Intl.message(
      'Buy New Device',
      name: 'buyNewDevice',
      desc: '',
      args: [],
    );
  }

  /// `Need help getting started?`
  String get needHelp {
    return Intl.message(
      'Need help getting started?',
      name: 'needHelp',
      desc: '',
      args: [],
    );
  }

  /// `Our support team is just a tap away.`
  String get supportTeam {
    return Intl.message(
      'Our support team is just a tap away.',
      name: 'supportTeam',
      desc: '',
      args: [],
    );
  }

  /// `Contact Support`
  String get contactSupport {
    return Intl.message(
      'Contact Support',
      name: 'contactSupport',
      desc: '',
      args: [],
    );
  }

  /// `To Add your Trackon GPS Device`
  String get toAddTrackonGps {
    return Intl.message(
      'To Add your Trackon GPS Device',
      name: 'toAddTrackonGps',
      desc: '',
      args: [],
    );
  }

  /// `Scan the QR code located inside your tracking device to register it in your account.`
  String get scanQrCodeDescription {
    return Intl.message(
      'Scan the QR code located inside your tracking device to register it in your account.',
      name: 'scanQrCodeDescription',
      desc: '',
      args: [],
    );
  }

  /// `I have located the QR code on my device.`
  String get locatedQrCodeConfirmation {
    return Intl.message(
      'I have located the QR code on my device.',
      name: 'locatedQrCodeConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Continue to Scan QR`
  String get continueToScanQr {
    return Intl.message(
      'Continue to Scan QR',
      name: 'continueToScanQr',
      desc: '',
      args: [],
    );
  }

  /// `Subscription Payment`
  String get subscriptionPayment {
    return Intl.message(
      'Subscription Payment',
      name: 'subscriptionPayment',
      desc: '',
      args: [],
    );
  }

  /// `Select Duration`
  String get selectDuration {
    return Intl.message(
      'Select Duration',
      name: 'selectDuration',
      desc: '',
      args: [],
    );
  }

  /// `Select Payment Method`
  String get selectPaymentMethod {
    return Intl.message(
      'Select Payment Method',
      name: 'selectPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Coupon Applied! Discount:`
  String get couponApplied {
    return Intl.message(
      'Coupon Applied! Discount:',
      name: 'couponApplied',
      desc: '',
      args: [],
    );
  }

  /// `Subscription`
  String get subscription {
    return Intl.message(
      'Subscription',
      name: 'subscription',
      desc: '',
      args: [],
    );
  }

  /// `Subscriptions Details`
  String get subscriptionDetailsTitle {
    return Intl.message(
      'Subscriptions Details',
      name: 'subscriptionDetailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Active Subscription`
  String get subscriptionActiveTitle {
    return Intl.message(
      'Active Subscription',
      name: 'subscriptionActiveTitle',
      desc: '',
      args: [],
    );
  }

  /// `Payment History`
  String get subscriptionPaymentHistoryTitle {
    return Intl.message(
      'Payment History',
      name: 'subscriptionPaymentHistoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Renew Subscription`
  String get subscriptionRenew {
    return Intl.message(
      'Renew Subscription',
      name: 'subscriptionRenew',
      desc: '',
      args: [],
    );
  }

  /// `Extend Plan`
  String get subscriptionExtend {
    return Intl.message(
      'Extend Plan',
      name: 'subscriptionExtend',
      desc: '',
      args: [],
    );
  }

  /// `Payment History`
  String get paymentHistory {
    return Intl.message(
      'Payment History',
      name: 'paymentHistory',
      desc: '',
      args: [],
    );
  }

  /// `No payment history found`
  String get noPaymentHistory {
    return Intl.message(
      'No payment history found',
      name: 'noPaymentHistory',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Rs`
  String get rs {
    return Intl.message('Rs', name: 'rs', desc: '', args: []);
  }

  /// `Password Reset Successfully!`
  String get passwordResetSuccessTitle {
    return Intl.message(
      'Password Reset Successfully!',
      name: 'passwordResetSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been updated successfully. You can now log in with your new password.`
  String get passwordResetSuccessMessage {
    return Intl.message(
      'Your password has been updated successfully. You can now log in with your new password.',
      name: 'passwordResetSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `Login Now`
  String get loginNow {
    return Intl.message('Login Now', name: 'loginNow', desc: '', args: []);
  }

  /// `Apply Coupon Code`
  String get applyCouponCode {
    return Intl.message(
      'Apply Coupon Code',
      name: 'applyCouponCode',
      desc: '',
      args: [],
    );
  }

  /// `If you have a coupon code, enter it here`
  String get enterCouponCode {
    return Intl.message(
      'If you have a coupon code, enter it here',
      name: 'enterCouponCode',
      desc: '',
      args: [],
    );
  }

  /// `Coupon here`
  String get couponHere {
    return Intl.message('Coupon here', name: 'couponHere', desc: '', args: []);
  }

  /// `Apply Code`
  String get applyCode {
    return Intl.message('Apply Code', name: 'applyCode', desc: '', args: []);
  }

  /// `Please enter a promo code`
  String get pleaseEnterPromoCode {
    return Intl.message(
      'Please enter a promo code',
      name: 'pleaseEnterPromoCode',
      desc: '',
      args: [],
    );
  }

  /// `Coupon Code applied successfully!`
  String get couponAppliedSuccess {
    return Intl.message(
      'Coupon Code applied successfully!',
      name: 'couponAppliedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get summary {
    return Intl.message('Summary', name: 'summary', desc: '', args: []);
  }

  /// `Base Price:`
  String get basePrice {
    return Intl.message('Base Price:', name: 'basePrice', desc: '', args: []);
  }

  /// `Promo Applied:`
  String get promoApplied {
    return Intl.message(
      'Promo Applied:',
      name: 'promoApplied',
      desc: '',
      args: [],
    );
  }

  /// `Discount Price:`
  String get discountPrice {
    return Intl.message(
      'Discount Price:',
      name: 'discountPrice',
      desc: '',
      args: [],
    );
  }

  /// `Total Price:`
  String get totalPrice {
    return Intl.message('Total Price:', name: 'totalPrice', desc: '', args: []);
  }

  /// `Days Added:`
  String get daysAdded {
    return Intl.message('Days Added:', name: 'daysAdded', desc: '', args: []);
  }

  /// `Bonus Days:`
  String get bonusDays {
    return Intl.message('Bonus Days:', name: 'bonusDays', desc: '', args: []);
  }

  /// `NRs`
  String get nrs {
    return Intl.message('NRs', name: 'nrs', desc: '', args: []);
  }

  /// `Transaction`
  String get transaction {
    return Intl.message('Transaction', name: 'transaction', desc: '', args: []);
  }

  /// `NPR`
  String get payment_success_amount {
    return Intl.message(
      'NPR',
      name: 'payment_success_amount',
      desc: '',
      args: [],
    );
  }

  /// `Paid for`
  String get paid_for_device {
    return Intl.message(
      'Paid for',
      name: 'paid_for_device',
      desc: '',
      args: [],
    );
  }

  /// `Payment Reference ID`
  String get payment_reference_id {
    return Intl.message(
      'Payment Reference ID',
      name: 'payment_reference_id',
      desc: '',
      args: [],
    );
  }

  /// `Payment Status`
  String get payment_status {
    return Intl.message(
      'Payment Status',
      name: 'payment_status',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message('Amount', name: 'amount', desc: '', args: []);
  }

  /// `Device ID:`
  String get device_id {
    return Intl.message('Device ID:', name: 'device_id', desc: '', args: []);
  }

  /// `Device Name:`
  String get device_name {
    return Intl.message(
      'Device Name:',
      name: 'device_name',
      desc: '',
      args: [],
    );
  }

  /// `Expiration Time`
  String get expiration_time {
    return Intl.message(
      'Expiration Time',
      name: 'expiration_time',
      desc: '',
      args: [],
    );
  }

  /// `Your Payment is successful!`
  String get payment_message_success {
    return Intl.message(
      'Your Payment is successful!',
      name: 'payment_message_success',
      desc: '',
      args: [],
    );
  }

  /// `Payment Failed`
  String get payment_failed {
    return Intl.message(
      'Payment Failed',
      name: 'payment_failed',
      desc: '',
      args: [],
    );
  }

  /// `Hey, {message}. Please Contact Support or please try again`
  String payment_error_message(Object message) {
    return Intl.message(
      'Hey, $message. Please Contact Support or please try again',
      name: 'payment_error_message',
      desc: '',
      args: [message],
    );
  }

  /// `Back to Subscription`
  String get back_to_subscription {
    return Intl.message(
      'Back to Subscription',
      name: 'back_to_subscription',
      desc: '',
      args: [],
    );
  }

  /// `Have a question?`
  String get have_question {
    return Intl.message(
      'Have a question?',
      name: 'have_question',
      desc: '',
      args: [],
    );
  }

  /// `Contact Support`
  String get contact_support {
    return Intl.message(
      'Contact Support',
      name: 'contact_support',
      desc: '',
      args: [],
    );
  }

  /// `Call Customer Care`
  String get callCustomerCare {
    return Intl.message(
      'Call Customer Care',
      name: 'callCustomerCare',
      desc: '',
      args: [],
    );
  }

  /// `Need urgent help? Speak directly with our customer care team.`
  String get urgentHelp {
    return Intl.message(
      'Need urgent help? Speak directly with our customer care team.',
      name: 'urgentHelp',
      desc: '',
      args: [],
    );
  }

  /// `Call +977 9707051010`
  String get callNumber {
    return Intl.message(
      'Call +977 9707051010',
      name: 'callNumber',
      desc: '',
      args: [],
    );
  }

  /// `How can we help you today?`
  String get howCanWeHelp {
    return Intl.message(
      'How can we help you today?',
      name: 'howCanWeHelp',
      desc: '',
      args: [],
    );
  }

  /// `Please choose one of the following options`
  String get chooseOption {
    return Intl.message(
      'Please choose one of the following options',
      name: 'chooseOption',
      desc: '',
      args: [],
    );
  }

  /// `Talk to a Live Support Agent`
  String get liveSupport {
    return Intl.message(
      'Talk to a Live Support Agent',
      name: 'liveSupport',
      desc: '',
      args: [],
    );
  }

  /// `Get real-time assistance from our team.`
  String get liveSupportSubtitle {
    return Intl.message(
      'Get real-time assistance from our team.',
      name: 'liveSupportSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Chat with Us on WhatsApp`
  String get whatsappChat {
    return Intl.message(
      'Chat with Us on WhatsApp',
      name: 'whatsappChat',
      desc: '',
      args: [],
    );
  }

  /// `Quick support via WhatsApp.`
  String get whatsappSubtitle {
    return Intl.message(
      'Quick support via WhatsApp.',
      name: 'whatsappSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Tutorial Videos`
  String get tutorialVideos {
    return Intl.message(
      'Tutorial Videos',
      name: 'tutorialVideos',
      desc: '',
      args: [],
    );
  }

  /// `Learn how to use key features of the app.`
  String get tutorialSubtitle {
    return Intl.message(
      'Learn how to use key features of the app.',
      name: 'tutorialSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `FAQs`
  String get faq {
    return Intl.message('FAQs', name: 'faq', desc: '', args: []);
  }

  /// `Find answers to common questions.`
  String get faqSubtitle {
    return Intl.message(
      'Find answers to common questions.',
      name: 'faqSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `We're available to take calls from `
  String get availability {
    return Intl.message(
      'We\'re available to take calls from ',
      name: 'availability',
      desc: '',
      args: [],
    );
  }

  /// `Sunday to Friday 10:00 AM to 06:00 PM`
  String get availabilityHours {
    return Intl.message(
      'Sunday to Friday 10:00 AM to 06:00 PM',
      name: 'availabilityHours',
      desc: '',
      args: [],
    );
  }

  /// `. You can drop us a message on WhatsApp anytime, we'll reach you ASAP.`
  String get availabilityFooter {
    return Intl.message(
      '. You can drop us a message on WhatsApp anytime, we\'ll reach you ASAP.',
      name: 'availabilityFooter',
      desc: '',
      args: [],
    );
  }

  /// `Could not open WhatsApp`
  String get couldNotLaunchWhatsApp {
    return Intl.message(
      'Could not open WhatsApp',
      name: 'couldNotLaunchWhatsApp',
      desc: '',
      args: [],
    );
  }

  /// `Could not open website`
  String get couldNotLaunchWeb {
    return Intl.message(
      'Could not open website',
      name: 'couldNotLaunchWeb',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Info`
  String get vehicleInfo {
    return Intl.message(
      'Vehicle Info',
      name: 'vehicleInfo',
      desc: '',
      args: [],
    );
  }

  /// `Basic Metrics`
  String get basicMetrics {
    return Intl.message(
      'Basic Metrics',
      name: 'basicMetrics',
      desc: '',
      args: [],
    );
  }

  /// `Timestamp & Position`
  String get timestampAndPosition {
    return Intl.message(
      'Timestamp & Position',
      name: 'timestampAndPosition',
      desc: '',
      args: [],
    );
  }

  /// `Battery & Charging`
  String get batteryAndCharging {
    return Intl.message(
      'Battery & Charging',
      name: 'batteryAndCharging',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle State`
  String get vehicleState {
    return Intl.message(
      'Vehicle State',
      name: 'vehicleState',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message('Time', name: 'time', desc: '', args: []);
  }

  /// `Satellite`
  String get satellite {
    return Intl.message('Satellite', name: 'satellite', desc: '', args: []);
  }

  /// `Vehicle Setting`
  String get vehicleSetting {
    return Intl.message(
      'Vehicle Setting',
      name: 'vehicleSetting',
      desc: '',
      args: [],
    );
  }

  /// `Basic Information`
  String get basicInformation {
    return Intl.message(
      'Basic Information',
      name: 'basicInformation',
      desc: '',
      args: [],
    );
  }

  /// `Expiration Date`
  String get expirationDate {
    return Intl.message(
      'Expiration Date',
      name: 'expirationDate',
      desc: '',
      args: [],
    );
  }

  /// `Usage Parameters`
  String get usageParameters {
    return Intl.message(
      'Usage Parameters',
      name: 'usageParameters',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Odometer Reading`
  String get vehicleOdometerReading {
    return Intl.message(
      'Vehicle Odometer Reading',
      name: 'vehicleOdometerReading',
      desc: '',
      args: [],
    );
  }

  /// `Expected Mileage`
  String get expectedMileage {
    return Intl.message(
      'Expected Mileage',
      name: 'expectedMileage',
      desc: '',
      args: [],
    );
  }

  /// `Speed Limit`
  String get speedLimit {
    return Intl.message('Speed Limit', name: 'speedLimit', desc: '', args: []);
  }

  /// `Connectivity`
  String get connectivity {
    return Intl.message(
      'Connectivity',
      name: 'connectivity',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number (SIM)`
  String get phoneNumberSim {
    return Intl.message(
      'Phone Number (SIM)',
      name: 'phoneNumberSim',
      desc: '',
      args: [],
    );
  }

  /// `IMEI Number`
  String get imeiNumber {
    return Intl.message('IMEI Number', name: 'imeiNumber', desc: '', args: []);
  }

  /// `Change Vehicle Icon`
  String get changeVehicleIcon {
    return Intl.message(
      'Change Vehicle Icon',
      name: 'changeVehicleIcon',
      desc: '',
      args: [],
    );
  }

  /// `Update Icon`
  String get updateIcon {
    return Intl.message('Update Icon', name: 'updateIcon', desc: '', args: []);
  }

  /// `Vehicle name cannot be empty`
  String get vehicleNameEmpty {
    return Intl.message(
      'Vehicle name cannot be empty',
      name: 'vehicleNameEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Name unchanged`
  String get vehicleNameUnchanged {
    return Intl.message(
      'Name unchanged',
      name: 'vehicleNameUnchanged',
      desc: '',
      args: [],
    );
  }

  /// `Speed must be > 20 km/h`
  String get speedMustBeGreaterThan {
    return Intl.message(
      'Speed must be > 20 km/h',
      name: 'speedMustBeGreaterThan',
      desc: '',
      args: [],
    );
  }

  /// `Mileage set successfully`
  String get mileageSetSuccess {
    return Intl.message(
      'Mileage set successfully',
      name: 'mileageSetSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Setting mileage failed`
  String get mileageSetFailed {
    return Intl.message(
      'Setting mileage failed',
      name: 'mileageSetFailed',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle name updated successfully`
  String get vehicleNameUpdateSuccess {
    return Intl.message(
      'Vehicle name updated successfully',
      name: 'vehicleNameUpdateSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Speed limit updated`
  String get speedLimitUpdated {
    return Intl.message(
      'Speed limit updated',
      name: 'speedLimitUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle icon updated successfully`
  String get vehicleIconUpdated {
    return Intl.message(
      'Vehicle icon updated successfully',
      name: 'vehicleIconUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle category updated successfully`
  String get vehicleCategoryUpdated {
    return Intl.message(
      'Vehicle category updated successfully',
      name: 'vehicleCategoryUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle attributes updated`
  String get vehicleAttributesUpdated {
    return Intl.message(
      'Vehicle attributes updated',
      name: 'vehicleAttributesUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update vehicle attributes`
  String get updateVehicleAttributesFailed {
    return Intl.message(
      'Failed to update vehicle attributes',
      name: 'updateVehicleAttributesFailed',
      desc: '',
      args: [],
    );
  }

  /// `N/A`
  String get nA {
    return Intl.message('N/A', name: 'nA', desc: '', args: []);
  }

  /// `Vehicle Playback`
  String get vehiclePlayback {
    return Intl.message(
      'Vehicle Playback',
      name: 'vehiclePlayback',
      desc: '',
      args: [],
    );
  }

  /// `Poor`
  String get poorSignal {
    return Intl.message('Poor', name: 'poorSignal', desc: '', args: []);
  }

  /// `Normal`
  String get normalSignal {
    return Intl.message('Normal', name: 'normalSignal', desc: '', args: []);
  }

  /// `High`
  String get highSignal {
    return Intl.message('High', name: 'highSignal', desc: '', args: []);
  }

  /// `Distance`
  String get distanceLabel {
    return Intl.message('Distance', name: 'distanceLabel', desc: '', args: []);
  }

  /// `Speed`
  String get speedLabel {
    return Intl.message('Speed', name: 'speedLabel', desc: '', args: []);
  }

  /// `Runtime`
  String get runtimeLabel {
    return Intl.message('Runtime', name: 'runtimeLabel', desc: '', args: []);
  }

  /// `Started from`
  String get startedFrom {
    return Intl.message(
      'Started from',
      name: 'startedFrom',
      desc: '',
      args: [],
    );
  }

  /// `Arrived on`
  String get arrivedOn {
    return Intl.message('Arrived on', name: 'arrivedOn', desc: '', args: []);
  }

  /// `Stopped at`
  String get stoppedAt {
    return Intl.message('Stopped at', name: 'stoppedAt', desc: '', args: []);
  }

  /// `km/h`
  String get kmPerHour {
    return Intl.message('km/h', name: 'kmPerHour', desc: '', args: []);
  }

  /// `Runtime`
  String get runtime {
    return Intl.message('Runtime', name: 'runtime', desc: '', args: []);
  }

  /// `s`
  String get seconds {
    return Intl.message('s', name: 'seconds', desc: '', args: []);
  }

  /// `m`
  String get minutes {
    return Intl.message('m', name: 'minutes', desc: '', args: []);
  }

  /// `h`
  String get hourShort {
    return Intl.message('h', name: 'hourShort', desc: '', args: []);
  }

  /// `m`
  String get minuteShort {
    return Intl.message('m', name: 'minuteShort', desc: '', args: []);
  }

  /// `Trip`
  String get trip {
    return Intl.message('Trip', name: 'trip', desc: '', args: []);
  }

  /// `s`
  String get secondShort {
    return Intl.message('s', name: 'secondShort', desc: '', args: []);
  }

  /// `Ignition`
  String get vehicleIgnition {
    return Intl.message(
      'Ignition',
      name: 'vehicleIgnition',
      desc: '',
      args: [],
    );
  }

  /// `ON`
  String get vehicleIgnitionOn {
    return Intl.message('ON', name: 'vehicleIgnitionOn', desc: '', args: []);
  }

  /// `OFF`
  String get vehicleIgnitionOff {
    return Intl.message('OFF', name: 'vehicleIgnitionOff', desc: '', args: []);
  }

  /// `Status`
  String get vehicleStatus {
    return Intl.message('Status', name: 'vehicleStatus', desc: '', args: []);
  }

  /// `Online`
  String get vehicleStatusOnline {
    return Intl.message(
      'Online',
      name: 'vehicleStatusOnline',
      desc: '',
      args: [],
    );
  }

  /// `Offline`
  String get vehicleStatusOffline {
    return Intl.message(
      'Offline',
      name: 'vehicleStatusOffline',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get vehicleDashboard {
    return Intl.message(
      'Dashboard',
      name: 'vehicleDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Live Track`
  String get vehicleLiveTrack {
    return Intl.message(
      'Live Track',
      name: 'vehicleLiveTrack',
      desc: '',
      args: [],
    );
  }

  /// `More Info`
  String get vehicleMoreInfo {
    return Intl.message(
      'More Info',
      name: 'vehicleMoreInfo',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get statusActive {
    return Intl.message('Active', name: 'statusActive', desc: '', args: []);
  }

  /// `Unavailable`
  String get statusUnavailable {
    return Intl.message(
      'Unavailable',
      name: 'statusUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `1 Mins ago`
  String get statusOneMinuteAgo {
    return Intl.message(
      '1 Mins ago',
      name: 'statusOneMinuteAgo',
      desc: '',
      args: [],
    );
  }

  /// `Mins`
  String get statusMinutesLabel {
    return Intl.message('Mins', name: 'statusMinutesLabel', desc: '', args: []);
  }

  /// `ago`
  String get statusAgoSuffix {
    return Intl.message('ago', name: 'statusAgoSuffix', desc: '', args: []);
  }

  /// `Vehicle List`
  String get vehicleList {
    return Intl.message(
      'Vehicle List',
      name: 'vehicleList',
      desc: '',
      args: [],
    );
  }

  /// `Search by vehicle...`
  String get searchVehicle {
    return Intl.message(
      'Search by vehicle...',
      name: 'searchVehicle',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Expired`
  String get vehicleExpired {
    return Intl.message(
      'Vehicle Expired',
      name: 'vehicleExpired',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle will expire on {date}`
  String vehicleWillExpireOn(Object date) {
    return Intl.message(
      'Vehicle will expire on $date',
      name: 'vehicleWillExpireOn',
      desc: '',
      args: [date],
    );
  }

  /// `Renew`
  String get renew {
    return Intl.message('Renew', name: 'renew', desc: '', args: []);
  }

  /// `{days} Days Left`
  String daysLeft(Object days) {
    return Intl.message(
      '$days Days Left',
      name: 'daysLeft',
      desc: '',
      args: [days],
    );
  }

  /// `Vehicle has expired on {date}`
  String vehicleExpiredOn(Object date) {
    return Intl.message(
      'Vehicle has expired on $date',
      name: 'vehicleExpiredOn',
      desc: '',
      args: [date],
    );
  }

  /// `Control Center`
  String get controlCenter {
    return Intl.message(
      'Control Center',
      name: 'controlCenter',
      desc: '',
      args: [],
    );
  }

  /// `Set Geofence`
  String get setGeofenceTitle {
    return Intl.message(
      'Set Geofence',
      name: 'setGeofenceTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create & manage geofence`
  String get setGeofenceSubtitle {
    return Intl.message(
      'Create & manage geofence',
      name: 'setGeofenceSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Setting`
  String get vehicleSettingTitle {
    return Intl.message(
      'Vehicle Setting',
      name: 'vehicleSettingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Customize your vehicle performance`
  String get vehicleSettingSubtitle {
    return Intl.message(
      'Customize your vehicle performance',
      name: 'vehicleSettingSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `No Address`
  String get noAddress {
    return Intl.message('No Address', name: 'noAddress', desc: '', args: []);
  }

  /// `Signal`
  String get signalLabel {
    return Intl.message('Signal', name: 'signalLabel', desc: '', args: []);
  }

  /// `Satellites`
  String get satellitesLabel {
    return Intl.message(
      'Satellites',
      name: 'satellitesLabel',
      desc: '',
      args: [],
    );
  }

  /// `Expired`
  String get expired {
    return Intl.message('Expired', name: 'expired', desc: '', args: []);
  }

  /// `Cannot access expired vehicle.`
  String get vehicleCannotAccessExpired {
    return Intl.message(
      'Cannot access expired vehicle.',
      name: 'vehicleCannotAccessExpired',
      desc: '',
      args: [],
    );
  }

  /// `Share Vehicle Location`
  String get shareVehicleLocation {
    return Intl.message(
      'Share Vehicle Location',
      name: 'shareVehicleLocation',
      desc: '',
      args: [],
    );
  }

  /// `Share Link`
  String get shareLink {
    return Intl.message('Share Link', name: 'shareLink', desc: '', args: []);
  }

  /// `Unable to load link`
  String get unableToLoadLink {
    return Intl.message(
      'Unable to load link',
      name: 'unableToLoadLink',
      desc: '',
      args: [],
    );
  }

  /// `Link Copied to Clipboard`
  String get linkCopiedToClipboard {
    return Intl.message(
      'Link Copied to Clipboard',
      name: 'linkCopiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Expire After`
  String get expireAfter {
    return Intl.message(
      'Expire After',
      name: 'expireAfter',
      desc: '',
      args: [],
    );
  }

  /// `Share Link`
  String get shareLinkButton {
    return Intl.message(
      'Share Link',
      name: 'shareLinkButton',
      desc: '',
      args: [],
    );
  }

  /// `24hr`
  String get duration24hr {
    return Intl.message('24hr', name: 'duration24hr', desc: '', args: []);
  }

  /// `3 days`
  String get duration3days {
    return Intl.message('3 days', name: 'duration3days', desc: '', args: []);
  }

  /// `7 days`
  String get duration7days {
    return Intl.message('7 days', name: 'duration7days', desc: '', args: []);
  }

  /// `30 days`
  String get duration30days {
    return Intl.message('30 days', name: 'duration30days', desc: '', args: []);
  }

  /// `Live`
  String get tabLive {
    return Intl.message('Live', name: 'tabLive', desc: '', args: []);
  }

  /// `Devices`
  String get tabDevices {
    return Intl.message('Devices', name: 'tabDevices', desc: '', args: []);
  }

  /// `Events`
  String get tabEvents {
    return Intl.message('Events', name: 'tabEvents', desc: '', args: []);
  }

  /// `Settings`
  String get tabSettings {
    return Intl.message('Settings', name: 'tabSettings', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Welcome to`
  String get onboardTitle1 {
    return Intl.message(
      'Welcome to',
      name: 'onboardTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Trackon GPS`
  String get onboardTitleShort1 {
    return Intl.message(
      'Trackon GPS',
      name: 'onboardTitleShort1',
      desc: '',
      args: [],
    );
  }

  /// `Simplify your fleet operations and stay in control—anytime, anywhere.`
  String get onboardSubtitle1 {
    return Intl.message(
      'Simplify your fleet operations and stay in control—anytime, anywhere.',
      name: 'onboardSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Track Every Vehicle in`
  String get onboardTitle2 {
    return Intl.message(
      'Track Every Vehicle in',
      name: 'onboardTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Real-Time`
  String get onboardTitleShort2 {
    return Intl.message(
      'Real-Time',
      name: 'onboardTitleShort2',
      desc: '',
      args: [],
    );
  }

  /// `Monitor location, speed, distance, and route in one place.`
  String get onboardSubtitle2 {
    return Intl.message(
      'Monitor location, speed, distance, and route in one place.',
      name: 'onboardSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Stay Notified`
  String get onboardTitle3 {
    return Intl.message(
      'Stay Notified',
      name: 'onboardTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Stay Safe`
  String get onboardTitleShort3 {
    return Intl.message(
      'Stay Safe',
      name: 'onboardTitleShort3',
      desc: '',
      args: [],
    );
  }

  /// `Get alerts for speeding, ignition, movement, and geofence breaches.`
  String get onboardSubtitle3 {
    return Intl.message(
      'Get alerts for speeding, ignition, movement, and geofence breaches.',
      name: 'onboardSubtitle3',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back!`
  String get signInWelcomeBack {
    return Intl.message(
      'Welcome Back!',
      name: 'signInWelcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your details to continue`
  String get signInSubtitle {
    return Intl.message(
      'Please enter your details to continue',
      name: 'signInSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number or Email`
  String get mobileOrEmail {
    return Intl.message(
      'Mobile Number or Email',
      name: 'mobileOrEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register Now`
  String get registerNow {
    return Intl.message(
      'Register Now',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `version:`
  String get version {
    return Intl.message('version:', name: 'version', desc: '', args: []);
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Verify OTP`
  String get verifyOtp {
    return Intl.message('Verify OTP', name: 'verifyOtp', desc: '', args: []);
  }

  /// `Your Information`
  String get yourInformation {
    return Intl.message(
      'Your Information',
      name: 'yourInformation',
      desc: '',
      args: [],
    );
  }

  /// `Let's create your account to get started.`
  String get createAccountSubtitle {
    return Intl.message(
      'Let\'s create your account to get started.',
      name: 'createAccountSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `We sent a code to`
  String get verifyOtpSubtitle {
    return Intl.message(
      'We sent a code to',
      name: 'verifyOtpSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive it?`
  String get didNotReceiveIt {
    return Intl.message(
      'Didn\'t receive it?',
      name: 'didNotReceiveIt',
      desc: '',
      args: [],
    );
  }

  /// `Resend OTP`
  String get resendOtp {
    return Intl.message('Resend OTP', name: 'resendOtp', desc: '', args: []);
  }

  /// `Account created!`
  String get accountCreated {
    return Intl.message(
      'Account created!',
      name: 'accountCreated',
      desc: '',
      args: [],
    );
  }

  /// `OTP verified!`
  String get otpVerified {
    return Intl.message(
      'OTP verified!',
      name: 'otpVerified',
      desc: '',
      args: [],
    );
  }

  /// `Help is Always`
  String get onboardTitle4 {
    return Intl.message(
      'Help is Always',
      name: 'onboardTitle4',
      desc: '',
      args: [],
    );
  }

  /// `a Tap Away`
  String get onboardTitleShort4 {
    return Intl.message(
      'a Tap Away',
      name: 'onboardTitleShort4',
      desc: '',
      args: [],
    );
  }

  /// `Reach out to our support team via chat, call, or WhatsApp.`
  String get onboardSubtitle4 {
    return Intl.message(
      'Reach out to our support team via chat, call, or WhatsApp.',
      name: 'onboardSubtitle4',
      desc: '',
      args: [],
    );
  }

  /// `Code has been Resend to your email`
  String get codeSent {
    return Intl.message(
      'Code has been Resend to your email',
      name: 'codeSent',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPasswordTitle {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your registered email to reset your password`
  String get forgotPasswordSubtitle {
    return Intl.message(
      'Enter your registered email to reset your password',
      name: 'forgotPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter email or phone`
  String get enterEmailOrPhoneEmpty {
    return Intl.message(
      'Please enter email or phone',
      name: 'enterEmailOrPhoneEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email or phone number`
  String get invalidEmailOrPhone {
    return Intl.message(
      'Enter a valid email or phone number',
      name: 'invalidEmailOrPhone',
      desc: '',
      args: [],
    );
  }

  /// `Enter email/phone`
  String get enterEmailOrPhoneHint {
    return Intl.message(
      'Enter email/phone',
      name: 'enterEmailOrPhoneHint',
      desc: '',
      args: [],
    );
  }

  /// `Send OTP`
  String get sendOtp {
    return Intl.message('Send OTP', name: 'sendOtp', desc: '', args: []);
  }

  /// `Set New Password`
  String get setNewPasswordTitle {
    return Intl.message(
      'Set New Password',
      name: 'setNewPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password below`
  String get setNewPasswordSubtitle {
    return Intl.message(
      'Enter your new password below',
      name: 'setNewPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPasswordLabel {
    return Intl.message(
      'New Password',
      name: 'newPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPasswordHint {
    return Intl.message(
      'New Password',
      name: 'newPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPasswordLabel {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPasswordHint {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long`
  String get passwordTooShort {
    return Intl.message(
      'Password must be at least 8 characters long',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter`
  String get passwordUppercaseRequired {
    return Intl.message(
      'Password must contain at least one uppercase letter',
      name: 'passwordUppercaseRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one lowercase letter`
  String get passwordLowercaseRequired {
    return Intl.message(
      'Password must contain at least one lowercase letter',
      name: 'passwordLowercaseRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one number`
  String get passwordNumberRequired {
    return Intl.message(
      'Password must contain at least one number',
      name: 'passwordNumberRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one special character`
  String get passwordSpecialCharRequired {
    return Intl.message(
      'Password must contain at least one special character',
      name: 'passwordSpecialCharRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get confirmPasswordRequired {
    return Intl.message(
      'Please confirm your password',
      name: 'confirmPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Verify Account`
  String get verifyAccount {
    return Intl.message(
      'Verify Account',
      name: 'verifyAccount',
      desc: '',
      args: [],
    );
  }

  /// `We just sent a verification code to your phone number +977 {value}`
  String sentToPhone(Object value) {
    return Intl.message(
      'We just sent a verification code to your phone number +977 $value',
      name: 'sentToPhone',
      desc: '',
      args: [value],
    );
  }

  /// `We just sent a verification code to your email {value}`
  String sentToEmail(Object value) {
    return Intl.message(
      'We just sent a verification code to your email $value',
      name: 'sentToEmail',
      desc: '',
      args: [value],
    );
  }

  /// `Please enter the PIN code`
  String get otpEmptyError {
    return Intl.message(
      'Please enter the PIN code',
      name: 'otpEmptyError',
      desc: '',
      args: [],
    );
  }

  /// `PIN must be 6 digits`
  String get otpLengthError {
    return Intl.message(
      'PIN must be 6 digits',
      name: 'otpLengthError',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueButton {
    return Intl.message('Continue', name: 'continueButton', desc: '', args: []);
  }

  /// `Didn’t receive code?`
  String get didntReceiveCode {
    return Intl.message(
      'Didn’t receive code?',
      name: 'didntReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message('Resend Code', name: 'resendCode', desc: '', args: []);
  }

  /// `Password Reset Successfully!`
  String get passwordResetTitle {
    return Intl.message(
      'Password Reset Successfully!',
      name: 'passwordResetTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been updated successfully. You can now log in with your new password.`
  String get passwordResetSubtitle {
    return Intl.message(
      'Your password has been updated successfully. You can now log in with your new password.',
      name: 'passwordResetSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Add your details to complete signup.`
  String get yourInformationSubtitle {
    return Intl.message(
      'Add your details to complete signup.',
      name: 'yourInformationSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Map Styles`
  String get map_styles_title {
    return Intl.message(
      'Map Styles',
      name: 'map_styles_title',
      desc: '',
      args: [],
    );
  }

  /// `Apply Setting`
  String get apply_setting {
    return Intl.message(
      'Apply Setting',
      name: 'apply_setting',
      desc: '',
      args: [],
    );
  }

  /// `Simple`
  String get simple {
    return Intl.message('Simple', name: 'simple', desc: '', args: []);
  }

  /// `Classic`
  String get classic {
    return Intl.message('Classic', name: 'classic', desc: '', args: []);
  }

  /// `Terrain`
  String get terrain {
    return Intl.message('Terrain', name: 'terrain', desc: '', args: []);
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Preference`
  String get preferenceTitle {
    return Intl.message(
      'Preference',
      name: 'preferenceTitle',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get generalSection {
    return Intl.message('General', name: 'generalSection', desc: '', args: []);
  }

  /// `Add New Device`
  String get addNewDeviceLabel {
    return Intl.message(
      'Add New Device',
      name: 'addNewDeviceLabel',
      desc: '',
      args: [],
    );
  }

  /// `Add your new device & start managing `
  String get addNewDeviceValue {
    return Intl.message(
      'Add your new device & start managing ',
      name: 'addNewDeviceValue',
      desc: '',
      args: [],
    );
  }

  /// `Trackon Shop`
  String get trackonShopLabel {
    return Intl.message(
      'Trackon Shop',
      name: 'trackonShopLabel',
      desc: '',
      args: [],
    );
  }

  /// `Buy Trackon accessories and devices`
  String get trackonShopValue {
    return Intl.message(
      'Buy Trackon accessories and devices',
      name: 'trackonShopValue',
      desc: '',
      args: [],
    );
  }

  /// `Device Related Actions`
  String get deviceRelatedActions {
    return Intl.message(
      'Device Related Actions',
      name: 'deviceRelatedActions',
      desc: '',
      args: [],
    );
  }

  /// `Manage Geofences`
  String get manageGeofencesLabel {
    return Intl.message(
      'Manage Geofences',
      name: 'manageGeofencesLabel',
      desc: '',
      args: [],
    );
  }

  /// `Create & manage geofence `
  String get manageGeofencesValue {
    return Intl.message(
      'Create & manage geofence ',
      name: 'manageGeofencesValue',
      desc: '',
      args: [],
    );
  }

  /// `Manage Subscriptions`
  String get manageSubscriptionsLabel {
    return Intl.message(
      'Manage Subscriptions',
      name: 'manageSubscriptionsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Manage your vehicle subscription plan `
  String get manageSubscriptionsValue {
    return Intl.message(
      'Manage your vehicle subscription plan ',
      name: 'manageSubscriptionsValue',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get moreSection {
    return Intl.message('More', name: 'moreSection', desc: '', args: []);
  }

  /// `Settings`
  String get settingsLabel {
    return Intl.message('Settings', name: 'settingsLabel', desc: '', args: []);
  }

  /// `Change notifications preferences`
  String get settingsValue {
    return Intl.message(
      'Change notifications preferences',
      name: 'settingsValue',
      desc: '',
      args: [],
    );
  }

  /// `About Trackon GPS`
  String get aboutTrackonGPSLabel {
    return Intl.message(
      'About Trackon GPS',
      name: 'aboutTrackonGPSLabel',
      desc: '',
      args: [],
    );
  }

  /// `Know more about our app, terms & policies `
  String get aboutTrackonGPSValue {
    return Intl.message(
      'Know more about our app, terms & policies ',
      name: 'aboutTrackonGPSValue',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support`
  String get helpSupportLabel {
    return Intl.message(
      'Help & Support',
      name: 'helpSupportLabel',
      desc: '',
      args: [],
    );
  }

  /// `Get help from our support team`
  String get helpSupportValue {
    return Intl.message(
      'Get help from our support team',
      name: 'helpSupportValue',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logoutLabel {
    return Intl.message('Logout', name: 'logoutLabel', desc: '', args: []);
  }

  /// `Exit & return to login screen.`
  String get logoutValue {
    return Intl.message(
      'Exit & return to login screen.',
      name: 'logoutValue',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logoutDialogTitle {
    return Intl.message(
      'Logout',
      name: 'logoutDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get logoutDialogContent {
    return Intl.message(
      'Are you sure?',
      name: 'logoutDialogContent',
      desc: '',
      args: [],
    );
  }

  /// `Preference`
  String get label_preference {
    return Intl.message(
      'Preference',
      name: 'label_preference',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get label_general {
    return Intl.message('General', name: 'label_general', desc: '', args: []);
  }

  /// `Device Related Actions`
  String get label_device_related_actions {
    return Intl.message(
      'Device Related Actions',
      name: 'label_device_related_actions',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get label_more {
    return Intl.message('More', name: 'label_more', desc: '', args: []);
  }

  /// `Add New Device`
  String get label_add_new_device {
    return Intl.message(
      'Add New Device',
      name: 'label_add_new_device',
      desc: '',
      args: [],
    );
  }

  /// `Add your new device & start managing`
  String get desc_add_new_device {
    return Intl.message(
      'Add your new device & start managing',
      name: 'desc_add_new_device',
      desc: '',
      args: [],
    );
  }

  /// `Trackon Shop`
  String get label_trackon_shop {
    return Intl.message(
      'Trackon Shop',
      name: 'label_trackon_shop',
      desc: '',
      args: [],
    );
  }

  /// `Buy Trackon accessories and devices`
  String get desc_trackon_shop {
    return Intl.message(
      'Buy Trackon accessories and devices',
      name: 'desc_trackon_shop',
      desc: '',
      args: [],
    );
  }

  /// `Manage Geofences`
  String get label_manage_geofences {
    return Intl.message(
      'Manage Geofences',
      name: 'label_manage_geofences',
      desc: '',
      args: [],
    );
  }

  /// `Create & manage geofence`
  String get desc_manage_geofences {
    return Intl.message(
      'Create & manage geofence',
      name: 'desc_manage_geofences',
      desc: '',
      args: [],
    );
  }

  /// `Manage Subscriptions`
  String get label_manage_subscriptions {
    return Intl.message(
      'Manage Subscriptions',
      name: 'label_manage_subscriptions',
      desc: '',
      args: [],
    );
  }

  /// `Manage your vehicle subscription plan`
  String get desc_manage_subscriptions {
    return Intl.message(
      'Manage your vehicle subscription plan',
      name: 'desc_manage_subscriptions',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get label_settings {
    return Intl.message('Settings', name: 'label_settings', desc: '', args: []);
  }

  /// `Change appearance, map view, notifications`
  String get desc_settings {
    return Intl.message(
      'Change appearance, map view, notifications',
      name: 'desc_settings',
      desc: '',
      args: [],
    );
  }

  /// `About Trackon GPS`
  String get label_about {
    return Intl.message(
      'About Trackon GPS',
      name: 'label_about',
      desc: '',
      args: [],
    );
  }

  /// `Know more about our app, terms & policies`
  String get desc_about {
    return Intl.message(
      'Know more about our app, terms & policies',
      name: 'desc_about',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support`
  String get label_help_support {
    return Intl.message(
      'Help & Support',
      name: 'label_help_support',
      desc: '',
      args: [],
    );
  }

  /// `Get help from our support team`
  String get desc_help_support {
    return Intl.message(
      'Get help from our support team',
      name: 'desc_help_support',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get label_logout {
    return Intl.message('Logout', name: 'label_logout', desc: '', args: []);
  }

  /// `Exit & return to login screen.`
  String get desc_logout {
    return Intl.message(
      'Exit & return to login screen.',
      name: 'desc_logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get desc_logout_confirmation {
    return Intl.message(
      'Are you sure?',
      name: 'desc_logout_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get account_settings {
    return Intl.message(
      'Account Settings',
      name: 'account_settings',
      desc: '',
      args: [],
    );
  }

  /// `Basic Information`
  String get basic_information {
    return Intl.message(
      'Basic Information',
      name: 'basic_information',
      desc: '',
      args: [],
    );
  }

  /// `Other Action`
  String get other_action {
    return Intl.message(
      'Other Action',
      name: 'other_action',
      desc: '',
      args: [],
    );
  }

  /// `Your Name`
  String get your_name {
    return Intl.message('Your Name', name: 'your_name', desc: '', args: []);
  }

  /// `Registered Number`
  String get registered_number {
    return Intl.message(
      'Registered Number',
      name: 'registered_number',
      desc: '',
      args: [],
    );
  }

  /// `No Number`
  String get no_number {
    return Intl.message('No Number', name: 'no_number', desc: '', args: []);
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Take Photo From Camera`
  String get take_photo_from_camera {
    return Intl.message(
      'Take Photo From Camera',
      name: 'take_photo_from_camera',
      desc: '',
      args: [],
    );
  }

  /// `Select Photo From Gallery`
  String get select_photo_from_gallery {
    return Intl.message(
      'Select Photo From Gallery',
      name: 'select_photo_from_gallery',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account?`
  String get are_you_sure_delete_account {
    return Intl.message(
      'Are you sure you want to delete your account?',
      name: 'are_you_sure_delete_account',
      desc: '',
      args: [],
    );
  }

  /// `Deleting your account will permanently remove your access to all fleet data, vehicle devices, records, and real-time tracking.\n\nThis action cannot be undone.`
  String get delete_account_warning {
    return Intl.message(
      'Deleting your account will permanently remove your access to all fleet data, vehicle devices, records, and real-time tracking.\n\nThis action cannot be undone.',
      name: 'delete_account_warning',
      desc: '',
      args: [],
    );
  }

  /// `I accept the terms, and I’m willing to delete this account permanently.`
  String get accept_delete_terms {
    return Intl.message(
      'I accept the terms, and I’m willing to delete this account permanently.',
      name: 'accept_delete_terms',
      desc: '',
      args: [],
    );
  }

  /// `Confirm account deletion`
  String get confirm_account_deletion {
    return Intl.message(
      'Confirm account deletion',
      name: 'confirm_account_deletion',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password to confirm this action.`
  String get enter_password_to_confirm {
    return Intl.message(
      'Please enter your password to confirm this action.',
      name: 'enter_password_to_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get current_password {
    return Intl.message(
      'Current Password',
      name: 'current_password',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Password`
  String get enter_password_hint {
    return Intl.message(
      'Please Enter Password',
      name: 'enter_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password to confirm this action.`
  String get enterPasswordToConfirm {
    return Intl.message(
      'Please enter your password to confirm this action.',
      name: 'enterPasswordToConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Password does not match`
  String get passwordMismatch {
    return Intl.message(
      'Password does not match',
      name: 'passwordMismatch',
      desc: '',
      args: [],
    );
  }

  /// `You can update your password here to keep your account secure.`
  String get change_password_hint {
    return Intl.message(
      'You can update your password here to keep your account secure.',
      name: 'change_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get delete_account {
    return Intl.message(
      'Delete Account',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }

  /// `If you delete your account, you’ll never be able to recover it in the future.`
  String get delete_account_hint {
    return Intl.message(
      'If you delete your account, you’ll never be able to recover it in the future.',
      name: 'delete_account_hint',
      desc: '',
      args: [],
    );
  }

  /// `Notification Settings`
  String get notificationSettings {
    return Intl.message(
      'Notification Settings',
      name: 'notificationSettings',
      desc: '',
      args: [],
    );
  }

  /// `Geofence`
  String get title_geofence {
    return Intl.message('Geofence', name: 'title_geofence', desc: '', args: []);
  }

  /// `Remove Geofence?`
  String get remove_geofence_title {
    return Intl.message(
      'Remove Geofence?',
      name: 'remove_geofence_title',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to remove this {geofenceName} from geofence list?`
  String remove_geofence_message(Object geofenceName) {
    return Intl.message(
      'Are you sure you want to remove this $geofenceName from geofence list?',
      name: 'remove_geofence_message',
      desc: '',
      args: [geofenceName],
    );
  }

  /// `Yes, Remove`
  String get yes_remove {
    return Intl.message('Yes, Remove', name: 'yes_remove', desc: '', args: []);
  }

  /// `Geofences`
  String get geofences {
    return Intl.message('Geofences', name: 'geofences', desc: '', args: []);
  }

  /// `Geofences Detail`
  String get geofences_detail {
    return Intl.message(
      'Geofences Detail',
      name: 'geofences_detail',
      desc: '',
      args: [],
    );
  }

  /// `Geofence Name`
  String get geofence_name_label {
    return Intl.message(
      'Geofence Name',
      name: 'geofence_name_label',
      desc: '',
      args: [],
    );
  }

  /// `Geofence Description`
  String get geofence_description_title {
    return Intl.message(
      'Geofence Description',
      name: 'geofence_description_title',
      desc: '',
      args: [],
    );
  }

  /// `Here will be the geofence description.`
  String get geofence_description_subtitle {
    return Intl.message(
      'Here will be the geofence description.',
      name: 'geofence_description_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Remove Geofence`
  String get remove_geofence_button {
    return Intl.message(
      'Remove Geofence',
      name: 'remove_geofence_button',
      desc: '',
      args: [],
    );
  }

  /// `अन्नपूर्ण मार्ग, बाग्मती प्रदेश, NP`
  String get geofence_address_sample {
    return Intl.message(
      'अन्नपूर्ण मार्ग, बाग्मती प्रदेश, NP',
      name: 'geofence_address_sample',
      desc: '',
      args: [],
    );
  }

  /// `Create GeoFence`
  String get create_geofence {
    return Intl.message(
      'Create GeoFence',
      name: 'create_geofence',
      desc: '',
      args: [],
    );
  }

  /// `Add Geofence Details`
  String get add_geofence_details {
    return Intl.message(
      'Add Geofence Details',
      name: 'add_geofence_details',
      desc: '',
      args: [],
    );
  }

  /// `'Geofence Description',`
  String get geofenceDescription {
    return Intl.message(
      '\'Geofence Description\',',
      name: 'geofenceDescription',
      desc: '',
      args: [],
    );
  }

  /// `Create Geofence`
  String get Create_geofence {
    return Intl.message(
      'Create Geofence',
      name: 'Create_geofence',
      desc: '',
      args: [],
    );
  }

  /// `Select this area`
  String get selectThisArea {
    return Intl.message(
      'Select this area',
      name: 'selectThisArea',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
