import 'package:flutter/foundation.dart';

import '../dto/user_item_dto.dart';
import '../providers/network/apis/users_api.dart';

class RemoteUserDataSource {
  Future<List<UserItemDto>> getAllUsers() async {
    final List<dynamic> response = await UsersApi.getAllUsers().request();
    final List<UserItemDto> users = await compute(_parseUsers, response);
    return users;
  }

  Future<List<UserItemDto>> _parseUsers(List<dynamic> response) async {
    return response.map((json) => UserItemDto.fromJson(json)).toList();
  }
}
