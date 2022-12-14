import 'package:simple_getx_clean_arch/domain/entity/post.dart';

class User {
  int id;
  String name;
  String username;
  List<Post> topPosts;
  bool isFollowing;
  String imageUrl;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.topPosts,
    required this.isFollowing,
    required this.imageUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          username == other.username &&
          topPosts == other.topPosts &&
          isFollowing == other.isFollowing &&
          imageUrl == other.imageUrl);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      username.hashCode ^
      topPosts.hashCode ^
      isFollowing.hashCode ^
      imageUrl.hashCode;

  @override
  String toString() {
    return 'User{ id: $id, name: $name, username: $username, topPosts: $topPosts'
        ', isFollowing: $isFollowing, imageUrl: $imageUrl,}';
  }

  User copyWith({
    int? id,
    String? name,
    String? username,
    List<Post>? topPosts,
    bool? isFollowing,
    String? imageUrl,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      topPosts: topPosts ?? this.topPosts,
      isFollowing: isFollowing ?? this.isFollowing,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'topPosts': topPosts,
      'isFollowing': isFollowing,
      'imageUrl': imageUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      username: map['username'] as String,
      topPosts: map['topPosts'] as List<Post>,
      isFollowing: map['isFollowing'] as bool,
      imageUrl: map['imageUrl'] as String,
    );
  }
}
