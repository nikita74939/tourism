import 'destination_model.dart';
import 'itinerary_model.dart';

class TripModel {
  final int id;
  final int userId;
  final int destinationId;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime? createdAt;
  final DestinationModel? destination;
  final List<ItineraryModel>? itineraries;

  TripModel({
    required this.id,
    required this.userId,
    required this.destinationId,
    required this.startDate,
    required this.endDate,
    this.createdAt,
    this.destination,
    this.itineraries,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      destinationId: json['destination_id'] as int,
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      destination: json['Destination'] != null
          ? DestinationModel.fromJson(json['Destination'])
          : null,
      itineraries: json['Itineraries'] != null
          ? (json['Itineraries'] as List)
              .map((e) => ItineraryModel.fromJson(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'destination_id': destinationId,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
      'Destination': destination?.toJson(),
      'Itineraries': itineraries?.map((e) => e.toJson()).toList(),
    };
  }

  TripModel copyWith({
    int? id,
    int? userId,
    int? destinationId,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? createdAt,
    DestinationModel? destination,
    List<ItineraryModel>? itineraries,
  }) {
    return TripModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      destinationId: destinationId ?? this.destinationId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      createdAt: createdAt ?? this.createdAt,
      destination: destination ?? this.destination,
      itineraries: itineraries ?? this.itineraries,
    );
  }

  int get durationInDays {
    return endDate.difference(startDate).inDays + 1;
  }

  bool get isUpcoming {
    return DateTime.now().isBefore(startDate);
  }

  bool get isOngoing {
    final now = DateTime.now();
    return now.isAfter(startDate) && now.isBefore(endDate);
  }

  bool get isPast {
    return DateTime.now().isAfter(endDate);
  }

  String get status {
    if (isUpcoming) return 'upcoming';
    if (isOngoing) return 'ongoing';
    return 'past';
  }

  String get statusLabel {
    if (isUpcoming) return 'Upcoming';
    if (isOngoing) return 'Ongoing';
    return 'Completed';
  }

  int get itineraryCount => itineraries?.length ?? 0;

  String get destinationName => destination?.name ?? 'Unknown';
  String get destinationCity => destination?.city ?? '';
}
