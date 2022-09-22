import 'dart:math';

import '../../domain/entity/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/mock_image_data_source.dart';
import '../datasources/remote_user_data_source.dart';

class UserRepositoryImpl extends UserRepository {
  final RemoteUserDataSource _remoteUserDataSource;

  UserRepositoryImpl(this._remoteUserDataSource);

  @override
  Future<List<User>> getUsers() async {
    final userDtos = await _remoteUserDataSource.getAllUsers();
    final users = userDtos
        .map(
          (dto) => User(
            id: dto.id ?? 0,
            name: dto.name ?? "",
            username: dto.username?.toLowerCase() ?? "",
            topPosts: List.empty(),
            isFollowing: Random().nextBool(),
            imageUrl: MockImageDataSource.mockImage(),
          ),
        )
        .toList();
    return users;
  }
}
