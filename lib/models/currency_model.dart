class CurrencyModel {
  final int id;
  final String code;
  final double rateToIdr;
  final DateTime? updatedAt;

  CurrencyModel({
    required this.id,
    required this.code,
    required this.rateToIdr,
    this.updatedAt,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      id: json['id'] as int,
      code: json['code'] as String,
      rateToIdr: double.parse(json['rate_to_idr'].toString()),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'rate_to_idr': rateToIdr,
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  CurrencyModel copyWith({
    int? id,
    String? code,
    double? rateToIdr,
    DateTime? updatedAt,
  }) {
    return CurrencyModel(
      id: id ?? this.id,
      code: code ?? this.code,
      rateToIdr: rateToIdr ?? this.rateToIdr,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class CurrencyConversion {
  final String from;
  final String to;
  final double amount;
  final double convertedAmount;
  final double rate;

  CurrencyConversion({
    required this.from,
    required this.to,
    required this.amount,
    required this.convertedAmount,
    required this.rate,
  });

  factory CurrencyConversion.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return CurrencyConversion(
      from: data['from'] as String,
      to: data['to'] as String,
      amount: double.parse(data['amount'].toString()),
      convertedAmount: double.parse(data['converted_amount'].toString()),
      rate: double.parse(data['rate'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'to': to,
      'amount': amount,
      'converted_amount': convertedAmount,
      'rate': rate,
    };
  }
}

class ActivityModel {
  final int id;
  final int userId;
  final String activityType;
  final DateTime recordedAt;

  ActivityModel({
    required this.id,
    required this.userId,
    required this.activityType,
    required this.recordedAt,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      activityType: json['activity_type'] as String,
      recordedAt: DateTime.parse(json['recorded_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'activity_type': activityType,
      'recorded_at': recordedAt.toIso8601String(),
    };
  }
}
