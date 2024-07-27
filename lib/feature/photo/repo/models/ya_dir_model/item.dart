import 'dart:convert';

import 'package:collection/collection.dart';

import 'comment_ids.dart';
import 'exif.dart';
import 'size.dart';

class Item {
  final String? antivirusStatus;
  final String? photosliceTime;
  final CommentIds? commentIds;
  final String? name;
  final Exif? exif;
  final String? created;
  final int? size;
  final String? resourceId;
  final String? modified;
  final String? mimeType;
  final List<Size>? sizes;
  final String? file;
  final String? mediaType;
  final String? preview;
  final String? path;
  final String? sha256;
  final String? type;
  final String? md5;
  final int? revision;

  const Item({
    this.antivirusStatus,
    this.photosliceTime,
    this.commentIds,
    this.name,
    this.exif,
    this.created,
    this.size,
    this.resourceId,
    this.modified,
    this.mimeType,
    this.sizes,
    this.file,
    this.mediaType,
    this.preview,
    this.path,
    this.sha256,
    this.type,
    this.md5,
    this.revision,
  });

  @override
  String toString() {
    return 'Item(antivirusStatus: $antivirusStatus, photosliceTime: $photosliceTime, commentIds: $commentIds, name: $name, exif: $exif, created: $created, size: $size, resourceId: $resourceId, modified: $modified, mimeType: $mimeType, sizes: $sizes, file: $file, mediaType: $mediaType, preview: $preview, path: $path, sha256: $sha256, type: $type, md5: $md5, revision: $revision)';
  }

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        antivirusStatus: data['antivirus_status'] as String?,
        photosliceTime: data['photoslice_time'] as String?,
        commentIds: data['comment_ids'] == null
            ? null
            : CommentIds.fromMap(data['comment_ids'] as Map<String, dynamic>),
        name: data['name'] as String?,
        exif: data['exif'] == null
            ? null
            : Exif.fromMap(data['exif'] as Map<String, dynamic>),
        created: data['created'] as String?,
        size: data['size'] as int?,
        resourceId: data['resource_id'] as String?,
        modified: data['modified'] as String?,
        mimeType: data['mime_type'] as String?,
        sizes: (data['sizes'] as List<dynamic>?)
            ?.map((e) => Size.fromMap(e as Map<String, dynamic>))
            .toList(),
        file: data['file'] as String?,
        mediaType: data['media_type'] as String?,
        preview: data['preview'] as String?,
        path: data['path'] as String?,
        sha256: data['sha256'] as String?,
        type: data['type'] as String?,
        md5: data['md5'] as String?,
        revision: data['revision'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'antivirus_status': antivirusStatus,
        'photoslice_time': photosliceTime,
        'comment_ids': commentIds?.toMap(),
        'name': name,
        'exif': exif?.toMap(),
        'created': created,
        'size': size,
        'resource_id': resourceId,
        'modified': modified,
        'mime_type': mimeType,
        'sizes': sizes?.map((e) => e.toMap()).toList(),
        'file': file,
        'media_type': mediaType,
        'preview': preview,
        'path': path,
        'sha256': sha256,
        'type': type,
        'md5': md5,
        'revision': revision,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory Item.fromJson(String data) {
    return Item.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());

  Item copyWith({
    String? antivirusStatus,
    String? photosliceTime,
    CommentIds? commentIds,
    String? name,
    Exif? exif,
    String? created,
    int? size,
    String? resourceId,
    String? modified,
    String? mimeType,
    List<Size>? sizes,
    String? file,
    String? mediaType,
    String? preview,
    String? path,
    String? sha256,
    String? type,
    String? md5,
    int? revision,
  }) {
    return Item(
      antivirusStatus: antivirusStatus ?? this.antivirusStatus,
      photosliceTime: photosliceTime ?? this.photosliceTime,
      commentIds: commentIds ?? this.commentIds,
      name: name ?? this.name,
      exif: exif ?? this.exif,
      created: created ?? this.created,
      size: size ?? this.size,
      resourceId: resourceId ?? this.resourceId,
      modified: modified ?? this.modified,
      mimeType: mimeType ?? this.mimeType,
      sizes: sizes ?? this.sizes,
      file: file ?? this.file,
      mediaType: mediaType ?? this.mediaType,
      preview: preview ?? this.preview,
      path: path ?? this.path,
      sha256: sha256 ?? this.sha256,
      type: type ?? this.type,
      md5: md5 ?? this.md5,
      revision: revision ?? this.revision,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Item) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      antivirusStatus.hashCode ^
      photosliceTime.hashCode ^
      commentIds.hashCode ^
      name.hashCode ^
      exif.hashCode ^
      created.hashCode ^
      size.hashCode ^
      resourceId.hashCode ^
      modified.hashCode ^
      mimeType.hashCode ^
      sizes.hashCode ^
      file.hashCode ^
      mediaType.hashCode ^
      preview.hashCode ^
      path.hashCode ^
      sha256.hashCode ^
      type.hashCode ^
      md5.hashCode ^
      revision.hashCode;
}
