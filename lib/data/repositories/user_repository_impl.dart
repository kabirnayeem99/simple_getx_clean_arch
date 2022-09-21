import 'dart:math';

import 'package:simple_getx_clean_arch/data/datasources/mock_image_data_source.dart';
import 'package:simple_getx_clean_arch/data/datasources/remote_user_data_source.dart';
import 'package:simple_getx_clean_arch/domain/entity/user.dart';
import 'package:simple_getx_clean_arch/domain/repositories/user_repository.dart';

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
