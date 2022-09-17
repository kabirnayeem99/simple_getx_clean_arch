import 'package:get/get.dart';

import '../../../domain/entity/user.dart';
import '../../uistates/users_ui_state.dart';

class UserController extends GetxController {
  final Rx<UsersUiState> uiState = Rx<UsersUiState>(UsersUiState.init());

  Future<void> loadUsers() async {
    uiState.update((state) {
      state?.isLoading = false;
      state?.users = User.mockUsers();
    });
  }
}
