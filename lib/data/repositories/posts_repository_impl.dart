import 'dart:math';

import 'package:faker_dart/faker_dart.dart';
import 'package:get/get.dart';

import '../../domain/entity/comment.dart';
import '../../domain/entity/post.dart';
import '../../domain/repositories/posts_repository.dart';
import '../datasources/local_posts_data_source.dart';
import '../datasources/mock_image_data_source.dart';
import '../datasources/remote_posts_data_source.dart';
import '../dto/post_db_dto.dart';

class PostRepositoryImpl extends PostsRepository {
  final RemotePostsDataSource _remotePostsDataSource;
  final LocalPostsDataSource _localPostsDataSource;

  PostRepositoryImpl(this._remotePostsDataSource, this._localPostsDataSource);

  @override
  Future<List<Post>> getAllPosts() async {
    syncPosts();
    int index = 0;
    final postDtos = await _localPostsDataSource.getAllPosts();
    var posts = postDtos.map((dto) {
      index++;
      return Post(
        id: (dto.id ?? Random().nextInt(2003)) + index,
        title: dto.title,
        body: dto.body,
        thumbnail: dto.thumbnail,
        type: dto.type == "text" ? PostType.text : PostType.image,
        likeCount: dto.likeCount,
        commentCount: dto.commentCount,
        isLiked: dto.isLiked,
        comments: List.empty(),
      );
    }).toList();

    if (posts.isEmpty) {
      posts = await getPostsFromServer();
    }
    return posts;
  }

  Future<void> syncPosts() async {
    final posts = await getPostsFromServer();
    _localPostsDataSource.saveAllPosts(posts
        .map(
          (post) => PostDbDto(
              post.id,
              post.title,
              post.body,
              post.thumbnail,
              post.type == PostType.text ? "text" : "image",
              post.likeCount,
              post.commentCount,
              post.isLiked),
        )
        .toList());
  }

  Future<List<Post>> getPostsFromServer() async {
    int index = 0;

    final postDtos = await _remotePostsDataSource.getAllPosts();
    final posts = postDtos.map((dtoItem) {
      index++;
      final commentCount = Random().nextInt(43);
      return Post(
        id: (dtoItem.id ?? Random().nextInt(2003)) + index,
        title: dtoItem.title ?? "",
        body: (dtoItem.body ?? "") + dtoItem.id.toString(),
        type: PostType.text,
        thumbnail: "",
        likeCount: Random().nextInt(459),
        commentCount: commentCount,
        isLiked: Random().nextBool(),
        comments: List.generate(
          commentCount,
          (index) => Comment(
            id: index,
            comment: Faker.instance.lorem
                .sentence(wordCount: Random().nextInt(12) + 2),
            isLiked: Random().nextBool(),
            likeCount: Random().nextInt(29),
          ),
        ),
      );
    }).toList(growable: false);

    final photosDtos = await _remotePostsDataSource.getAllPhotos();
    final photos = photosDtos.map((dtoItem) {
      index++;
      final commentCount = Random().nextInt(43);
      return Post(
        id: (dtoItem.id ?? Random().nextInt(2003)) + index,
        title: (dtoItem.title ?? "") + dtoItem.id.toString(),
        body: "",
        type: PostType.image,
        thumbnail: MockImageDataSource.mockImage(),
        likeCount: Random().nextInt(459),
        commentCount: commentCount,
        isLiked: Random().nextBool(),
        comments: List.generate(
          commentCount,
          (index) => Comment(
            id: index,
            comment: Faker.instance.lorem
                .sentence(wordCount: Random().nextInt(12) + 2),
            isLiked: Random().nextBool(),
            likeCount: Random().nextInt(29),
          ),
        ),
      );
    }).toList(growable: false);

    final size = photos.length < posts.length ? photos.length : posts.length;
    final List<Post> combinedPosts = List.empty(growable: true);

    for (int index = 0; index < size - 1; index++) {
      if (Random().nextBool()) combinedPosts.add(posts[index]);
      if (!Random().nextBool()) combinedPosts.add(photos[index]);
    }
    return combinedPosts;
  }

  @override
  Future<void> toggleLikeOfPost(int postId) async {
    await Future.delayed(1000.milliseconds);
    print("$postId -> post is liked");
  }

  @override
  Future<void> toggleLikeOfPostComment(int postId, int commentId) async {
    await Future.delayed(1000.milliseconds);
    print("$postId -> post's $commentId -> comment is liked");
  }
}
