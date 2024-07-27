import 'dart:convert';

import 'package:collection/collection.dart';

import 'item.dart';

class Embedded {
  final String? sort;
  final List<Item>? items;
  final int? limit;
  final int? offset;
  final String? path;
  final int? total;

  const Embedded({
    this.sort,
    this.items,
    this.limit,
    this.offset,
    this.path,
    this.total,
  });

  @override
  String toString() {
    return 'Embedded(sort: $sort, items: $items, limit: $limit, offset: $offset, path: $path, total: $total)';
  }

  factory Embedded.fromMap(Map<String, dynamic> data) => Embedded(
        sort: data['sort'] as String?,
        items: (data['items'] as List<dynamic>?)
            ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
            .toList(),
        limit: data['limit'] as int?,
        offset: data['offset'] as int?,
        path: data['path'] as String?,
        total: data['total'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'sort': sort,
        'items': items?.map((e) => e.toMap()).toList(),
        'limit': limit,
        'offset': offset,
        'path': path,
        'total': total,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Embedded].
  factory Embedded.fromJson(String data) {
    return Embedded.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Embedded] to a JSON string.
  String toJson() => json.encode(toMap());

  Embedded copyWith({
    String? sort,
    List<Item>? items,
    int? limit,
    int? offset,
    String? path,
    int? total,
  }) {
    return Embedded(
      sort: sort ?? this.sort,
      items: items ?? this.items,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      path: path ?? this.path,
      total: total ?? this.total,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Embedded) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      sort.hashCode ^
      items.hashCode ^
      limit.hashCode ^
      offset.hashCode ^
      path.hashCode ^
      total.hashCode;
}
