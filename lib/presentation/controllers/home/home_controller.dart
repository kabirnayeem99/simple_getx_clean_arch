import 'package:get/get.dart';

import '../../uistates/home/home_ui_state.dart';

class HomeController extends GetxController {
  final uiState = Rx<HomeUiState>(HomeUiState.init());

  void changeTabToPosition({int position = 0}) {
    // uiState.update((state) {
    //   state?.tab = HomePageTab.values[position];
    //   state?.position = position;
    // });
    uiState.value.tab = HomePageTab.values[position];
    uiState.value.position = position;
  }
}
