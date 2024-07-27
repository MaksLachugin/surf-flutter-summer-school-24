import 'dart:convert';

import 'package:collection/collection.dart';

class CommentIds {
  final String? privateResource;
  final String? publicResource;

  const CommentIds({this.privateResource, this.publicResource});

  @override
  String toString() {
    return 'CommentIds(privateResource: $privateResource, publicResource: $publicResource)';
  }

  factory CommentIds.fromMap(Map<String, dynamic> data) => CommentIds(
        privateResource: data['private_resource'] as String?,
        publicResource: data['public_resource'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'private_resource': privateResource,
        'public_resource': publicResource,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CommentIds].
  factory CommentIds.fromJson(String data) {
    return CommentIds.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CommentIds] to a JSON string.
  String toJson() => json.encode(toMap());

  CommentIds copyWith({
    String? privateResource,
    String? publicResource,
  }) {
    return CommentIds(
      privateResource: privateResource ?? this.privateResource,
      publicResource: publicResource ?? this.publicResource,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CommentIds) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => privateResource.hashCode ^ publicResource.hashCode;
}
