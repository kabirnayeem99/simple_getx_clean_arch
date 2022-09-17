import '../../../domain/entity/post.dart';

class PostUiState {
  bool isLoading = true;
  List<Post> posts = List.empty(growable: true);
  int currentPage = 1;

  PostUiState({
    required this.isLoading,
    required this.posts,
    required this.currentPage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PostUiState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          posts == other.posts &&
          currentPage == other.currentPage);

  @override
  int get hashCode =>
      isLoading.hashCode ^ posts.hashCode ^ currentPage.hashCode;

  @override
  String toString() =>
      "PostUiState{ isLoading: $isLoading, posts: $posts, currentPage: $currentPage,}";

  PostUiState copyWith({
    bool? isLoading,
    List<Post>? posts,
    int? currentPage,
  }) {
    return PostUiState(
      isLoading: isLoading ?? this.isLoading,
      posts: posts ?? this.posts,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'posts': posts,
      'currentPage': currentPage,
    };
  }

  factory PostUiState.fromMap(Map<String, dynamic> map) {
    return PostUiState(
      isLoading: map['isLoading'] as bool,
      posts: map['posts'] as List<Post>,
      currentPage: map['currentPage'] as int,
    );
  }

  factory PostUiState.init() {
    return PostUiState(
      isLoading: true,
      posts: List.empty(),
      currentPage: 1,
    );
  }
}
