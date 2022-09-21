import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

import '../../controllers/users/user_controller.dart';
import 'widgets/user_grid_item.dart';

class UsersPage extends StatelessWidget {
  UsersPage({super.key});

  final userListController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetX<UserController>(
      init: Get.find<UserController>(),
      builder: (controller) {
        final uiState = controller.uiState.value;

        uiState.isLoading ? SVProgressHUD.show() : SVProgressHUD.dismiss();

        return Scaffold(
          floatingActionButton: FloatingActionButton.small(
            onPressed: () => userListController.animateTo(
              0,
              duration: 600.milliseconds,
              curve: Curves.easeInCirc,
            ),
            child: const Icon(
              UniconsLine.angle_up,
              color: Colors.white,
            ),
          ),
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
