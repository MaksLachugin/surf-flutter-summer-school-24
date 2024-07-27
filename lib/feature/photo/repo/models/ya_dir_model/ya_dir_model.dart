import 'dart:convert';

import 'package:collection/collection.dart';

import 'comment_ids.dart';
import 'embedded.dart';
import 'exif.dart';

class YaDirModel {
  final Embedded? embedded;
  final String? name;
  final Exif? exif;
  final String? resourceId;
  final String? created;
  final String? modified;
  final String? path;
  final CommentIds? commentIds;
  final String? type;
  final int? revision;

  const YaDirModel({
    this.embedded,
    this.name,
    this.exif,
    this.resourceId,
    this.created,
    this.modified,
    this.path,
    this.commentIds,
    this.type,
    this.revision,
  });

  @override
  String toString() {
    return 'YaDirModel(embedded: $embedded, name: $name, exif: $exif, resourceId: $resourceId, created: $created, modified: $modified, path: $path, commentIds: $commentIds, type: $type, revision: $revision)';
  }

  factory YaDirModel.fromMap(Map<String, dynamic> data) => YaDirModel(
        embedded: data['_embedded'] == null
            ? null
            : Embedded.fromMap(data['_embedded'] as Map<String, dynamic>),
        name: data['name'] as String?,
        exif: data['exif'] == null
            ? null
            : Exif.fromMap(data['exif'] as Map<String, dynamic>),
        resourceId: data['resource_id'] as String?,
        created: data['created'] as String?,
        modified: data['modified'] as String?,
        path: data['path'] as String?,
        commentIds: data['comment_ids'] == null
            ? null
            : CommentIds.fromMap(data['comment_ids'] as Map<String, dynamic>),
        type: data['type'] as String?,
        revision: data['revision'] as int?,
      );

  Map<String, dynamic> toMap() => {
        '_embedded': embedded?.toMap(),
        'name': name,
        'exif': exif?.toMap(),
        'resource_id': resourceId,
        'created': created,
        'modified': modified,
        'path': path,
        'comment_ids': commentIds?.toMap(),
        'type': type,
        'revision': revision,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [YaDirModel].
  factory YaDirModel.fromJson(String data) {
    return YaDirModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [YaDirModel] to a JSON string.
  String toJson() => json.encode(toMap());

  YaDirModel copyWith({
    Embedded? embedded,
    String? name,
    Exif? exif,
    String? resourceId,
    String? created,
    String? modified,
    String? path,
    CommentIds? commentIds,
    String? type,
    int? revision,
  }) {
    return YaDirModel(
      embedded: embedded ?? this.embedded,
      name: name ?? this.name,
      exif: exif ?? this.exif,
      resourceId: resourceId ?? this.resourceId,
      created: created ?? this.created,
      modified: modified ?? this.modified,
      path: path ?? this.path,
      commentIds: commentIds ?? this.commentIds,
      type: type ?? this.type,
      revision: revision ?? this.revision,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! YaDirModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      embedded.hashCode ^
      name.hashCode ^
      exif.hashCode ^
      resourceId.hashCode ^
      created.hashCode ^
      modified.hashCode ^
      path.hashCode ^
      commentIds.hashCode ^
      type.hashCode ^
      revision.hashCode;
}
