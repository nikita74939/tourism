class DestinationModel {
  final int id;
  final String name;
  final String? description;
  final double? latitude;
  final double? longitude;
  final String? city;
  final String? imageUrl;
  final DateTime? createdAt;
  final double? distance; // For nearby destinations

  DestinationModel({
    required this.id,
    required this.name,
    this.description,
    this.latitude,
    this.longitude,
    this.city,
    this.imageUrl,
    this.createdAt,
    this.distance,
  });

  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    return DestinationModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      latitude: json['latitude'] != null
          ? double.parse(json['latitude'].toString())
          : null,
      longitude: json['longitude'] != null
          ? double.parse(json['longitude'].toString())
          : null,
      city: json['city'] as String?,
      imageUrl: json['image_url'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      distance: json['distance'] != null
          ? double.parse(json['distance'].toString())
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'city': city,
      'image_url': imageUrl,
      'created_at': createdAt?.toIso8601String(),
      'distance': distance,
    };
  }

  DestinationModel copyWith({
    int? id,
    String? name,
    String? description,
    double? latitude,
    double? longitude,
    String? city,
    String? imageUrl,
    DateTime? createdAt,
    double? distance,
  }) {
    return DestinationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      city: city ?? this.city,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      distance: distance ?? this.distance,
    );
  }

  bool get hasCoordinates => latitude != null && longitude != null;

  String get displayCity => city ?? 'Unknown City';

  String get displayImage => imageUrl ?? 'https://via.placeholder.com/400x300';
}
