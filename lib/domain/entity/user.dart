import 'dart:math';

import 'package:simple_getx_clean_arch/domain/entity/post.dart';

class User {
  int id;
  String name;
  String username;
  List<Post> topPosts;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.topPosts,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          username == other.username &&
          topPosts == other.topPosts);

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ username.hashCode ^ topPosts.hashCode;

  @override
  String toString() {
    return 'User{ id: $id, name: $name, username: $username, topPosts: $topPosts,}';
  }

  User copyWith({
    int? id,
    String? name,
    String? username,
    List<Post>? topPosts,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      topPosts: topPosts ?? this.topPosts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'topPosts': topPosts,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      username: map['username'] as String,
      topPosts: map['topPosts'] as List<Post>,
    );
  }

  static User mockUser() {
    return User(
      id: Random().nextInt(1000),
      name: "Naimul Kabir",
      username: "kabirnayeem99",
      topPosts: Post.mockPosts().take(3).toList(),
    );
  }

  static List<User> mockUsers() {
    return List.generate(20, (index) => mockUser());
  }
}
