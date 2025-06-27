import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:profile_screens/data/models/card_model.dart';
import 'package:profile_screens/data/models/payment_method.dart';

class FirebaseService {
  final _firestore = FirebaseFirestore.instance;

  Future<void> saveCard(String userId, CardModel card) async {
    if (userId.isEmpty) {
      throw Exception("Invalid user ID");
    }

    // Validate card number length (example: 16 digits)
    if (card.cardNumber.length != 16 || !card.cardNumber.isNumericOnly) {
      throw Exception("Invalid card number");
    }

    // Add more validations as needed...

    await _firestore.collection('users')
      .doc(userId)
      .collection('cards')
      .add(card.toJson()); // Assuming you have a toJson() method in CardModel
  }
  // New method to save without user authentication
  Future<void> saveCardDirectly(CardModel card) async {
    await _firestore.collection('anonymous_cards').add({
      'cardHolderName': card.cardHolderName,
      'cardNumber': card.cardNumber,
      'expiryDate': card.expiryDate,
      'cvv': card.cvv,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
  Future<List<PaymentMethod>> fetchUserCards(String userId) async {
    final snapshot = await _firestore.collection('users')
      .doc(userId).collection('cards')
      .get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return PaymentMethod(
        id: doc.id,
        cardNumber: data['cardNumber'],
        cardHolderName: data['cardHolderName'],
      );
    }).toList();
  }
}
