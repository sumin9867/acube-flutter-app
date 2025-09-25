class SearchLocationModel {
  final double latitude;
  final double longitude;
  final String displayName;
  final Map<String, dynamic> address; // make it non-nullable

  SearchLocationModel({
    required this.latitude,
    required this.longitude,
    required this.displayName,
    required this.address,
  });

  factory SearchLocationModel.fromJson(Map<String, dynamic> json) {
    return SearchLocationModel(
      latitude: double.parse(json['lat'].toString()),
      longitude: double.parse(json['lon'].toString()),
      displayName: json['display_name'] ?? 'No name',
      address: json['address'] != null
          ? Map<String, dynamic>.from(json['address'])
          : {'note': 'No address found'}, // default map
    );
  }
}
