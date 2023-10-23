import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_messenger/common/models/user_model.dart';

final contactRepoProvider = Provider((ref) {
  return ContactRepo(firestore: FirebaseFirestore.instance);
});

class ContactRepo {
  final FirebaseFirestore firestore;

  ContactRepo({required this.firestore});

  Future<List<List<UserModel>>> getAllContacts() async {
    List<UserModel> firebaseContacts = [];
    List<UserModel> phoneContacts = [];

    try {
      if (await FlutterContacts.requestPermission()) {
        final userCollection = await firestore.collection('users').get();
        final allContactsInThePhone = await FlutterContacts.getContacts(
          withProperties: true,
        );

        bool isContactFound = false;

        for (var contact in allContactsInThePhone) {
          for (var firebaseContactData in userCollection.docs) {
            // log(contact.displayName);
            var firebaseContact = UserModel.fromMap(firebaseContactData.data());
            if (contact.phones.isNotEmpty) {
              if (contact.phones[0].number
                      .replaceAll(' ', '')
                      .replaceAll("-", "") ==
                  firebaseContact.phoneNumber) {
                firebaseContacts.add(firebaseContact);
                isContactFound = true;
                break;
              }
            }
          }
          if (contact.phones.isNotEmpty) {
            if (!isContactFound) {
              phoneContacts.add(
                UserModel(
                    username: contact.displayName,
                    uid: '',
                    profileImageUrl: '',
                    active: false,
                    phoneNumber: contact.phones[0].number.replaceAll(' ', ''),
                    groupId: [],
                    lastSeen: 0),
              );
            }
          }
          isContactFound = false;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return [firebaseContacts, phoneContacts];
  }
}
