// ignore_for_file: file_names

class GeofencePermModel extends Object {
  String? deviceId;
  int? geofenceId;

  GeofencePermModel({deviceId, geofenceId});

  GeofencePermModel.fromJson(Map<String, dynamic> json) {
    deviceId = json['deviceId'];
    geofenceId = json['geofenceId'];
  }

  Map<String, dynamic> toJson() => {
        'deviceId': deviceId,
        'geofenceId': geofenceId,
      };
}
