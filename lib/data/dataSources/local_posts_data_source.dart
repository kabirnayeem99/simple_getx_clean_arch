import '../dto/post_db_dto.dart';
import '../providers/database/local_database_service.dart';

class LocalPostsDataSource {
  final LocalDatabaseService _databaseService;

  LocalPostsDataSource(this._databaseService);

  Future<List<PostDbDto>> getAllPosts() async {
    final posts = await _databaseService.getAllPosts();
    print(posts.toString());
    return posts;
  }

  Future<void> saveAllPosts(List<PostDbDto> posts) async {
    posts.forEach((post) => _databaseService.savePost(post));
  }
}
