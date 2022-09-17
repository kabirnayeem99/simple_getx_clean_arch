import 'package:get/get.dart';

import '../../../core/utility/utility.dart';
import '../../../domain/entity/user.dart';
import '../../uistates/users/users_ui_state.dart';

class UserController extends GetxController {
  final Rx<UsersUiState> uiState = Rx<UsersUiState>(UsersUiState.init());

  Future<void> loadUsers() async {
    _loading();
    Future.delayed(Duration(seconds: mockSeconds())).then((_) {
      final existingUsers = uiState.value.users.toList(growable: true);
      existingUsers.addAll(User.mockUsers());
      _unloading();

      uiState.update((state) => state?.users = existingUsers);
    });
  }

  Future<void> followUser(int userId) async {
    _loading();
    Future.delayed(Duration(seconds: mockSeconds())).then((_) {
      final existingUsers = List<User>.empty(growable: true);

      for (var user in uiState.value.users) {
        if (user.id == userId) {
          existingUsers.add(user.copyWith(isFollowing: !user.isFollowing));
        } else {
          existingUsers.add(user);
        }
      }
      uiState.update((state) => state?.users = existingUsers);
      _unloading();
    });
  }

  void _loading() => uiState.update((state) => state?.isLoading = true);

  void _unloading() => uiState.update((state) => state?.isLoading = false);
}
