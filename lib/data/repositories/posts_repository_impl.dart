import 'dart:math';

import 'package:faker_dart/faker_dart.dart';
import 'package:get/get.dart';
import 'package:simple_getx_clean_arch/data/datasources/mock_image_data_source.dart';

import '../../domain/entity/comment.dart';
import '../../domain/entity/post.dart';
import '../../domain/repositories/posts_repository.dart';
import '../datasources/remote_posts_data_source.dart';

class PostRepositoryImpl extends PostsRepository {
  final RemotePostsDataSource _remotePostsDataSource;

  PostRepositoryImpl(this._remotePostsDataSource);

  @override
  Future<List<Post>> getAllPosts() async {
    final postDtos = await _remotePostsDataSource.getAllPosts();
    final posts = postDtos.map((dtoItem) {
      final commentCount = Random().nextInt(43);
      return Post(
        id: dtoItem.id ?? 0,
        title: dtoItem.title ?? "",
        body: dtoItem.body ?? "",
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
      final commentCount = Random().nextInt(43);
      return Post(
        id: dtoItem.id ?? 0,
        title: dtoItem.title ?? "",
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
      combinedPosts.add(posts[index]);
      combinedPosts.add(photos[index]);
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
