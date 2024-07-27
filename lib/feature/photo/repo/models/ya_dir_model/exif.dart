import 'dart:convert';

import 'package:collection/collection.dart';

class Exif {
  final String? dateTime;

  const Exif({this.dateTime});

  @override
  String toString() => 'Exif(dateTime: $dateTime)';

  factory Exif.fromMap(Map<String, dynamic> data) => Exif(
        dateTime: data['date_time'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'date_time': dateTime,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Exif].
  factory Exif.fromJson(String data) {
    return Exif.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Exif] to a JSON string.
  String toJson() => json.encode(toMap());

  Exif copyWith({
    String? dateTime,
  }) {
    return Exif(
      dateTime: dateTime ?? this.dateTime,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Exif) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => dateTime.hashCode;
}
