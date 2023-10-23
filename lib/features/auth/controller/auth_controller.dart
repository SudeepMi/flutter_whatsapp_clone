import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_messenger/common/models/user_model.dart';
import 'package:whatsapp_messenger/features/auth/repository/auth_repo.dart';

final authControllerProivder = Provider((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return AuthController(authRepo: authRepo, ref: ref);
});

final userInfoAuthProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProivder);
  return authController.getCurrentUserInfo();
});

class AuthController {
  final AuthRepo authRepo;
  final ProviderRef ref;

  AuthController({required this.ref, required this.authRepo});

  void sendSmsCode({
    required BuildContext context,
    required String? phoneNumber,
  }) {
    authRepo.sendSmsCode(
      context: context,
      phoneNumber: phoneNumber,
    );
  }

  void updateUserPresence() {
    return authRepo.updateUserPresence();
  }

  Stream<UserModel> getUserPresenceStatus({required String uid}) {
    return authRepo.getUserPresenceStatus(uid: uid);
  }

  void saveUserInfoToFirestore({
    required String username,
    required var profileImage,
    required BuildContext context,
    required bool mounted,
  }) {
    authRepo.saveUserInfoToFirestore(
      username: username,
      profileImage: profileImage,
      context: context,
      mounted: mounted,
    );
  }

  Future<UserModel?> getCurrentUserInfo() async {
    UserModel? user = await authRepo.getCurrentUserInfo();
    return user;
  }

  void verifySmsCode({
    required BuildContext context,
    required String smsCodeId,
    required String smsCode,
    required bool mounted,
  }) {
    authRepo.verifySmsCode(
      context: context,
      smsCodeId: smsCodeId,
      smsCode: smsCode,
      mounted: mounted,
    );
  }
}
