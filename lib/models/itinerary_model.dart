class ItineraryModel {
  final int id;
  final int tripId;
  final String? title;
  final DateTime activityTime;
  final String? notes;
  final DateTime? createdAt;

  ItineraryModel({
    required this.id,
    required this.tripId,
    this.title,
    required this.activityTime,
    this.notes,
    this.createdAt,
  });

  factory ItineraryModel.fromJson(Map<String, dynamic> json) {
    return ItineraryModel(
      id: json['id'] as int,
      tripId: json['trip_id'] as int,
      title: json['title'] as String?,
      activityTime: DateTime.parse(json['activity_time']),
      notes: json['notes'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'trip_id': tripId,
      'title': title,
      'activity_time': activityTime.toIso8601String(),
      'notes': notes,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  ItineraryModel copyWith({
    int? id,
    int? tripId,
    String? title,
    DateTime? activityTime,
    String? notes,
    DateTime? createdAt,
  }) {
    return ItineraryModel(
      id: id ?? this.id,
      tripId: tripId ?? this.tripId,
      title: title ?? this.title,
      activityTime: activityTime ?? this.activityTime,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  bool get hasNotes => notes != null && notes!.isNotEmpty;

  String get displayTitle => title ?? 'Untitled Activity';

  bool get isPast => DateTime.now().isAfter(activityTime);
  bool get isUpcoming => DateTime.now().isBefore(activityTime);
}

class NotificationModel {
  final int id;
  final int userId;
  final int itineraryId;
  final DateTime notifyTime;
  final bool isSent;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.itineraryId,
    required this.notifyTime,
    required this.isSent,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      itineraryId: json['itinerary_id'] as int,
      notifyTime: DateTime.parse(json['notify_time']),
      isSent: json['is_sent'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'itinerary_id': itineraryId,
      'notify_time': notifyTime.toIso8601String(),
      'is_sent': isSent,
    };
  }
}
