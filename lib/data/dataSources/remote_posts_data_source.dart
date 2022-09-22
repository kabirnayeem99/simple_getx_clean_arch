import 'package:flutter/foundation.dart';
import 'package:simple_getx_clean_arch/data/dto/photo_item_dto.dart';
import 'package:simple_getx_clean_arch/data/dto/post_item_dto.dart';
import 'package:simple_getx_clean_arch/data/providers/network/apis/images_api.dart';
import 'package:simple_getx_clean_arch/data/providers/network/apis/posts_api.dart';

class RemotePostsDataSource {
  Future<List<PostItemDto>> getAllPosts() async {
    final List<dynamic> postResponse = await PostsApi.getPosts().request();
    final posts = await compute(_parsePostItemDtos, postResponse);
    return posts;
  }

  Future<List<PostItemDto>> _parsePostItemDtos(
      List<dynamic> postResponse) async {
    return postResponse
        .map((json) => PostItemDto.fromJson(json))
        .take(10)
        .toList();
  }

  Future<List<PhotoItemDto>> getAllPhotos() async {
    final List<dynamic> photoResponse = await PhotosApi.getPhotos().request();
    final List<PhotoItemDto> photos =
        await compute(_parsePhotoItemDtos, photoResponse);
    return photos;
  }

  Future<List<PhotoItemDto>> _parsePhotoItemDtos(
      List<dynamic> photoResponse) async {
    return photoResponse
        .map((json) => PhotoItemDto.fromJson(json))
        .take(10)
        .toList();
  }
}
