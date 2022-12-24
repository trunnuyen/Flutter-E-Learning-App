import 'package:online_learning_app/Repository/DBHelper.dart';

class Payment {
  String userkey = DBHelper.auth.currentUser!.uid;
  String cardNumber = "";
  String fullName = "";

//<editor-fold desc="Data Methods">

  Payment({required this.cardNumber, required this.fullName});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Payment &&
          runtimeType == other.runtimeType &&
          userkey == other.userkey &&
          cardNumber == other.cardNumber &&
          fullName == other.fullName);

  @override
  int get hashCode =>
      userkey.hashCode ^ cardNumber.hashCode ^ fullName.hashCode;

  @override
  String toString() {
    return 'Wishlist{ userkey: $userkey, coursekey: $cardNumber, fullName: $fullName}';
  }

  Payment copyWith({
    String? userkey,
    String? coursekey,
  }) {
    return Payment(
      cardNumber: cardNumber,
      fullName: fullName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userkey': userkey,
      'cardNumber': cardNumber,
      'fullName': fullName,
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(cardNumber: map['cardNumber'], fullName: map['fullName']);
  }

//</editor-fold>
}
