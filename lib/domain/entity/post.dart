import 'package:simple_getx_clean_arch/domain/entity/comment.dart';

class Post {
  int id;
  String title;
  String body;
  String thumbnail;
  PostType type;
  int likeCount;
  int commentCount;
  bool isLiked;
  List<Comment> comments;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.thumbnail,
    required this.type,
    required this.likeCount,
    required this.commentCount,
    required this.isLiked,
    required this.comments,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Post &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          body == other.body &&
          thumbnail == other.thumbnail &&
          type == other.type &&
          likeCount == other.likeCount &&
          commentCount == other.commentCount &&
          isLiked == other.isLiked);

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      body.hashCode ^
      thumbnail.hashCode ^
      type.hashCode ^
      likeCount.hashCode ^
      commentCount.hashCode ^
      isLiked.hashCode;

  @override
  String toString() {
    return 'Post{ id: $id, title: $title, body: $body, thumbnail: $thumbnail, '
        'type: $type, likeCount: $likeCount, commentCount: $commentCount, '
        'isLiked: $isLiked,}';
  }

  String toUserFriendlyString() {
    return "Check out this post - $title, ${type == PostType.text ? body : thumbnail}";
  }

  Post copyWith({
    int? id,
    String? title,
    String? body,
    String? thumbnail,
    PostType? type,
    int? likeCount,
    int? commentCount,
    bool? isLiked,
    List<Comment>? comments,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      thumbnail: thumbnail ?? this.thumbnail,
      type: type ?? this.type,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
      isLiked: isLiked ?? this.isLiked,
      comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'thumbnail': thumbnail,
      'type': type,
      'likeCount': likeCount,
      'commentCount': commentCount,
      'isLiked': isLiked,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
      thumbnail: map['thumbnail'] as String,
      type: map['type'] as PostType,
      likeCount: map['likeCount'] as int,
      commentCount: map['commentCount'] as int,
      isLiked: map['isLiked'] as bool,
      comments: map['comments'] as List<Comment>,
    );
  }
}

enum PostType {
  image,
  text,
}
