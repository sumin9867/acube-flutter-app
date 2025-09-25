class Command {
  String? deviceId;
  String? type;
  Map<String, dynamic>? attributes;
  bool? textChannel;
  String? description;

  Command({this.deviceId, this.type, this.attributes, this.textChannel, this.description});

  Command.fromJson(Map<String, dynamic> json) {
    deviceId = json['deviceId']?.toString();
    type = json['type'];
    attributes = json['attributes'];
    textChannel = json['textChannel'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() => {
        'deviceId': deviceId,
        'type': type,
        'attributes': attributes,
        'textChannel': textChannel,
        'description': description
      };
}
