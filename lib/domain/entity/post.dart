import 'dart:math';

class Post {
  int id;
  String title;
  String body;
  String thumbnail;
  PostType type;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    required this.thumbnail,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Post &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          body == other.body &&
          type == other.type &&
          thumbnail == other.thumbnail);

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      body.hashCode ^
      type.hashCode ^
      thumbnail.hashCode;

  @override
  String toString() {
    return 'Post{ id: $id, title: $title, body: $body, type: $type, thumbnail: $thumbnail}';
  }

  Post copyWith({
    int? id,
    String? title,
    String? body,
    PostType? type,
    String? thumbnail,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      type: type ?? this.type,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'type': type,
      'thumbnail': thumbnail,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
      type: map['type'] as PostType,
      thumbnail: map['thumbnail'] as String,
    );
  }

  static List<Post> mockPosts() {
    return List.generate(10, (index) => mockPost());
  }

  static Post mockPost() {
    bool isText = Random().nextBool();
    PostType type = isText ? PostType.text : PostType.image;
    int id = Random().nextInt(1000);
    String title = "Title";
    String body = isText
        ? "Random text. Random text. Random text. Random text. Random text. "
        : "";
    String thumbnail = isText
        ? ""
        : "https://1.bp.blogspot.com/_6A8j2EQmANk/TIYKEoNKAwI/AAAAAAAAMXQ/NlGPm2xoadc/s400/natural+beauty+in+green+color8.jpg";
    return Post(
      id: id,
      title: title,
      body: body,
      thumbnail: thumbnail,
      type: type,
    );
  }
}

enum PostType {
  image,
  text,
}
