import '../dto/user_item_dto.dart';
import '../providers/network/apis/users_api.dart';

class RemoteUserDataSource {
  Future<List<UserItemDto>> getAllUsers() async {
    final List<dynamic> response = await UsersApi.getAllUsers().request();
    final users = response.map((json) => UserItemDto.fromJson(json)).toList();
    return users;
  }
}
