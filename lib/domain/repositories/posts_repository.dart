import 'package:simple_getx_clean_arch/domain/entity/post.dart';

abstract class PostsRepository {
  Future<List<Post>> getAllPosts();
}
