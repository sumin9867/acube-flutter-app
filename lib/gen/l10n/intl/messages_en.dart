// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(action, vehicleName) =>
      "Are you sure you want to ${action} the engine for ${vehicleName}?";

  static String m1(days) => "${days} Days Left";

  static String m2(message) =>
      "Hey, ${message}. Please Contact Support or please try again";

  static String m3(geofenceName) =>
      "Are you sure you want to remove this ${geofenceName} from geofence list?";

  static String m4(value) =>
      "We just sent a verification code to your email ${value}";

  static String m5(value) =>
      "We just sent a verification code to your phone number +977 ${value}";

  static String m6(date) => "Vehicle has expired on ${date}";

  static String m7(date) => "Vehicle will expire on ${date}";

  static String m8(name) => "Welcome, ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "Create_geofence": MessageLookupByLibrary.simpleMessage("Create Geofence"),
    "about": MessageLookupByLibrary.simpleMessage("About"),
    "aboutTrackonGPSLabel": MessageLookupByLibrary.simpleMessage(
      "About Trackon GPS",
    ),
    "aboutTrackonGPSValue": MessageLookupByLibrary.simpleMessage(
      "Know more about our app, terms & policies ",
    ),
    "acceleration": MessageLookupByLibrary.simpleMessage("Acceleration"),
    "accept_delete_terms": MessageLookupByLibrary.simpleMessage(
      "I accept the terms, and I’m willing to delete this account permanently.",
    ),
    "accountCreated": MessageLookupByLibrary.simpleMessage("Account created!"),
    "accountExpired": MessageLookupByLibrary.simpleMessage("Account Expired"),
    "account_settings": MessageLookupByLibrary.simpleMessage(
      "Account Settings",
    ),
    "accuracy": MessageLookupByLibrary.simpleMessage("Accuracy"),
    "activate": MessageLookupByLibrary.simpleMessage("Activate"),
    "activation": MessageLookupByLibrary.simpleMessage("Activation"),
    "addGeofence": MessageLookupByLibrary.simpleMessage("Add Geofence"),
    "addNewDeviceLabel": MessageLookupByLibrary.simpleMessage("Add New Device"),
    "addNewDeviceValue": MessageLookupByLibrary.simpleMessage(
      "Add your new device & start managing ",
    ),
    "addYourVehicle": MessageLookupByLibrary.simpleMessage("Add your Vehicle"),
    "add_geofence_details": MessageLookupByLibrary.simpleMessage(
      "Add Geofence Details",
    ),
    "add_vehicle_information": MessageLookupByLibrary.simpleMessage(
      "Add Vehicle Information",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Address"),
    "address_not_found": MessageLookupByLibrary.simpleMessage(
      "Address not found ....!",
    ),
    "afterInstallation": MessageLookupByLibrary.simpleMessage(
      "After Installation:",
    ),
    "afterInstallationNote1": MessageLookupByLibrary.simpleMessage(
      "Installation is completed as per video illustration",
    ),
    "afterInstallationNote2": MessageLookupByLibrary.simpleMessage(
      "LED (satellite) is stable",
    ),
    "afterInstallationNote3": MessageLookupByLibrary.simpleMessage(
      "LED (network) is stable",
    ),
    "alarm": MessageLookupByLibrary.simpleMessage("Alarm"),
    "alarmAccident": MessageLookupByLibrary.simpleMessage("Accident"),
    "alarmArm": MessageLookupByLibrary.simpleMessage("Arm Alarm"),
    "alarmBonnet": MessageLookupByLibrary.simpleMessage("Bonnet"),
    "alarmDisarm": MessageLookupByLibrary.simpleMessage("Disarm Alarm"),
    "alarmDismiss": MessageLookupByLibrary.simpleMessage("Dismiss Alarm"),
    "alarmDoor": MessageLookupByLibrary.simpleMessage("Door"),
    "alarmFallDown": MessageLookupByLibrary.simpleMessage("Fall Down"),
    "alarmFatigueDriving": MessageLookupByLibrary.simpleMessage(
      "Fatigue Driving",
    ),
    "alarmFault": MessageLookupByLibrary.simpleMessage("Fault"),
    "alarmFootBrake": MessageLookupByLibrary.simpleMessage("Foot Brake"),
    "alarmFuelLeak": MessageLookupByLibrary.simpleMessage("Fuel Leak"),
    "alarmGeneral": MessageLookupByLibrary.simpleMessage("General"),
    "alarmGeofence": MessageLookupByLibrary.simpleMessage("Geofence"),
    "alarmGeofenceEnter": MessageLookupByLibrary.simpleMessage(
      "Geofence Enter",
    ),
    "alarmGeofenceExit": MessageLookupByLibrary.simpleMessage("Geofence Exit"),
    "alarmGpsAntennaCut": MessageLookupByLibrary.simpleMessage(
      "GPS Antenna Cut",
    ),
    "alarmHardAcceleration": MessageLookupByLibrary.simpleMessage(
      "Hard Acceleration",
    ),
    "alarmHardBraking": MessageLookupByLibrary.simpleMessage("Hard Braking"),
    "alarmHardCornering": MessageLookupByLibrary.simpleMessage(
      "Hard Cornering",
    ),
    "alarmHighRpm": MessageLookupByLibrary.simpleMessage("High RPM"),
    "alarmIdle": MessageLookupByLibrary.simpleMessage("Idle"),
    "alarmJamming": MessageLookupByLibrary.simpleMessage("Jamming"),
    "alarmLaneChange": MessageLookupByLibrary.simpleMessage("Lane Change"),
    "alarmLock": MessageLookupByLibrary.simpleMessage("Lock"),
    "alarmLowBattery": MessageLookupByLibrary.simpleMessage("Low Battery"),
    "alarmLowPower": MessageLookupByLibrary.simpleMessage("Low Power"),
    "alarmLowspeed": MessageLookupByLibrary.simpleMessage("Low Speed"),
    "alarmMovement": MessageLookupByLibrary.simpleMessage("Movement"),
    "alarmOverspeed": MessageLookupByLibrary.simpleMessage("Overspeed"),
    "alarmParking": MessageLookupByLibrary.simpleMessage("Parking"),
    "alarmPowerCut": MessageLookupByLibrary.simpleMessage("Power Cut"),
    "alarmPowerOff": MessageLookupByLibrary.simpleMessage("Power Off"),
    "alarmPowerOn": MessageLookupByLibrary.simpleMessage("Power On"),
    "alarmPowerRestored": MessageLookupByLibrary.simpleMessage(
      "Power Restored",
    ),
    "alarmRemoving": MessageLookupByLibrary.simpleMessage("Removing"),
    "alarmShock": MessageLookupByLibrary.simpleMessage("Shock"),
    "alarmSos": MessageLookupByLibrary.simpleMessage("SOS"),
    "alarmTampering": MessageLookupByLibrary.simpleMessage("Tampering"),
    "alarmTemperature": MessageLookupByLibrary.simpleMessage("Temperature"),
    "alarmTow": MessageLookupByLibrary.simpleMessage("Tow"),
    "alarmUnlock": MessageLookupByLibrary.simpleMessage("Unlock"),
    "alarmVibration": MessageLookupByLibrary.simpleMessage("Vibration"),
    "all": MessageLookupByLibrary.simpleMessage("All"),
    "altitude": MessageLookupByLibrary.simpleMessage("Altitude"),
    "amount": MessageLookupByLibrary.simpleMessage("Amount"),
    "antitheft": MessageLookupByLibrary.simpleMessage("Anti-theft"),
    "antitheftImportantMessage": MessageLookupByLibrary.simpleMessage(
      "\'\'Antitheft mode is a security feature. It triggers an alarm on your phone(s) in two cases:!\n      • If vehicle\'s ignition is turned on.\n      • if vehicle is moved out of the Anti theft safe zone by towing/pushing or any other means.\'\'",
    ),
    "applyCode": MessageLookupByLibrary.simpleMessage("Apply Code"),
    "applyCouponCode": MessageLookupByLibrary.simpleMessage(
      "Apply Coupon Code",
    ),
    "apply_setting": MessageLookupByLibrary.simpleMessage("Apply Setting"),
    "approximate": MessageLookupByLibrary.simpleMessage("Approximate"),
    "archive": MessageLookupByLibrary.simpleMessage("Archive"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("Are you sure?"),
    "are_you_sure_delete_account": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete your account?",
    ),
    "armed": MessageLookupByLibrary.simpleMessage("Armed"),
    "arrivedOn": MessageLookupByLibrary.simpleMessage("Arrived on"),
    "audio": MessageLookupByLibrary.simpleMessage("Audio"),
    "availability": MessageLookupByLibrary.simpleMessage(
      "We\'re available to take calls from ",
    ),
    "availabilityFooter": MessageLookupByLibrary.simpleMessage(
      ". You can drop us a message on WhatsApp anytime, we\'ll reach you ASAP.",
    ),
    "availabilityHours": MessageLookupByLibrary.simpleMessage(
      "Sunday to Friday 10:00 AM to 06:00 PM",
    ),
    "averageSpeed": MessageLookupByLibrary.simpleMessage("Average Speed"),
    "avg_speed": MessageLookupByLibrary.simpleMessage("Avg. Speed"),
    "back_to_subscription": MessageLookupByLibrary.simpleMessage(
      "Back to Subscription",
    ),
    "basePrice": MessageLookupByLibrary.simpleMessage("Base Price:"),
    "basicInfo": MessageLookupByLibrary.simpleMessage("Basic Info"),
    "basicInformation": MessageLookupByLibrary.simpleMessage(
      "Basic Information",
    ),
    "basicMetrics": MessageLookupByLibrary.simpleMessage("Basic Metrics"),
    "basic_information": MessageLookupByLibrary.simpleMessage(
      "Basic Information",
    ),
    "battery": MessageLookupByLibrary.simpleMessage("Battery"),
    "batteryAndCharging": MessageLookupByLibrary.simpleMessage(
      "Battery & Charging",
    ),
    "batteryLevel": MessageLookupByLibrary.simpleMessage("Battery Level"),
    "blocked": MessageLookupByLibrary.simpleMessage("Blocked"),
    "bonusDays": MessageLookupByLibrary.simpleMessage("Bonus Days:"),
    "buyNewDevice": MessageLookupByLibrary.simpleMessage("Buy New Device"),
    "callCustomerCare": MessageLookupByLibrary.simpleMessage(
      "Call Customer Care",
    ),
    "callNumber": MessageLookupByLibrary.simpleMessage("Call +977 9707051010"),
    "cameraPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "Camera permission is required to scan QR codes.",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cannotAddThisDeviceContactSupport": MessageLookupByLibrary.simpleMessage(
      "Cannot add this device, contact support.",
    ),
    "categoryAnimal": MessageLookupByLibrary.simpleMessage("Animal"),
    "categoryArrow": MessageLookupByLibrary.simpleMessage("Arrow"),
    "categoryBicycle": MessageLookupByLibrary.simpleMessage("Bicycle"),
    "categoryBoat": MessageLookupByLibrary.simpleMessage("Boat"),
    "categoryBus": MessageLookupByLibrary.simpleMessage("Bus"),
    "categoryCar": MessageLookupByLibrary.simpleMessage("Car"),
    "categoryCrane": MessageLookupByLibrary.simpleMessage("Crane"),
    "categoryDefault": MessageLookupByLibrary.simpleMessage("Default"),
    "categoryHelicopter": MessageLookupByLibrary.simpleMessage("Helicopter"),
    "categoryMotorcycle": MessageLookupByLibrary.simpleMessage("Motorcycle"),
    "categoryOffroad": MessageLookupByLibrary.simpleMessage("Offroad"),
    "categoryPerson": MessageLookupByLibrary.simpleMessage("Person"),
    "categoryPickup": MessageLookupByLibrary.simpleMessage("Pickup"),
    "categoryPlane": MessageLookupByLibrary.simpleMessage("Plane"),
    "categoryScooter": MessageLookupByLibrary.simpleMessage("Scooter"),
    "categoryShip": MessageLookupByLibrary.simpleMessage("Ship"),
    "categoryTractor": MessageLookupByLibrary.simpleMessage("Tractor"),
    "categoryTrain": MessageLookupByLibrary.simpleMessage("Train"),
    "categoryTram": MessageLookupByLibrary.simpleMessage("Tram"),
    "categoryTrolleybus": MessageLookupByLibrary.simpleMessage("Trolleybus"),
    "categoryTruck": MessageLookupByLibrary.simpleMessage("Truck"),
    "categoryVan": MessageLookupByLibrary.simpleMessage("Van"),
    "change": MessageLookupByLibrary.simpleMessage("Change"),
    "changePassword": MessageLookupByLibrary.simpleMessage("Change Password"),
    "changeVehicleIcon": MessageLookupByLibrary.simpleMessage(
      "Change Vehicle Icon",
    ),
    "change_password": MessageLookupByLibrary.simpleMessage("Change Password"),
    "change_password_hint": MessageLookupByLibrary.simpleMessage(
      "You can update your password here to keep your account secure.",
    ),
    "charge": MessageLookupByLibrary.simpleMessage("Charge"),
    "checkTheBackSideOfTheDevice": MessageLookupByLibrary.simpleMessage(
      "CHECK THE BACK SIDE OF THE DEVICE",
    ),
    "chooseOption": MessageLookupByLibrary.simpleMessage(
      "Please choose one of the following options",
    ),
    "chooseVehicleIcon": MessageLookupByLibrary.simpleMessage(
      "Choose Vehicle Icon",
    ),
    "classic": MessageLookupByLibrary.simpleMessage("Classic"),
    "clickHereToScanBarCodePart1": MessageLookupByLibrary.simpleMessage(
      "Click here",
    ),
    "clickHereToScanBarCodePart2": MessageLookupByLibrary.simpleMessage(
      "to scan bar code",
    ),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "codeSent": MessageLookupByLibrary.simpleMessage(
      "Code has been Resend to your email",
    ),
    "command": MessageLookupByLibrary.simpleMessage("Command"),
    "commandDeviceIdentification": MessageLookupByLibrary.simpleMessage(
      "Device Identification",
    ),
    "commandPositionPeriodic": MessageLookupByLibrary.simpleMessage(
      "Periodic Reporting",
    ),
    "commandPositionSingle": MessageLookupByLibrary.simpleMessage(
      "Single Reporting",
    ),
    "commandPositionStop": MessageLookupByLibrary.simpleMessage(
      "Stop Reporting",
    ),
    "commandQueued": MessageLookupByLibrary.simpleMessage("Command queued"),
    "commandResult": MessageLookupByLibrary.simpleMessage("Command result"),
    "commandSend": MessageLookupByLibrary.simpleMessage("Send"),
    "commandSent": MessageLookupByLibrary.simpleMessage("Command sent"),
    "commandTitle": MessageLookupByLibrary.simpleMessage("Command"),
    "commandUnit": MessageLookupByLibrary.simpleMessage("Unit"),
    "command_sent": MessageLookupByLibrary.simpleMessage("Command Sent"),
    "configuration": MessageLookupByLibrary.simpleMessage("Configuration"),
    "confirmLockMessage": m0,
    "confirmLockNoteLock": MessageLookupByLibrary.simpleMessage(
      "This will disable the vehicle\'s electrical systems until unlocked.",
    ),
    "confirmLockNoteUnlock": MessageLookupByLibrary.simpleMessage(
      "This will restore the vehicle’s electrical systems.",
    ),
    "confirmLockTitle": MessageLookupByLibrary.simpleMessage("Confirm Lock?"),
    "confirmPasswordHint": MessageLookupByLibrary.simpleMessage(
      "Confirm Password",
    ),
    "confirmPasswordLabel": MessageLookupByLibrary.simpleMessage(
      "Confirm Password",
    ),
    "confirmPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "Please confirm your password",
    ),
    "confirm_account_deletion": MessageLookupByLibrary.simpleMessage(
      "Confirm account deletion",
    ),
    "connectivity": MessageLookupByLibrary.simpleMessage("Connectivity"),
    "contactSupport": MessageLookupByLibrary.simpleMessage("Contact Support"),
    "contact_support": MessageLookupByLibrary.simpleMessage("Contact Support"),
    "continueButton": MessageLookupByLibrary.simpleMessage("Continue"),
    "continueToScanQr": MessageLookupByLibrary.simpleMessage(
      "Continue to Scan QR",
    ),
    "continue_btn": MessageLookupByLibrary.simpleMessage("Continue"),
    "controlCenter": MessageLookupByLibrary.simpleMessage("Control Center"),
    "couldNotLaunchWeb": MessageLookupByLibrary.simpleMessage(
      "Could not open website",
    ),
    "couldNotLaunchWhatsApp": MessageLookupByLibrary.simpleMessage(
      "Could not open WhatsApp",
    ),
    "couponApplied": MessageLookupByLibrary.simpleMessage(
      "Coupon Applied! Discount:",
    ),
    "couponAppliedSuccess": MessageLookupByLibrary.simpleMessage(
      "Coupon Code applied successfully!",
    ),
    "couponHere": MessageLookupByLibrary.simpleMessage("Coupon here"),
    "course": MessageLookupByLibrary.simpleMessage("Course"),
    "covered": MessageLookupByLibrary.simpleMessage("Covered"),
    "createAccount": MessageLookupByLibrary.simpleMessage("Create Account"),
    "createAccountSubtitle": MessageLookupByLibrary.simpleMessage(
      "Let\'s create your account to get started.",
    ),
    "create_geofence": MessageLookupByLibrary.simpleMessage("Create GeoFence"),
    "current_password": MessageLookupByLibrary.simpleMessage(
      "Current Password",
    ),
    "customCommand": MessageLookupByLibrary.simpleMessage("Custom command"),
    "dashboard": MessageLookupByLibrary.simpleMessage("Dashboard"),
    "data": MessageLookupByLibrary.simpleMessage("Data"),
    "daysAdded": MessageLookupByLibrary.simpleMessage("Days Added:"),
    "daysLeft": m1,
    "delete_account": MessageLookupByLibrary.simpleMessage("Delete Account"),
    "delete_account_hint": MessageLookupByLibrary.simpleMessage(
      "If you delete your account, you’ll never be able to recover it in the future.",
    ),
    "delete_account_warning": MessageLookupByLibrary.simpleMessage(
      "Deleting your account will permanently remove your access to all fleet data, vehicle devices, records, and real-time tracking.\n\nThis action cannot be undone.",
    ),
    "desc_about": MessageLookupByLibrary.simpleMessage(
      "Know more about our app, terms & policies",
    ),
    "desc_add_new_device": MessageLookupByLibrary.simpleMessage(
      "Add your new device & start managing",
    ),
    "desc_help_support": MessageLookupByLibrary.simpleMessage(
      "Get help from our support team",
    ),
    "desc_logout": MessageLookupByLibrary.simpleMessage(
      "Exit & return to login screen.",
    ),
    "desc_logout_confirmation": MessageLookupByLibrary.simpleMessage(
      "Are you sure?",
    ),
    "desc_manage_geofences": MessageLookupByLibrary.simpleMessage(
      "Create & manage geofence",
    ),
    "desc_manage_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Manage your vehicle subscription plan",
    ),
    "desc_settings": MessageLookupByLibrary.simpleMessage(
      "Change appearance, map view, notifications",
    ),
    "desc_trackon_shop": MessageLookupByLibrary.simpleMessage(
      "Buy Trackon accessories and devices",
    ),
    "deviceCategory": MessageLookupByLibrary.simpleMessage("Category"),
    "deviceCommand": MessageLookupByLibrary.simpleMessage("Command"),
    "deviceContact": MessageLookupByLibrary.simpleMessage("Contact"),
    "deviceFollow": MessageLookupByLibrary.simpleMessage("Follow"),
    "deviceFuelDrop": MessageLookupByLibrary.simpleMessage("Fuel drop"),
    "deviceIdentifier": MessageLookupByLibrary.simpleMessage("Identifier"),
    "deviceInactive": MessageLookupByLibrary.simpleMessage("Device inactive"),
    "deviceLastUpdate": MessageLookupByLibrary.simpleMessage("Last Update"),
    "deviceModel": MessageLookupByLibrary.simpleMessage("Model"),
    "deviceMoving": MessageLookupByLibrary.simpleMessage("Device moving"),
    "deviceOffline": MessageLookupByLibrary.simpleMessage("Status offline"),
    "deviceOnline": MessageLookupByLibrary.simpleMessage("Status online"),
    "deviceOverspeed": MessageLookupByLibrary.simpleMessage(
      "Speed limit exceeded",
    ),
    "deviceRegistered": MessageLookupByLibrary.simpleMessage(
      "Device Registered",
    ),
    "deviceRelatedActions": MessageLookupByLibrary.simpleMessage(
      "Device Related Actions",
    ),
    "deviceStatus": MessageLookupByLibrary.simpleMessage("Status"),
    "deviceStatusOffline": MessageLookupByLibrary.simpleMessage("Offline"),
    "deviceStatusOnline": MessageLookupByLibrary.simpleMessage("Online"),
    "deviceStatusUnknown": MessageLookupByLibrary.simpleMessage("Unknown"),
    "deviceStopped": MessageLookupByLibrary.simpleMessage("Device stopped"),
    "deviceTemp": MessageLookupByLibrary.simpleMessage("Device Temperature"),
    "deviceTitle": MessageLookupByLibrary.simpleMessage("Devices"),
    "deviceTotalDistance": MessageLookupByLibrary.simpleMessage(
      "Total Distance",
    ),
    "deviceType": MessageLookupByLibrary.simpleMessage("Device Type"),
    "deviceUnknown": MessageLookupByLibrary.simpleMessage("Status unknown"),
    "device_dashboard": MessageLookupByLibrary.simpleMessage(
      "Device Dashboard",
    ),
    "device_id": MessageLookupByLibrary.simpleMessage("Device ID:"),
    "device_info": MessageLookupByLibrary.simpleMessage("Device Info"),
    "device_name": MessageLookupByLibrary.simpleMessage("Device Name:"),
    "devicesAndState": MessageLookupByLibrary.simpleMessage(
      "Devices and State",
    ),
    "diablePopupNotification": MessageLookupByLibrary.simpleMessage(
      "Disable Popup Notifications",
    ),
    "didNotReceiveIt": MessageLookupByLibrary.simpleMessage(
      "Didn\'t receive it?",
    ),
    "didntReceiveCode": MessageLookupByLibrary.simpleMessage(
      "Didn’t receive code?",
    ),
    "discountPrice": MessageLookupByLibrary.simpleMessage("Discount Price:"),
    "distance": MessageLookupByLibrary.simpleMessage("Distance"),
    "distanceLabel": MessageLookupByLibrary.simpleMessage("Distance"),
    "distanceLength": MessageLookupByLibrary.simpleMessage("Distance Length"),
    "done": MessageLookupByLibrary.simpleMessage("Done"),
    "dontHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account?",
    ),
    "driverChanged": MessageLookupByLibrary.simpleMessage("Driver changed"),
    "driverUniqueId": MessageLookupByLibrary.simpleMessage("Driver Unique Id"),
    "dtcs": MessageLookupByLibrary.simpleMessage("DTCs"),
    "duration24hr": MessageLookupByLibrary.simpleMessage("24hr"),
    "duration30days": MessageLookupByLibrary.simpleMessage("30 days"),
    "duration3days": MessageLookupByLibrary.simpleMessage("3 days"),
    "duration7days": MessageLookupByLibrary.simpleMessage("7 days"),
    "emailTextfieldHint": MessageLookupByLibrary.simpleMessage(
      "Enter your Email",
    ),
    "emailTextfieldTitle": MessageLookupByLibrary.simpleMessage("Email"),
    "enable": MessageLookupByLibrary.simpleMessage("Enable"),
    "engineLockTitle": MessageLookupByLibrary.simpleMessage("Engine Lock"),
    "engineResume": MessageLookupByLibrary.simpleMessage("Engine Resume"),
    "engineRuntime": MessageLookupByLibrary.simpleMessage(
      "Engine Runtime (mins)",
    ),
    "engineStop": MessageLookupByLibrary.simpleMessage("Engine Stop"),
    "engine_duration": MessageLookupByLibrary.simpleMessage("Engine Duration"),
    "enterCouponCode": MessageLookupByLibrary.simpleMessage(
      "If you have a coupon code, enter it here",
    ),
    "enterDeviceIMEI": MessageLookupByLibrary.simpleMessage(
      "Enter Device IMEI",
    ),
    "enterEmailOrPhoneEmpty": MessageLookupByLibrary.simpleMessage(
      "Please enter email or phone",
    ),
    "enterEmailOrPhoneHint": MessageLookupByLibrary.simpleMessage(
      "Enter email/phone",
    ),
    "enterFenceName": MessageLookupByLibrary.simpleMessage("Enter Fence Name"),
    "enterPasswordToConfirm": MessageLookupByLibrary.simpleMessage(
      "Please enter your password to confirm this action.",
    ),
    "enterRegistrationNumber": MessageLookupByLibrary.simpleMessage(
      "Enter Registration Number",
    ),
    "enterSimNumber": MessageLookupByLibrary.simpleMessage("Enter sim Number"),
    "enterVehicleModel": MessageLookupByLibrary.simpleMessage(
      "Enter vehicle Model",
    ),
    "enterVehicleName": MessageLookupByLibrary.simpleMessage(
      "Enter vehicle Name",
    ),
    "enter_password_hint": MessageLookupByLibrary.simpleMessage(
      "Please Enter Password",
    ),
    "enter_password_to_confirm": MessageLookupByLibrary.simpleMessage(
      "Please enter your password to confirm this action.",
    ),
    "errorMsg": MessageLookupByLibrary.simpleMessage("Something Went Wrong"),
    "errorOnAddingGeofence": MessageLookupByLibrary.simpleMessage(
      "Error on adding geofence.",
    ),
    "errorOnDeletingGeofence": MessageLookupByLibrary.simpleMessage(
      "Error on deleting Geofence.",
    ),
    "errorOnRemovingGeofence": MessageLookupByLibrary.simpleMessage(
      "Error on removing geofence.",
    ),
    "event": MessageLookupByLibrary.simpleMessage("Event"),
    "eventsScrollToLast": MessageLookupByLibrary.simpleMessage(
      "Scroll To Last",
    ),
    "expectedMileage": MessageLookupByLibrary.simpleMessage("Expected Mileage"),
    "expirationDate": MessageLookupByLibrary.simpleMessage("Expiration Date"),
    "expiration_time": MessageLookupByLibrary.simpleMessage("Expiration Time"),
    "expireAfter": MessageLookupByLibrary.simpleMessage("Expire After"),
    "expired": MessageLookupByLibrary.simpleMessage("Expired"),
    "failed": MessageLookupByLibrary.simpleMessage("Failed"),
    "faq": MessageLookupByLibrary.simpleMessage("FAQs"),
    "faqSubtitle": MessageLookupByLibrary.simpleMessage(
      "Find answers to common questions.",
    ),
    "fast": MessageLookupByLibrary.simpleMessage("Fast"),
    "fenceAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Geofence Linked",
    ),
    "fenceName": MessageLookupByLibrary.simpleMessage("Fence Name"),
    "fenceRemovedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Geofence Unlinked",
    ),
    "firmwareUpdate": MessageLookupByLibrary.simpleMessage("Update Firmware"),
    "flags": MessageLookupByLibrary.simpleMessage("Flags"),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Forgot password?"),
    "forgotPasswordSubtitle": MessageLookupByLibrary.simpleMessage(
      "Enter your registered email to reset your password",
    ),
    "forgotPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "Forgot Password?",
    ),
    "frequency": MessageLookupByLibrary.simpleMessage("Frequency"),
    "fuel": MessageLookupByLibrary.simpleMessage("Fuel"),
    "fuelConsumption": MessageLookupByLibrary.simpleMessage("Fuel Consumption"),
    "fuelCutOff": MessageLookupByLibrary.simpleMessage("Fuel Cut"),
    "generalSection": MessageLookupByLibrary.simpleMessage("General"),
    "geofenceDescription": MessageLookupByLibrary.simpleMessage(
      "\'Geofence Description\',",
    ),
    "geofenceEnter": MessageLookupByLibrary.simpleMessage("Geofence entered"),
    "geofenceExit": MessageLookupByLibrary.simpleMessage("Geofence exited"),
    "geofence_address_sample": MessageLookupByLibrary.simpleMessage(
      "अन्नपूर्ण मार्ग, बाग्मती प्रदेश, NP",
    ),
    "geofence_description_subtitle": MessageLookupByLibrary.simpleMessage(
      "Here will be the geofence description.",
    ),
    "geofence_description_title": MessageLookupByLibrary.simpleMessage(
      "Geofence Description",
    ),
    "geofence_name_label": MessageLookupByLibrary.simpleMessage(
      "Geofence Name",
    ),
    "geofences": MessageLookupByLibrary.simpleMessage("Geofences"),
    "geofences_detail": MessageLookupByLibrary.simpleMessage(
      "Geofences Detail",
    ),
    "getStarted": MessageLookupByLibrary.simpleMessage("Get Started"),
    "getVersion": MessageLookupByLibrary.simpleMessage("Get Version"),
    "gps": MessageLookupByLibrary.simpleMessage("GPS"),
    "have_question": MessageLookupByLibrary.simpleMessage("Have a question?"),
    "hdop": MessageLookupByLibrary.simpleMessage("HDOP"),
    "helpSupportLabel": MessageLookupByLibrary.simpleMessage("Help & Support"),
    "helpSupportValue": MessageLookupByLibrary.simpleMessage(
      "Get help from our support team",
    ),
    "highSignal": MessageLookupByLibrary.simpleMessage("High"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "hour": MessageLookupByLibrary.simpleMessage("hr"),
    "hourShort": MessageLookupByLibrary.simpleMessage("h"),
    "hours": MessageLookupByLibrary.simpleMessage("h"),
    "howCanWeHelp": MessageLookupByLibrary.simpleMessage(
      "How can we help you today?",
    ),
    "ignition": MessageLookupByLibrary.simpleMessage("Ignition"),
    "ignitionOff": MessageLookupByLibrary.simpleMessage("Ignition off"),
    "ignitionOn": MessageLookupByLibrary.simpleMessage("Ignition on"),
    "image": MessageLookupByLibrary.simpleMessage("Image"),
    "imeiHint": MessageLookupByLibrary.simpleMessage("16-digit IMEI number"),
    "imeiInstructions": MessageLookupByLibrary.simpleMessage(
      "Scan the QR code located inside your tracking device to register it in your account.",
    ),
    "imeiLabel": MessageLookupByLibrary.simpleMessage("16-digit IMEI number"),
    "imeiNumber": MessageLookupByLibrary.simpleMessage("IMEI Number"),
    "imeiTooLong": MessageLookupByLibrary.simpleMessage(
      "IMEI cannot be more than 16 digits",
    ),
    "important": MessageLookupByLibrary.simpleMessage("Important"),
    "importantNotice": MessageLookupByLibrary.simpleMessage("Important Notice"),
    "importantNoticeLine1": MessageLookupByLibrary.simpleMessage(
      "• You are about to disable the vehicle’s electrical system.",
    ),
    "importantNoticeLine2": MessageLookupByLibrary.simpleMessage(
      "• You’ll need to unlock it again before the next ride.",
    ),
    "index": MessageLookupByLibrary.simpleMessage("Index"),
    "info": MessageLookupByLibrary.simpleMessage("Info"),
    "input": MessageLookupByLibrary.simpleMessage("Input"),
    "invalidEmailOrPhone": MessageLookupByLibrary.simpleMessage(
      "Enter a valid email or phone number",
    ),
    "ip": MessageLookupByLibrary.simpleMessage("IP"),
    "km": MessageLookupByLibrary.simpleMessage("km"),
    "kmPerHour": MessageLookupByLibrary.simpleMessage("km/h"),
    "km_per_hour": MessageLookupByLibrary.simpleMessage("km/h"),
    "label_about": MessageLookupByLibrary.simpleMessage("About Trackon GPS"),
    "label_add_new_device": MessageLookupByLibrary.simpleMessage(
      "Add New Device",
    ),
    "label_device_related_actions": MessageLookupByLibrary.simpleMessage(
      "Device Related Actions",
    ),
    "label_general": MessageLookupByLibrary.simpleMessage("General"),
    "label_help_support": MessageLookupByLibrary.simpleMessage(
      "Help & Support",
    ),
    "label_logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "label_manage_geofences": MessageLookupByLibrary.simpleMessage(
      "Manage Geofences",
    ),
    "label_manage_subscriptions": MessageLookupByLibrary.simpleMessage(
      "Manage Subscriptions",
    ),
    "label_more": MessageLookupByLibrary.simpleMessage("More"),
    "label_preference": MessageLookupByLibrary.simpleMessage("Preference"),
    "label_settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "label_trackon_shop": MessageLookupByLibrary.simpleMessage("Trackon Shop"),
    "lastMonth": MessageLookupByLibrary.simpleMessage("Last Month"),
    "lastUpdate": MessageLookupByLibrary.simpleMessage("Last Update"),
    "lastWeek": MessageLookupByLibrary.simpleMessage("Last Week"),
    "latitude": MessageLookupByLibrary.simpleMessage("Latitude"),
    "linkCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Link Copied to Clipboard",
    ),
    "litre": MessageLookupByLibrary.simpleMessage("L"),
    "liveSupport": MessageLookupByLibrary.simpleMessage(
      "Talk to a Live Support Agent",
    ),
    "liveSupportSubtitle": MessageLookupByLibrary.simpleMessage(
      "Get real-time assistance from our team.",
    ),
    "locatedQrCodeConfirmation": MessageLookupByLibrary.simpleMessage(
      "I have located the QR code on my device.",
    ),
    "lockEngine": MessageLookupByLibrary.simpleMessage("Lock Engine"),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "loginCreated": MessageLookupByLibrary.simpleMessage(
      "New user has been registered",
    ),
    "loginFailed": MessageLookupByLibrary.simpleMessage(
      "Incorrect email address or password",
    ),
    "loginLanguage": MessageLookupByLibrary.simpleMessage("Language"),
    "loginLogin": MessageLookupByLibrary.simpleMessage("Login"),
    "loginLogout": MessageLookupByLibrary.simpleMessage("Logout"),
    "loginNow": MessageLookupByLibrary.simpleMessage("Login Now"),
    "loginRegister": MessageLookupByLibrary.simpleMessage("Register"),
    "loginTitle": MessageLookupByLibrary.simpleMessage("Login"),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "logoutDialogContent": MessageLookupByLibrary.simpleMessage(
      "Are you sure?",
    ),
    "logoutDialogTitle": MessageLookupByLibrary.simpleMessage("Logout"),
    "logoutLabel": MessageLookupByLibrary.simpleMessage("Logout"),
    "logoutValue": MessageLookupByLibrary.simpleMessage(
      "Exit & return to login screen.",
    ),
    "longestDistance": MessageLookupByLibrary.simpleMessage("Longest Distance"),
    "longestRuntime": MessageLookupByLibrary.simpleMessage("Longest Runtime"),
    "longitude": MessageLookupByLibrary.simpleMessage("Longitude"),
    "maintenance": MessageLookupByLibrary.simpleMessage("Maintenance required"),
    "maintenancePeriod": MessageLookupByLibrary.simpleMessage("Period"),
    "maintenanceStart": MessageLookupByLibrary.simpleMessage("Start"),
    "manageGeofencesLabel": MessageLookupByLibrary.simpleMessage(
      "Manage Geofences",
    ),
    "manageGeofencesValue": MessageLookupByLibrary.simpleMessage(
      "Create & manage geofence ",
    ),
    "manageSubscriptionsLabel": MessageLookupByLibrary.simpleMessage(
      "Manage Subscriptions",
    ),
    "manageSubscriptionsValue": MessageLookupByLibrary.simpleMessage(
      "Manage your vehicle subscription plan ",
    ),
    "map_styles_title": MessageLookupByLibrary.simpleMessage("Map Styles"),
    "medium": MessageLookupByLibrary.simpleMessage("Medium"),
    "message": MessageLookupByLibrary.simpleMessage("Message"),
    "microInstallation": MessageLookupByLibrary.simpleMessage(
      "Micro Installation",
    ),
    "microPlusInstallation": MessageLookupByLibrary.simpleMessage(
      "Micro+ Installation",
    ),
    "mileageSetFailed": MessageLookupByLibrary.simpleMessage(
      "Setting mileage failed",
    ),
    "mileageSetSuccess": MessageLookupByLibrary.simpleMessage(
      "Mileage set successfully",
    ),
    "mins": MessageLookupByLibrary.simpleMessage("mins"),
    "minute": MessageLookupByLibrary.simpleMessage("min"),
    "minuteShort": MessageLookupByLibrary.simpleMessage("m"),
    "minutes": MessageLookupByLibrary.simpleMessage("m"),
    "mobileOrEmail": MessageLookupByLibrary.simpleMessage(
      "Mobile Number or Email",
    ),
    "modeDeepSleep": MessageLookupByLibrary.simpleMessage("Modify Deep Sleep"),
    "modePowerSaving": MessageLookupByLibrary.simpleMessage(
      "Modify Power Saving",
    ),
    "more": MessageLookupByLibrary.simpleMessage("More"),
    "moreSection": MessageLookupByLibrary.simpleMessage("More"),
    "motion": MessageLookupByLibrary.simpleMessage("Motion"),
    "move_duration": MessageLookupByLibrary.simpleMessage("Move Duration"),
    "movementAlarm": MessageLookupByLibrary.simpleMessage("Movement Alarm"),
    "nA": MessageLookupByLibrary.simpleMessage("N/A"),
    "needHelp": MessageLookupByLibrary.simpleMessage(
      "Need help getting started?",
    ),
    "newFence": MessageLookupByLibrary.simpleMessage("New Fence"),
    "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
    "newPasswordHint": MessageLookupByLibrary.simpleMessage("New Password"),
    "newPasswordLabel": MessageLookupByLibrary.simpleMessage("New Password"),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "no": MessageLookupByLibrary.simpleMessage("No"),
    "noAddress": MessageLookupByLibrary.simpleMessage("No Address"),
    "noData": MessageLookupByLibrary.simpleMessage("No Data!"),
    "noDeviceFound": MessageLookupByLibrary.simpleMessage("No device found"),
    "noEventsDataFound": MessageLookupByLibrary.simpleMessage(
      "No Events data found",
    ),
    "noFence": MessageLookupByLibrary.simpleMessage("No Fence Found"),
    "noGeofencesAvailable": MessageLookupByLibrary.simpleMessage(
      "No geofences available.",
    ),
    "noPaymentHistory": MessageLookupByLibrary.simpleMessage(
      "No payment history found",
    ),
    "noPlayBackDataFound": MessageLookupByLibrary.simpleMessage(
      "No Playback Data Found",
    ),
    "noStopDataFound": MessageLookupByLibrary.simpleMessage(
      "No Stops data found",
    ),
    "noTripDataFound": MessageLookupByLibrary.simpleMessage(
      "No Trip data found",
    ),
    "noValidQRCode": MessageLookupByLibrary.simpleMessage(
      "No valid QR code found. Please try again.",
    ),
    "no_number": MessageLookupByLibrary.simpleMessage("No Number"),
    "normalSignal": MessageLookupByLibrary.simpleMessage("Normal"),
    "notAvailable": MessageLookupByLibrary.simpleMessage("Not Available"),
    "note": MessageLookupByLibrary.simpleMessage("Note"),
    "note_": MessageLookupByLibrary.simpleMessage("Note:"),
    "notification": MessageLookupByLibrary.simpleMessage("Notifications"),
    "notificationSettings": MessageLookupByLibrary.simpleMessage(
      "Notification Settings",
    ),
    "nrs": MessageLookupByLibrary.simpleMessage("NRs"),
    "obdOdometer": MessageLookupByLibrary.simpleMessage("OBD Odometer"),
    "obdSpeed": MessageLookupByLibrary.simpleMessage("OBD Speed"),
    "odometer": MessageLookupByLibrary.simpleMessage("Odometer"),
    "off": MessageLookupByLibrary.simpleMessage("OFF"),
    "offline": MessageLookupByLibrary.simpleMessage("Offline"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "on": MessageLookupByLibrary.simpleMessage("ON"),
    "onboardSubtitle1": MessageLookupByLibrary.simpleMessage(
      "Simplify your fleet operations and stay in control—anytime, anywhere.",
    ),
    "onboardSubtitle2": MessageLookupByLibrary.simpleMessage(
      "Monitor location, speed, distance, and route in one place.",
    ),
    "onboardSubtitle3": MessageLookupByLibrary.simpleMessage(
      "Get alerts for speeding, ignition, movement, and geofence breaches.",
    ),
    "onboardSubtitle4": MessageLookupByLibrary.simpleMessage(
      "Reach out to our support team via chat, call, or WhatsApp.",
    ),
    "onboardTitle1": MessageLookupByLibrary.simpleMessage("Welcome to"),
    "onboardTitle2": MessageLookupByLibrary.simpleMessage(
      "Track Every Vehicle in",
    ),
    "onboardTitle3": MessageLookupByLibrary.simpleMessage("Stay Notified"),
    "onboardTitle4": MessageLookupByLibrary.simpleMessage("Help is Always"),
    "onboardTitleShort1": MessageLookupByLibrary.simpleMessage("Trackon GPS"),
    "onboardTitleShort2": MessageLookupByLibrary.simpleMessage("Real-Time"),
    "onboardTitleShort3": MessageLookupByLibrary.simpleMessage("Stay Safe"),
    "onboardTitleShort4": MessageLookupByLibrary.simpleMessage("a Tap Away"),
    "online": MessageLookupByLibrary.simpleMessage("Online"),
    "openSettings": MessageLookupByLibrary.simpleMessage("Open Settings"),
    "operator": MessageLookupByLibrary.simpleMessage("Operator"),
    "or": MessageLookupByLibrary.simpleMessage("OR"),
    "other_action": MessageLookupByLibrary.simpleMessage("Other Action"),
    "otpEmptyError": MessageLookupByLibrary.simpleMessage(
      "Please enter the PIN code",
    ),
    "otpLengthError": MessageLookupByLibrary.simpleMessage(
      "PIN must be 6 digits",
    ),
    "otpVerified": MessageLookupByLibrary.simpleMessage("OTP verified!"),
    "output": MessageLookupByLibrary.simpleMessage("Output"),
    "outputControl": MessageLookupByLibrary.simpleMessage("Output Control"),
    "paid_for_device": MessageLookupByLibrary.simpleMessage("Paid for"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordLowercaseRequired": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least one lowercase letter",
    ),
    "passwordMismatch": MessageLookupByLibrary.simpleMessage(
      "Password does not match",
    ),
    "passwordNotSame": MessageLookupByLibrary.simpleMessage(
      "Password Not Same",
    ),
    "passwordNumberRequired": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least one number",
    ),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "Password is required",
    ),
    "passwordResetSubtitle": MessageLookupByLibrary.simpleMessage(
      "Your password has been updated successfully. You can now log in with your new password.",
    ),
    "passwordResetSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Your password has been updated successfully. You can now log in with your new password.",
    ),
    "passwordResetSuccessTitle": MessageLookupByLibrary.simpleMessage(
      "Password Reset Successfully!",
    ),
    "passwordResetTitle": MessageLookupByLibrary.simpleMessage(
      "Password Reset Successfully!",
    ),
    "passwordSpecialCharRequired": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least one special character",
    ),
    "passwordTooShort": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 8 characters long",
    ),
    "passwordUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Password Updated Successfully",
    ),
    "passwordUppercaseRequired": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least one uppercase letter",
    ),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "paymentHistory": MessageLookupByLibrary.simpleMessage("Payment History"),
    "payment_error_message": m2,
    "payment_failed": MessageLookupByLibrary.simpleMessage("Payment Failed"),
    "payment_message_success": MessageLookupByLibrary.simpleMessage(
      "Your Payment is successful!",
    ),
    "payment_reference_id": MessageLookupByLibrary.simpleMessage(
      "Payment Reference ID",
    ),
    "payment_status": MessageLookupByLibrary.simpleMessage("Payment Status"),
    "payment_success_amount": MessageLookupByLibrary.simpleMessage("NPR"),
    "pdop": MessageLookupByLibrary.simpleMessage("PDOP"),
    "phone": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "phoneNumberSim": MessageLookupByLibrary.simpleMessage(
      "Phone Number (SIM)",
    ),
    "playback": MessageLookupByLibrary.simpleMessage("Playback"),
    "playbackNotAvailble": MessageLookupByLibrary.simpleMessage(
      "Playback Not Availble!",
    ),
    "pleaseEnterImeiOrSn": MessageLookupByLibrary.simpleMessage(
      "Please enter IMEI or SN",
    ),
    "pleaseEnterPromoCode": MessageLookupByLibrary.simpleMessage(
      "Please enter a promo code",
    ),
    "poorSignal": MessageLookupByLibrary.simpleMessage("Poor"),
    "port": MessageLookupByLibrary.simpleMessage("Port"),
    "positionAcceleration": MessageLookupByLibrary.simpleMessage(
      "Acceleration",
    ),
    "positionAccuracy": MessageLookupByLibrary.simpleMessage("Accuracy"),
    "positionAddress": MessageLookupByLibrary.simpleMessage("Address"),
    "positionAlarm": MessageLookupByLibrary.simpleMessage("Alarm"),
    "positionAltitude": MessageLookupByLibrary.simpleMessage("Altitude"),
    "positionApproximate": MessageLookupByLibrary.simpleMessage("Approximate"),
    "positionArchive": MessageLookupByLibrary.simpleMessage("Archive"),
    "positionArmed": MessageLookupByLibrary.simpleMessage("Armed"),
    "positionAudio": MessageLookupByLibrary.simpleMessage("Audio"),
    "positionBattery": MessageLookupByLibrary.simpleMessage("Battery"),
    "positionBatteryLevel": MessageLookupByLibrary.simpleMessage(
      "Battery Level",
    ),
    "positionBlocked": MessageLookupByLibrary.simpleMessage("Blocked"),
    "positionCharge": MessageLookupByLibrary.simpleMessage("Charge"),
    "positionCommand": MessageLookupByLibrary.simpleMessage("Command"),
    "positionCourse": MessageLookupByLibrary.simpleMessage("Course"),
    "positionDeviceTemp": MessageLookupByLibrary.simpleMessage(
      "Device Temperature",
    ),
    "positionDistance": MessageLookupByLibrary.simpleMessage("Distance"),
    "positionDriverUniqueId": MessageLookupByLibrary.simpleMessage(
      "Driver Unique Id",
    ),
    "positionDtcs": MessageLookupByLibrary.simpleMessage("DTCs"),
    "positionEvent": MessageLookupByLibrary.simpleMessage("Event"),
    "positionFixTime": MessageLookupByLibrary.simpleMessage("Time"),
    "positionFlags": MessageLookupByLibrary.simpleMessage("Flags"),
    "positionFuel": MessageLookupByLibrary.simpleMessage("Fuel"),
    "positionFuelConsumption": MessageLookupByLibrary.simpleMessage(
      "Fuel Consumption",
    ),
    "positionGps": MessageLookupByLibrary.simpleMessage("GPS"),
    "positionHdop": MessageLookupByLibrary.simpleMessage("HDOP"),
    "positionHours": MessageLookupByLibrary.simpleMessage("Hours"),
    "positionIgnition": MessageLookupByLibrary.simpleMessage("Ignition"),
    "positionImage": MessageLookupByLibrary.simpleMessage("Image"),
    "positionIndex": MessageLookupByLibrary.simpleMessage("Index"),
    "positionInput": MessageLookupByLibrary.simpleMessage("Input"),
    "positionIp": MessageLookupByLibrary.simpleMessage("IP"),
    "positionLatitude": MessageLookupByLibrary.simpleMessage("Latitude"),
    "positionLongitude": MessageLookupByLibrary.simpleMessage("Longitude"),
    "positionMotion": MessageLookupByLibrary.simpleMessage("Motion"),
    "positionObdOdometer": MessageLookupByLibrary.simpleMessage("OBD Odometer"),
    "positionObdSpeed": MessageLookupByLibrary.simpleMessage("OBD Speed"),
    "positionOdometer": MessageLookupByLibrary.simpleMessage("Odometer"),
    "positionOperator": MessageLookupByLibrary.simpleMessage("Operator"),
    "positionOutput": MessageLookupByLibrary.simpleMessage("Output"),
    "positionPdop": MessageLookupByLibrary.simpleMessage("PDOP"),
    "positionPower": MessageLookupByLibrary.simpleMessage("Power"),
    "positionProtocol": MessageLookupByLibrary.simpleMessage("Protocol"),
    "positionRaw": MessageLookupByLibrary.simpleMessage("Raw"),
    "positionRfid": MessageLookupByLibrary.simpleMessage("RFID"),
    "positionRoaming": MessageLookupByLibrary.simpleMessage("Roaming"),
    "positionRpm": MessageLookupByLibrary.simpleMessage("RPM"),
    "positionRssi": MessageLookupByLibrary.simpleMessage("RSSI"),
    "positionSat": MessageLookupByLibrary.simpleMessage("Satellites"),
    "positionSatVisible": MessageLookupByLibrary.simpleMessage(
      "Visible Satellites",
    ),
    "positionServiceOdometer": MessageLookupByLibrary.simpleMessage(
      "Service Odometer",
    ),
    "positionSpeed": MessageLookupByLibrary.simpleMessage("Speed"),
    "positionStatus": MessageLookupByLibrary.simpleMessage("Status"),
    "positionSteps": MessageLookupByLibrary.simpleMessage("Steps"),
    "positionThrottle": MessageLookupByLibrary.simpleMessage("Throttle"),
    "positionTripOdometer": MessageLookupByLibrary.simpleMessage(
      "Trip Odometer",
    ),
    "positionValid": MessageLookupByLibrary.simpleMessage("Valid"),
    "positionVdop": MessageLookupByLibrary.simpleMessage("VDOP"),
    "positionVersionFw": MessageLookupByLibrary.simpleMessage(
      "Firmware Version",
    ),
    "positionVersionHw": MessageLookupByLibrary.simpleMessage(
      "Hardware Version",
    ),
    "positionVin": MessageLookupByLibrary.simpleMessage("VIN"),
    "power": MessageLookupByLibrary.simpleMessage("Power"),
    "powerOff": MessageLookupByLibrary.simpleMessage("Power Off Device"),
    "preferenceTitle": MessageLookupByLibrary.simpleMessage("Preference"),
    "promoApplied": MessageLookupByLibrary.simpleMessage("Promo Applied:"),
    "protocol": MessageLookupByLibrary.simpleMessage("Protocol"),
    "radius": MessageLookupByLibrary.simpleMessage("Radius"),
    "raw": MessageLookupByLibrary.simpleMessage("Raw"),
    "realtimeStatusNote": MessageLookupByLibrary.simpleMessage(
      "The vehicle status is updated in real time.",
    ),
    "realtimeStatusNoteRefresh": MessageLookupByLibrary.simpleMessage(
      "Refresh if you suspect the status is outdated.",
    ),
    "rebootDevice": MessageLookupByLibrary.simpleMessage("Reboot Device"),
    "recentEvents": MessageLookupByLibrary.simpleMessage("Recent Events"),
    "register": MessageLookupByLibrary.simpleMessage("Register"),
    "registerNow": MessageLookupByLibrary.simpleMessage("Register Now"),
    "registered_number": MessageLookupByLibrary.simpleMessage(
      "Registered Number",
    ),
    "registrationNumber": MessageLookupByLibrary.simpleMessage(
      "Registration Number",
    ),
    "remove_geofence_button": MessageLookupByLibrary.simpleMessage(
      "Remove Geofence",
    ),
    "remove_geofence_message": m3,
    "remove_geofence_title": MessageLookupByLibrary.simpleMessage(
      "Remove Geofence?",
    ),
    "renew": MessageLookupByLibrary.simpleMessage("Renew"),
    "report": MessageLookupByLibrary.simpleMessage("Report"),
    "reportAverageSpeed": MessageLookupByLibrary.simpleMessage("Avg Speed"),
    "reportCustom": MessageLookupByLibrary.simpleMessage("Custom"),
    "reportDashboard": MessageLookupByLibrary.simpleMessage("Report Dashboard"),
    "reportDeviceName": MessageLookupByLibrary.simpleMessage("Device Name"),
    "reportDuration": MessageLookupByLibrary.simpleMessage("Duration"),
    "reportEndAddress": MessageLookupByLibrary.simpleMessage("End Address"),
    "reportEndDate": MessageLookupByLibrary.simpleMessage("End Date"),
    "reportEndOdometer": MessageLookupByLibrary.simpleMessage("Odometer End"),
    "reportEndTime": MessageLookupByLibrary.simpleMessage("End Time"),
    "reportEngineHours": MessageLookupByLibrary.simpleMessage("Engine Hours"),
    "reportEvents": MessageLookupByLibrary.simpleMessage("Events"),
    "reportMaximumSpeed": MessageLookupByLibrary.simpleMessage("Max Speed"),
    "reportPreviousMonth": MessageLookupByLibrary.simpleMessage(
      "Previous Month",
    ),
    "reportPreviousWeek": MessageLookupByLibrary.simpleMessage("Previous Week"),
    "reportRoute": MessageLookupByLibrary.simpleMessage("Route"),
    "reportSpentFuel": MessageLookupByLibrary.simpleMessage("Spent Fuel"),
    "reportStartAddress": MessageLookupByLibrary.simpleMessage("Start Address"),
    "reportStartDate": MessageLookupByLibrary.simpleMessage("Start Date"),
    "reportStartOdometer": MessageLookupByLibrary.simpleMessage(
      "Odometer Start",
    ),
    "reportStartTime": MessageLookupByLibrary.simpleMessage("Start Time"),
    "reportStops": MessageLookupByLibrary.simpleMessage("Stops"),
    "reportSummary": MessageLookupByLibrary.simpleMessage("Summary"),
    "reportThisMonth": MessageLookupByLibrary.simpleMessage("This Month"),
    "reportThisWeek": MessageLookupByLibrary.simpleMessage("This Week"),
    "reportToday": MessageLookupByLibrary.simpleMessage("Today"),
    "reportTrips": MessageLookupByLibrary.simpleMessage("Trips"),
    "reportYesterday": MessageLookupByLibrary.simpleMessage("Yesterday"),
    "requestPhoto": MessageLookupByLibrary.simpleMessage("Request Photo"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Resend Code"),
    "resendOtp": MessageLookupByLibrary.simpleMessage("Resend OTP"),
    "reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "retypePassword": MessageLookupByLibrary.simpleMessage("Retype Password"),
    "review_playback": MessageLookupByLibrary.simpleMessage("Review Playback"),
    "rfid": MessageLookupByLibrary.simpleMessage("RFID"),
    "roaming": MessageLookupByLibrary.simpleMessage("Roaming"),
    "route_length": MessageLookupByLibrary.simpleMessage("Route Length"),
    "rpm": MessageLookupByLibrary.simpleMessage("RPM"),
    "rs": MessageLookupByLibrary.simpleMessage("Rs"),
    "rssi": MessageLookupByLibrary.simpleMessage("RSSI"),
    "runTime": MessageLookupByLibrary.simpleMessage("Runtime"),
    "running": MessageLookupByLibrary.simpleMessage("Running"),
    "runtime": MessageLookupByLibrary.simpleMessage("Runtime"),
    "runtimeLabel": MessageLookupByLibrary.simpleMessage("Runtime"),
    "sat": MessageLookupByLibrary.simpleMessage("Satellites"),
    "satVisible": MessageLookupByLibrary.simpleMessage("Visible Satellites"),
    "satellite": MessageLookupByLibrary.simpleMessage("Satellite"),
    "satellitesLabel": MessageLookupByLibrary.simpleMessage("Satellites"),
    "scanDeviceIMEI": MessageLookupByLibrary.simpleMessage("Scan Device IMEI"),
    "scanQrCodeDescription": MessageLookupByLibrary.simpleMessage(
      "Scan the QR code located inside your tracking device to register it in your account.",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "searchVehicle": MessageLookupByLibrary.simpleMessage(
      "Search by vehicle...",
    ),
    "second": MessageLookupByLibrary.simpleMessage("sec"),
    "secondShort": MessageLookupByLibrary.simpleMessage("s"),
    "seconds": MessageLookupByLibrary.simpleMessage("s"),
    "selectDuration": MessageLookupByLibrary.simpleMessage("Select Duration"),
    "selectPaymentMethod": MessageLookupByLibrary.simpleMessage(
      "Select Payment Method",
    ),
    "selectThisArea": MessageLookupByLibrary.simpleMessage("Select this area"),
    "select_command": MessageLookupByLibrary.simpleMessage("Select Command"),
    "select_photo_from_gallery": MessageLookupByLibrary.simpleMessage(
      "Select Photo From Gallery",
    ),
    "sendOtp": MessageLookupByLibrary.simpleMessage("Send OTP"),
    "sendSms": MessageLookupByLibrary.simpleMessage("Send SMS"),
    "sendUssd": MessageLookupByLibrary.simpleMessage("Send USSD"),
    "send_command": MessageLookupByLibrary.simpleMessage("Send Command"),
    "sentToEmail": m4,
    "sentToPhone": m5,
    "serialNumberOfTheDevice": MessageLookupByLibrary.simpleMessage(
      "Serial number (SN/IMEI) of the device",
    ),
    "server": MessageLookupByLibrary.simpleMessage("Server"),
    "serverURl": MessageLookupByLibrary.simpleMessage("Server URL"),
    "serviceOdometer": MessageLookupByLibrary.simpleMessage("Service Odometer"),
    "setAgps": MessageLookupByLibrary.simpleMessage("Set AGPS"),
    "setConnection": MessageLookupByLibrary.simpleMessage("Set Connection"),
    "setDeviceStatus": MessageLookupByLibrary.simpleMessage(
      "Get Device Status",
    ),
    "setGeofenceSubtitle": MessageLookupByLibrary.simpleMessage(
      "Create & manage geofence",
    ),
    "setGeofenceTitle": MessageLookupByLibrary.simpleMessage("Set Geofence"),
    "setIndicator": MessageLookupByLibrary.simpleMessage("Set Indicator"),
    "setModemStatus": MessageLookupByLibrary.simpleMessage("Get Modem Status"),
    "setNewPasswordSubtitle": MessageLookupByLibrary.simpleMessage(
      "Enter your new password below",
    ),
    "setNewPasswordTitle": MessageLookupByLibrary.simpleMessage(
      "Set New Password",
    ),
    "setOdometer": MessageLookupByLibrary.simpleMessage("Set Odometer"),
    "setPhonebook": MessageLookupByLibrary.simpleMessage("Set Phonebook"),
    "setTimezone": MessageLookupByLibrary.simpleMessage("Set Timezone"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "settingsLabel": MessageLookupByLibrary.simpleMessage("Settings"),
    "settingsValue": MessageLookupByLibrary.simpleMessage(
      "Change notifications preferences",
    ),
    "shareLink": MessageLookupByLibrary.simpleMessage("Share Link"),
    "shareLinkButton": MessageLookupByLibrary.simpleMessage("Share Link"),
    "shareVehicleLocation": MessageLookupByLibrary.simpleMessage(
      "Share Vehicle Location",
    ),
    "sharedLoading": MessageLookupByLibrary.simpleMessage("Please Wait..."),
    "sharedMaintenance": MessageLookupByLibrary.simpleMessage("Maintenance"),
    "showingAllDevices": MessageLookupByLibrary.simpleMessage(
      "Showing all Devices",
    ),
    "signInSubtitle": MessageLookupByLibrary.simpleMessage(
      "Please enter your details to continue",
    ),
    "signInWelcomeBack": MessageLookupByLibrary.simpleMessage("Welcome Back!"),
    "signalLabel": MessageLookupByLibrary.simpleMessage("Signal"),
    "silenceTime": MessageLookupByLibrary.simpleMessage("Set Silence Time"),
    "simNumber": MessageLookupByLibrary.simpleMessage("Sim Number"),
    "simple": MessageLookupByLibrary.simpleMessage("Simple"),
    "skip": MessageLookupByLibrary.simpleMessage("Skip"),
    "slow": MessageLookupByLibrary.simpleMessage("Slow"),
    "somethingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Something went wrong",
    ),
    "somthingWentWrong": MessageLookupByLibrary.simpleMessage(
      "Somthing went wrong!",
    ),
    "sosNumber": MessageLookupByLibrary.simpleMessage("Set SOS Number"),
    "speed": MessageLookupByLibrary.simpleMessage("Speed"),
    "speedLabel": MessageLookupByLibrary.simpleMessage("Speed"),
    "speedLimit": MessageLookupByLibrary.simpleMessage("Speed Limit"),
    "speedLimitUpdated": MessageLookupByLibrary.simpleMessage(
      "Speed limit updated",
    ),
    "speedMustBeGreaterThan": MessageLookupByLibrary.simpleMessage(
      "Speed must be > 20 km/h",
    ),
    "spent_fuel": MessageLookupByLibrary.simpleMessage("Spent Fuel"),
    "startedFrom": MessageLookupByLibrary.simpleMessage("Started from"),
    "statistics": MessageLookupByLibrary.simpleMessage("Statistics"),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "statusActive": MessageLookupByLibrary.simpleMessage("Active"),
    "statusAgoSuffix": MessageLookupByLibrary.simpleMessage("ago"),
    "statusMinutesLabel": MessageLookupByLibrary.simpleMessage("Mins"),
    "statusOneMinuteAgo": MessageLookupByLibrary.simpleMessage("1 Mins ago"),
    "statusUnavailable": MessageLookupByLibrary.simpleMessage("Unavailable"),
    "steps": MessageLookupByLibrary.simpleMessage("Steps"),
    "stopDuration": MessageLookupByLibrary.simpleMessage("Stop Duration"),
    "stop_count": MessageLookupByLibrary.simpleMessage("Stop Count"),
    "stop_duration": MessageLookupByLibrary.simpleMessage("Stop Duration"),
    "stopped": MessageLookupByLibrary.simpleMessage("Stopped"),
    "stoppedAt": MessageLookupByLibrary.simpleMessage("Stopped at"),
    "subscription": MessageLookupByLibrary.simpleMessage("Subscription"),
    "subscriptionActiveTitle": MessageLookupByLibrary.simpleMessage(
      "Active Subscription",
    ),
    "subscriptionDetailsTitle": MessageLookupByLibrary.simpleMessage(
      "Subscriptions Details",
    ),
    "subscriptionExtend": MessageLookupByLibrary.simpleMessage("Extend Plan"),
    "subscriptionPayment": MessageLookupByLibrary.simpleMessage(
      "Subscription Payment",
    ),
    "subscriptionPaymentHistoryTitle": MessageLookupByLibrary.simpleMessage(
      "Payment History",
    ),
    "subscriptionRenew": MessageLookupByLibrary.simpleMessage(
      "Renew Subscription",
    ),
    "success": MessageLookupByLibrary.simpleMessage("Success"),
    "summary": MessageLookupByLibrary.simpleMessage("Summary"),
    "supportTeam": MessageLookupByLibrary.simpleMessage(
      "Our support team is just a tap away.",
    ),
    "tabDevices": MessageLookupByLibrary.simpleMessage("Devices"),
    "tabEvents": MessageLookupByLibrary.simpleMessage("Events"),
    "tabLive": MessageLookupByLibrary.simpleMessage("Live"),
    "tabSettings": MessageLookupByLibrary.simpleMessage("Settings"),
    "take_photo_from_camera": MessageLookupByLibrary.simpleMessage(
      "Take Photo From Camera",
    ),
    "tapToAddFence": MessageLookupByLibrary.simpleMessage(
      "Tap anywhere inside map to add fence",
    ),
    "terrain": MessageLookupByLibrary.simpleMessage("Terrain"),
    "test": MessageLookupByLibrary.simpleMessage("Test"),
    "textMessage": MessageLookupByLibrary.simpleMessage(
      "Text message received",
    ),
    "thisMonth": MessageLookupByLibrary.simpleMessage("This Month"),
    "thisWeek": MessageLookupByLibrary.simpleMessage("This Week"),
    "throttle": MessageLookupByLibrary.simpleMessage("Throttle"),
    "time": MessageLookupByLibrary.simpleMessage("Time"),
    "timestampAndPosition": MessageLookupByLibrary.simpleMessage(
      "Timestamp & Position",
    ),
    "timezone": MessageLookupByLibrary.simpleMessage("Timezone Offset"),
    "title_geofence": MessageLookupByLibrary.simpleMessage("Geofence"),
    "toAddTrackonGps": MessageLookupByLibrary.simpleMessage(
      "To Add your Trackon GPS Device",
    ),
    "today": MessageLookupByLibrary.simpleMessage("Today"),
    "topSpeed": MessageLookupByLibrary.simpleMessage("Top Speed"),
    "totalDistance": MessageLookupByLibrary.simpleMessage("Total Distance"),
    "totalPrice": MessageLookupByLibrary.simpleMessage("Total Price:"),
    "totalRuntime": MessageLookupByLibrary.simpleMessage("Total Runtime"),
    "trackonShop": MessageLookupByLibrary.simpleMessage("Trackon Shop"),
    "trackonShopLabel": MessageLookupByLibrary.simpleMessage("Trackon Shop"),
    "trackonShopValue": MessageLookupByLibrary.simpleMessage(
      "Buy Trackon accessories and devices",
    ),
    "transaction": MessageLookupByLibrary.simpleMessage("Transaction"),
    "trip": MessageLookupByLibrary.simpleMessage("Trip"),
    "tripOdometer": MessageLookupByLibrary.simpleMessage("Trip Odometer"),
    "trip_count": MessageLookupByLibrary.simpleMessage("Trip Count"),
    "tutorialSubtitle": MessageLookupByLibrary.simpleMessage(
      "Learn how to use key features of the app.",
    ),
    "tutorialVideos": MessageLookupByLibrary.simpleMessage("Tutorial Videos"),
    "type": MessageLookupByLibrary.simpleMessage("Type"),
    "unableToLoadLink": MessageLookupByLibrary.simpleMessage(
      "Unable to load link",
    ),
    "unavailable": MessageLookupByLibrary.simpleMessage("Unavailable"),
    "unexpectedError": MessageLookupByLibrary.simpleMessage(
      "Unexpected Error Occurred, Please Try Again",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("Unknown"),
    "unknown_device": MessageLookupByLibrary.simpleMessage("Unknown Device"),
    "unlockEngine": MessageLookupByLibrary.simpleMessage("Unlock"),
    "updateIcon": MessageLookupByLibrary.simpleMessage("Update Icon"),
    "updateVehicleAttributesFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to update vehicle attributes",
    ),
    "urgentHelp": MessageLookupByLibrary.simpleMessage(
      "Need urgent help? Speak directly with our customer care team.",
    ),
    "usageParameters": MessageLookupByLibrary.simpleMessage("Usage Parameters"),
    "userAdmin": MessageLookupByLibrary.simpleMessage("Admin"),
    "userDeviceLimit": MessageLookupByLibrary.simpleMessage("Device Limit"),
    "userDeviceReadonly": MessageLookupByLibrary.simpleMessage(
      "Device Readonly",
    ),
    "userEmail": MessageLookupByLibrary.simpleMessage("Email"),
    "userExpirationTime": MessageLookupByLibrary.simpleMessage("Expiration"),
    "userLimitCommands": MessageLookupByLibrary.simpleMessage("Limit Commands"),
    "userPassword": MessageLookupByLibrary.simpleMessage("Password"),
    "userRemember": MessageLookupByLibrary.simpleMessage("Remember"),
    "userToken": MessageLookupByLibrary.simpleMessage("Token"),
    "userUserLimit": MessageLookupByLibrary.simpleMessage("User Limit"),
    "username": MessageLookupByLibrary.simpleMessage("Username"),
    "vdop": MessageLookupByLibrary.simpleMessage("VDOP"),
    "vehicleActivateStepNote1": MessageLookupByLibrary.simpleMessage(
      "Make sure the vehicle is under open sky exposure during installation",
    ),
    "vehicleActivateStepNote2": MessageLookupByLibrary.simpleMessage(
      "Take the product to any Local Garage near you to get the installation with the help of video/manual/callsupport",
    ),
    "vehicleAddedSuccess": MessageLookupByLibrary.simpleMessage(
      "Vehicle added successfully!",
    ),
    "vehicleAttributesUpdated": MessageLookupByLibrary.simpleMessage(
      "Vehicle attributes updated",
    ),
    "vehicleCannotAccessExpired": MessageLookupByLibrary.simpleMessage(
      "Cannot access expired vehicle.",
    ),
    "vehicleCategoryUpdated": MessageLookupByLibrary.simpleMessage(
      "Vehicle category updated successfully",
    ),
    "vehicleDashboard": MessageLookupByLibrary.simpleMessage("Dashboard"),
    "vehicleExpired": MessageLookupByLibrary.simpleMessage("Vehicle Expired"),
    "vehicleExpiredOn": m6,
    "vehicleIcon": MessageLookupByLibrary.simpleMessage("Vehicle Icon"),
    "vehicleIconUpdated": MessageLookupByLibrary.simpleMessage(
      "Vehicle icon updated successfully",
    ),
    "vehicleIdleMessage": MessageLookupByLibrary.simpleMessage(
      "Vehicle is currently idle. You can proceed with engine lock.",
    ),
    "vehicleIgnition": MessageLookupByLibrary.simpleMessage("Ignition"),
    "vehicleIgnitionOff": MessageLookupByLibrary.simpleMessage("OFF"),
    "vehicleIgnitionOn": MessageLookupByLibrary.simpleMessage("ON"),
    "vehicleInfo": MessageLookupByLibrary.simpleMessage("Vehicle Info"),
    "vehicleList": MessageLookupByLibrary.simpleMessage("Vehicle List"),
    "vehicleLiveTrack": MessageLookupByLibrary.simpleMessage("Live Track"),
    "vehicleModel": MessageLookupByLibrary.simpleMessage("Vehicle Model"),
    "vehicleMoreInfo": MessageLookupByLibrary.simpleMessage("More Info"),
    "vehicleMovingMessage": MessageLookupByLibrary.simpleMessage(
      "Engine Lock cannot be initiated while the vehicle is moving.",
    ),
    "vehicleName": MessageLookupByLibrary.simpleMessage("Vehicle Name"),
    "vehicleNameEmpty": MessageLookupByLibrary.simpleMessage(
      "Vehicle name cannot be empty",
    ),
    "vehicleNameUnchanged": MessageLookupByLibrary.simpleMessage(
      "Name unchanged",
    ),
    "vehicleNameUpdateSuccess": MessageLookupByLibrary.simpleMessage(
      "Vehicle name updated successfully",
    ),
    "vehicleOdometerReading": MessageLookupByLibrary.simpleMessage(
      "Vehicle Odometer Reading",
    ),
    "vehiclePlayback": MessageLookupByLibrary.simpleMessage("Vehicle Playback"),
    "vehicleSetting": MessageLookupByLibrary.simpleMessage("Vehicle Setting"),
    "vehicleSettingSubtitle": MessageLookupByLibrary.simpleMessage(
      "Customize your vehicle performance",
    ),
    "vehicleSettingTitle": MessageLookupByLibrary.simpleMessage(
      "Vehicle Setting",
    ),
    "vehicleState": MessageLookupByLibrary.simpleMessage("Vehicle State"),
    "vehicleStatus": MessageLookupByLibrary.simpleMessage("Status"),
    "vehicleStatusLabel": MessageLookupByLibrary.simpleMessage(
      "Vehicle Status:  ",
    ),
    "vehicleStatusOffline": MessageLookupByLibrary.simpleMessage("Offline"),
    "vehicleStatusOnline": MessageLookupByLibrary.simpleMessage("Online"),
    "vehicleWillExpireOn": m7,
    "verifyAccount": MessageLookupByLibrary.simpleMessage("Verify Account"),
    "verifyOtp": MessageLookupByLibrary.simpleMessage("Verify OTP"),
    "verifyOtpSubtitle": MessageLookupByLibrary.simpleMessage(
      "We sent a code to",
    ),
    "version": MessageLookupByLibrary.simpleMessage("version:"),
    "versionFw": MessageLookupByLibrary.simpleMessage("Firmware Version"),
    "versionHw": MessageLookupByLibrary.simpleMessage("Hardware Version"),
    "vin": MessageLookupByLibrary.simpleMessage("VIN"),
    "voiceMessage": MessageLookupByLibrary.simpleMessage("Voice Message"),
    "voiceMonitoring": MessageLookupByLibrary.simpleMessage("Voice Monitoring"),
    "watchInstallationVideos": MessageLookupByLibrary.simpleMessage(
      "Watch Installation Videos on YouTube:",
    ),
    "watchInstallationVideosOnYoutube": MessageLookupByLibrary.simpleMessage(
      "Watch Installation Videos On Youtube",
    ),
    "welcomeMessage": MessageLookupByLibrary.simpleMessage(
      "You’re almost there - add your first vehicle to get started with Trackon GPS and start tracking & managing your fleet.",
    ),
    "welcomeTrackon": MessageLookupByLibrary.simpleMessage(
      "Welcome to Trackon",
    ),
    "welcomeUser": m8,
    "whatsappChat": MessageLookupByLibrary.simpleMessage(
      "Chat with Us on WhatsApp",
    ),
    "whatsappSubtitle": MessageLookupByLibrary.simpleMessage(
      "Quick support via WhatsApp.",
    ),
    "yes": MessageLookupByLibrary.simpleMessage("Yes"),
    "yes_remove": MessageLookupByLibrary.simpleMessage("Yes, Remove"),
    "yesterday": MessageLookupByLibrary.simpleMessage("Yesterday"),
    "youAreAboutToEnable": MessageLookupByLibrary.simpleMessage(
      "You are about to enable location sharing, allowing your family and friends to see your movements while riding. You will receive a link for device sharing, which you can share across all messaging platforms with your chosen contacts. Please double-check before sharing.",
    ),
    "yourInformation": MessageLookupByLibrary.simpleMessage("Your Information"),
    "yourInformationSubtitle": MessageLookupByLibrary.simpleMessage(
      "Add your details to complete signup.",
    ),
    "your_name": MessageLookupByLibrary.simpleMessage("Your Name"),
  };
}
