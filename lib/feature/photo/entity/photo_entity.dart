import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class PhotoEntity extends Equatable {
  final String id;
  final String url;
  final DateTime? createdAt;
  final String? smallImageUrl;
  const PhotoEntity({
    required this.id,
    required this.url,
    this.createdAt,
    this.smallImageUrl,
  });

  String get smallerImage => (smallImageUrl != null) ? smallImageUrl! : url;

  PhotoEntity copyWith({
    String? id,
    String? url,
    ValueGetter<DateTime?>? createdAt,
    ValueGetter<String?>? smallImageUrl,
  }) {
    return PhotoEntity(
      id: id ?? this.id,
      url: url ?? this.url,
      createdAt: createdAt != null ? createdAt() : this.createdAt,
      smallImageUrl:
          smallImageUrl != null ? smallImageUrl() : this.smallImageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'smallImageUrl': smallImageUrl,
    };
  }

  factory PhotoEntity.fromMap(Map<String, dynamic> map) {
    return PhotoEntity(
      id: map['id'] ?? '',
      url: map['url'] ?? '',
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : null,
      smallImageUrl: map['smallImageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PhotoEntity.fromJson(String source) =>
      PhotoEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PhotoEntity(id: $id, url: $url, createdAt: $createdAt, smallImageUrl: $smallImageUrl)';
  }

  @override
  List<Object?> get props => [id];
}
