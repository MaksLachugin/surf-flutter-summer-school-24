import 'dart:convert';

import 'package:collection/collection.dart';

class Size {
  final String? url;
  final String? name;

  const Size({this.url, this.name});

  @override
  String toString() => 'Size(url: $url, name: $name)';

  factory Size.fromMap(Map<String, dynamic> data) => Size(
        url: data['url'] as String?,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'url': url,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Size].
  factory Size.fromJson(String data) {
    return Size.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Size] to a JSON string.
  String toJson() => json.encode(toMap());

  Size copyWith({
    String? url,
    String? name,
  }) {
    return Size(
      url: url ?? this.url,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Size) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => url.hashCode ^ name.hashCode;
}
