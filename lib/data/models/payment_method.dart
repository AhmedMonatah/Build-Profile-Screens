class PaymentMethod {
  final String id;
  final String cardNumber;
  final String cardHolderName;

  PaymentMethod({required this.id, required this.cardNumber, required this.cardHolderName});

  Map<String, dynamic> toMap() => {
    'id': id,
    'cardNumber': cardNumber,
    'cardHolderName': cardHolderName,
  };
}
