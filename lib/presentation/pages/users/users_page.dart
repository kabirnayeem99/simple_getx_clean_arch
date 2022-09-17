import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:get/get.dart';

import '../../controllers/users/user_controller.dart';
import 'widgets/user_grid_item.dart';

class UsersPage extends StatelessWidget {
  UsersPage({super.key});

  final userListController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetX<UserController>(
      init: UserController()..loadUsers(),
      builder: (controller) {
        final uiState = controller.uiState.value;
        if (uiState.isLoading) {
          SVProgressHUD.show();
        } else {
          SVProgressHUD.dismiss();
        }

        return Scaffold(
          body: GridView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.75,
              crossAxisCount: 2,
            ),
            controller: userListController
              ..addListener(
                () => (userListController.position.maxScrollExtent ==
                        userListController.offset)
                    ? controller.loadUsers()
                    : {},
              ),
            itemCount: uiState.users.length,
            itemBuilder: (context, position) {
              final user = uiState.users[position];
              return UserGridItem(user: user);
            },
          ),
        );
      },
    );
  }
}
