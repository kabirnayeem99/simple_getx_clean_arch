import 'package:get/get.dart';
import 'package:simple_getx_clean_arch/domain/repositories/user_repository.dart';

import '../../../domain/entity/user.dart';
import '../../uistates/users/users_ui_state.dart';

class UserController extends GetxController {
  final UserRepository _userRepository;

  UserController(this._userRepository);

  final Rx<UsersUiState> uiState = Rx<UsersUiState>(UsersUiState.init());

  @override
  void onInit() {
    super.onInit();
    loadUsers();
  }

  Future<void> loadUsers() async {
    _loading();
    final users = await _userRepository.getUsers();
    final existingUsers = uiState.value.users.toList(growable: true);
    existingUsers.addAll(users);
    uiState.update((state) => state?.users = existingUsers);
    _unloading();
  }

  Future<void> followUser(int userId) async {
    _loading();
    final existingUsers = List<User>.empty(growable: true);

    for (var user in uiState.value.users) {
      (user.id == userId)
          ? existingUsers.add(user.copyWith(isFollowing: !user.isFollowing))
          : existingUsers.add(user);
    }

    uiState.update((state) => state?.users = existingUsers);
    _unloading();
  }

  void _loading() => uiState.update((state) => state?.isLoading = true);

  void _unloading() => uiState.update((state) => state?.isLoading = false);
}
