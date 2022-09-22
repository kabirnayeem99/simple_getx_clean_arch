import 'dart:math';

import '../../domain/entity/post.dart';

class PostItemDto {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostItemDto.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

//<editor-fold desc="Data Methods">

  PostItemDto({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PostItemDto &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          id == other.id &&
          title == other.title &&
          body == other.body);

  @override
  int get hashCode =>
      userId.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;

  @override
  String toString() {
    return 'PostItemDto{ userId: $userId, id: $id, title: $title, body: $body,}';
  }

  PostItemDto copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostItemDto(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostItemDto.fromMap(Map<String, dynamic> map) {
    return PostItemDto(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }
}

extension PostItemDtoParsing on PostItemDto {
  Post mapToPost({int index = 0}) {
    return Post(
        id: (id ?? 0) + index,
        title: title ?? "",
        body: body ?? "",
        thumbnail: "",
        type: PostType.text,
        likeCount: Random().nextInt(53),
        commentCount: Random().nextInt(12),
        isLiked: Random().nextBool(),
        comments: List.empty());
  }
}
