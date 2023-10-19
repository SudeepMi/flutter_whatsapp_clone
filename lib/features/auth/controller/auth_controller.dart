import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_messenger/features/auth/repository/auth_repo.dart';

final authControllerProivder = Provider((ref) {
  final authRepo = ref.watch(authRepoProvider);
  return AuthController(authRepo: authRepo);
});

class AuthController {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  void sendSmsCode({
    required BuildContext context,
    required String? phoneNumber,
  }) {
    authRepo.sendSmsCode(
      context: context,
      phoneNumber: phoneNumber,
    );
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
