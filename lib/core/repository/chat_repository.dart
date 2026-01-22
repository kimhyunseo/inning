import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inning/core/model/chat_message.dart';

class ChatRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<ChatMessage>> watchMessages(String stadiumId) {
    return firestore
        .collection('chatrooms')
        .doc(stadiumId)
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((doc) {
            return ChatMessage.fromJson(doc.id, doc.data());
          }).toList(),
        );
  }

  Future<void> sendMessage(String stadiumId, ChatMessage message) async {
    await firestore
        .collection('chatrooms')
        .doc(stadiumId)
        .collection('messages')
        .add(message.toJson());
  }
}
