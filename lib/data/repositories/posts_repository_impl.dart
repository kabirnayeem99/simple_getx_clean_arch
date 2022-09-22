import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:simple_getx_clean_arch/data/dto/photo_item_dto.dart';

import '../../domain/entity/post.dart';
import '../../domain/repositories/posts_repository.dart';
import '../datasources/local_posts_data_source.dart';
import '../datasources/remote_posts_data_source.dart';
import '../dto/post_db_dto.dart';
import '../dto/post_item_dto.dart';

class PostRepositoryImpl extends PostsRepository {
  final RemotePostsDataSource _remotePostsDataSource;
  final LocalPostsDataSource _localPostsDataSource;

  PostRepositoryImpl(this._remotePostsDataSource, this._localPostsDataSource);

  @override
  Future<List<Post>> getAllPosts() async {
    syncPosts();
    int index = 0;
    final postDtoList = await _localPostsDataSource.getAllPosts(1);
    var posts =
        postDtoList.map((dto) => dto.mapToPost(index: index++)).toList();
    if (posts.isEmpty) posts = await compute(getPostsFromServer, 1);

    return posts;
  }

  Future<void> syncPosts() async {
    int index = 1;
    final posts = await getPostsFromServer(1);
    _localPostsDataSource.saveAllPosts(
      posts.map((post) => post.mapToPostDbDto(index: index++)).toList(),
    );
  }

  Future<List<Post>> getPostsFromServer(int page) async {
    final postDtoList = await _remotePostsDataSource.getAllPosts();
    final posts = await compute(_parsePostList, postDtoList);

    final photosDtoList = await _remotePostsDataSource.getAllPhotos();
    final photos = await compute(_parsePhotoList, photosDtoList);

    final size = photos.length < posts.length ? photos.length : posts.length;
    final List<Post> combinedPosts = List.empty(growable: true);

    for (int index = 0; index < size - 1; index++) {
      if (Random().nextBool()) combinedPosts.add(posts[index]);
      if (!Random().nextBool()) combinedPosts.add(photos[index]);
    }

    return combinedPosts;
  }

  Future<List<Post>> _parsePhotoList(List<PhotoItemDto> dtoList) async {
    int index = Random().nextInt(756);
    return dtoList
        .map((dtoItem) => dtoItem.mapToPost(index: index++))
        .toList(growable: false);
  }

  Future<List<Post>> _parsePostList(List<PostItemDto> dtoList) async {
    int index = Random().nextInt(281);
    return dtoList
        .map((dtoItem) => dtoItem.mapToPost(index: index++))
        .toList(growable: false);
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
