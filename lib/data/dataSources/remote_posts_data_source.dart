import 'package:simple_getx_clean_arch/data/dto/post_item_dto.dart';
import 'package:simple_getx_clean_arch/data/providers/network/apis/posts_api.dart';

class RemotePostsDataSource {
  Future<List<PostItemDto>> getAllPosts() async {
    final List<dynamic> response = await PostsApi.getPosts().request();
    final posts = response.map((json) => PostItemDto.fromJson(json)).toList();
    return posts;
  }
}
