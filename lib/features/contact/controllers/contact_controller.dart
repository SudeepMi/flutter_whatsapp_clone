import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_messenger/features/contact/repository/contact_repo.dart';

final contactsControllerProvider = FutureProvider(
  (ref) {
    final contactsRepository = ref.watch(contactRepoProvider);
    return contactsRepository.getAllContacts();
  },
);
