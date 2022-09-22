import '../dto/post_db_dto.dart';
import '../providers/database/local_database_service.dart';

class LocalPostsDataSource {
  final LocalDatabaseService _databaseService;

  LocalPostsDataSource(this._databaseService);

  Future<List<PostDbDto>> getAllPosts(int page) async {
    final posts = await _databaseService.getAllPosts();
    return posts;
  }

  Future<void> saveAllPosts(List<PostDbDto> posts) async {
    for (var post in posts) {
      _databaseService.savePost(post);
    }

  }
}
