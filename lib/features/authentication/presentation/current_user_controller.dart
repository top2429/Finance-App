import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tai/features/authentication/domain/userModel.dart';

class CurrentUserController extends StateNotifier<UserModel> {
  CurrentUserController() : super(UserModel("", "", "", "", 0.0, ""));

  void updateCurrentUser(Map<String, dynamic> userMap) {
    state = UserModel.fromMap(userMap);
  }
}

final currentUserControllerProvider =
    StateNotifierProvider<CurrentUserController, UserModel>((ref) {
  return CurrentUserController();
});
