import 'package:simple_getx_clean_arch/data/dto/photo_item_dto.dart';
import 'package:simple_getx_clean_arch/data/dto/post_item_dto.dart';
import 'package:simple_getx_clean_arch/data/providers/network/apis/images_api.dart';
import 'package:simple_getx_clean_arch/data/providers/network/apis/posts_api.dart';

class RemotePostsDataSource {
  Future<List<PostItemDto>> getAllPosts() async {
    final List<dynamic> postResponse = await PostsApi.getPosts().request();
    final posts =
        postResponse.map((json) => PostItemDto.fromJson(json)).toList();

    return posts;
  }

  Future<List<PhotoItemDto>> getAllPhotos() async {
    final List<dynamic> photoResponse = await PhotosApi.getPhotos().request();
    final List<PhotoItemDto> photos =
        photoResponse.map((json) => PhotoItemDto.fromJson(json)).toList();

    return photos;
  }
}
