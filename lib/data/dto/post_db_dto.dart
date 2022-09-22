const String tablePosts = "posts";

class PostDbFields {
  static const String id = "_id";
  static const String title = "title";
  static const String body = "body";
  static const String thumbnail = "thumbnail";
  static const String type = "type";
  static const String likeCount = "likeCount";
  static const String commentCount = "commentCount";
  static const String isLiked = "isLiked";

  static const List<String> values = [
    id,
    title,
    body,
    thumbnail,
    type,
    likeCount,
    commentCount,
    isLiked
  ];
}

class PostDbDto {
  int? id;
  String title;
  String body;
  String thumbnail;
  String type;
  int likeCount;
  int commentCount;
  bool isLiked;

  // List<Comment> comments;

  PostDbDto(
    this.id,
    this.title,
    this.body,
    this.thumbnail,
    this.type,
    this.likeCount,
    this.commentCount,
    this.isLiked,
  );

  Map<String, dynamic> toMap() {
    final map = {
      '_id': id,
      'title': title,
      'body': body,
      'thumbnail': thumbnail,
      'type': type,
      'likeCount': likeCount,
      'commentCount': commentCount,
      'isLiked': isLiked ? 1 : 0,
      // 'comments': comments,
    };
    print(map.toString());
    return map;
  }

  factory PostDbDto.fromMap(Map<String, dynamic> map) {
    final postDto = PostDbDto(
      map['id'] as int?,
      map['title'] as String,
      map['body'] as String,
      map['thumbnail'] as String,
      map['type'] as String,
      map['likeCount'] as int,
      map['commentCount'] as int,
      map['isLiked'] == 1,
      // map['comments'] as List<Comment>,
    );
    print(postDto.toString());
    return postDto;
  }

  @override
  String toString() {
    return 'PostDbDto{id: $id, title: $title, body: $body, thumbnail: $thumbnail, '
        'type: $type, likeCount: $likeCount, commentCount: $commentCount, isLiked: $isLiked}';
  }
}
