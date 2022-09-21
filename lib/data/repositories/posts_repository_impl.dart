import 'package:simple_getx_clean_arch/data/datasources/remote_posts_data_source.dart';
import 'package:simple_getx_clean_arch/domain/entity/post.dart';
import 'package:simple_getx_clean_arch/domain/repositories/posts_repository.dart';

class PostRepositoryImpl extends PostsRepository {
  final RemotePostsDataSource _remotePostsDataSource;

  PostRepositoryImpl(this._remotePostsDataSource);

  @override
  Future<List<Post>> getAllPosts() async {
    final postDtos = await _remotePostsDataSource.getAllPosts();
    final posts = postDtos
        .map((dtoItem) => Post(
              id: dtoItem.id ?? 0,
              title: dtoItem.title ?? "",
              body: dtoItem.body ?? "",
              type: PostType.text,
              thumbnail: "",
            ))
        .toList();
    return posts;
  }
}
