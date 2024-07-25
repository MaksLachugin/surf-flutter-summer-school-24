import 'dart:convert';

import 'package:flutter/widgets.dart';

class PhotoEntity {
  final String id;
  final String url;
  final DateTime? createdAt;
  PhotoEntity({
    required this.id,
    required this.url,
    this.createdAt,
  });

  PhotoEntity copyWith({
    String? id,
    String? url,
    ValueGetter<DateTime?>? createdAt,
  }) {
    return PhotoEntity(
      id: id ?? this.id,
      url: url ?? this.url,
      createdAt: createdAt != null ? createdAt() : this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'createdAt': createdAt?.millisecondsSinceEpoch,
    };
  }

  factory PhotoEntity.fromMap(Map<String, dynamic> map) {
    return PhotoEntity(
      id: map['id'] ?? '',
      url: map['url'] ?? '',
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PhotoEntity.fromJson(String source) =>
      PhotoEntity.fromMap(json.decode(source));

  @override
  String toString() => 'PhotoEntity(id: $id, url: $url, createdAt: $createdAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhotoEntity &&
        other.id == id &&
        other.url == url &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => id.hashCode ^ url.hashCode ^ createdAt.hashCode;
}
