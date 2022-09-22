import 'package:simple_getx_clean_arch/domain/entity/post.dart';

abstract class PostsRepository {
  Future<List<Post>> getAllPosts();
  Future<void> toggleLikeOfPost(int postId);
  Future<void> toggleLikeOfPostComment(int postId, int commentId);
}
